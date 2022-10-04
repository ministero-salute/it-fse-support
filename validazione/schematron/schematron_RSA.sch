<!-- schematron versione:7.3-->
<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
		xmlns:cda="urn:hl7-org:v3"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:sch="http://www.ascc.net/xml/schematron"
        queryBinding="xslt2">
	<title>Schematron Referto di Specialistica Ambulatoriale </title>
	<ns prefix="hl7" uri="urn:hl7-org:v3"/>
	<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<pattern id="all">


<!--_______________________________________________________________HEADER _____________________________________________________________-->
	
		<!-- ClinicalDocument -->
		<rule context="hl7:ClinicalDocument">
	        <!--Controllo realmCode-->	
			<assert test="count(hl7:realmCode)>=1"
			>ERRORE-1| L'elemento <name/> DEVE avere almeno un elemento 'realmCode'</assert>
			<assert test="count(hl7:realmCode[@code='IT'])= 1"
			>ERRORE-2| L'elemento <name/>/realmCode' DEVE avere l'attributo @code valorizzato con 'IT'</assert>
			
			<!--Controllo templateId-->
			<assert test="count(hl7:templateId)>=1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.9.1'])= 1 and  count(hl7:templateId/@extension)= 1"
			>ERRORE-4| Almeno un elemento <name/>/templateId DEVE essere valorizzato attraverso l'attributo @root='2.16.840.1.113883.2.9.10.1.9.1' (id del template nazionale), associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>

			<!--Controllo code-->	
			<assert test="count(hl7:code[@code='11488-4'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-5| L'elemento <name/>/code DEVE essere valorizzato con l'attributo @code='11488-4' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
	
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName=' Nota di consulto'])=1 or
			count(hl7:code[@displayName='NOTA DI CONSULTO'])=1 or count(hl7:code[@displayName='Nota di Consulto'])=1 or count(hl7:code[@displayName='Nota di consulto'])=1 or count(hl7:code[@displayName='nota di consulto'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Nota di consulto'--> </report>
			
			<!--Controllo confidentialityCode-->
			<assert test="(count(hl7:confidentialityCode[@code='N'][@codeSystem='2.16.840.1.113883.5.25'])= 1) or 
			(count(hl7:confidentialityCode[@code='V'][@codeSystem='2.16.840.1.113883.5.25'])= 1)"
			>ERRORE-6| L'elemento <name/>/confidentialityCode DEVE avere l'attributo @code valorizzato con 'N' o 'V', e il @codeSystem='2.16.840.1.113883.5.25'</assert>
			
			<!--Controllo languageCode-->	
			<assert test="count(hl7:languageCode)=1"
			>ERRORE-7| L'elemento <name/> DEVE contenere un solo elemento 'languageCode' </assert>
			
			<!--Controllo incrociato tra setId-versionNumber e relatedDocument-->
			<let name="versionNumber" value="hl7:versionNumber/@value"/>
			<assert test="(string(number($versionNumber)) = 'NaN') or
					($versionNumber= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
			>ERRORE-8| Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del ClinicalDocument.id 
			deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori di setId ed id per un documento clinico possono coincidere solo per la prima versione di un documento</assert>
			<assert test="(string(number($versionNumber)) ='NaN') or
						  ($versionNumber=1) or 
						  (($versionNumber &gt;1) and count(hl7:relatedDocument)=1)"
			>ERRORE-9| Se l'attributo <name/>/versionNumber/@value è maggiore di 1, l'elemento <name/> DEVE contenere un elemento di tipo 'relatedDocument'</assert>
			
			<!--Controllo recordTarget-->
			<assert test="count(hl7:recordTarget)=1"
			>ERRORE-10| L'elemento <name/> DEVE contenere un solo elemento 'recordTarget' </assert>
			
			<!--Controllo recordTarget/patientRole/id-->
			<!--report test="not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1 and
			not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.7'])=1) and 
			not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.3'])=1) and 
			not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.18'])=1) and 
			not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.17'])=1) and
			not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.15'])=1)"
			>W002| Si si consiglia di valorizzare l'elemento recordTarget/patientRole/id  con una  delle seguenti informazioni:
			CF 2.16.840.1.113883.2.9.4.3.2
			TEAM 2.16.840.1.113883.2.9.4.3.7 o 2.16.840.1.113883.2.9.4.3.3
			ENI 2.16.840.1.113883.2.9.4.3.18
			STP 2.16.840.1.113883.2.9.4.3.17
			ANA 2.16.840.1.113883.2.9.4.3.15.
			</report-->
			
			<!--Controllo recordTarget/patientRole/addr-->
			<let name="num_addr" value="count(hl7:recordTarget/hl7:patientRole/hl7:addr)"/>
			
			<assert test="$num_addr=0 or (count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:country)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:city)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:streetAddressLine)=$num_addr)"
			>ERRORE-11| L'elemento <name/>/recordTarget/patientRole/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<!--Controllo recordTarget/patientRole/patient/name-->
			<let name="patient" value="hl7:recordTarget/hl7:patientRole/hl7:patient"/>
			
			<assert test="count($patient)=1 "
			>ERRORE-12| L'elemento <name/>/recordTaget/patientRole DEVE contenere l'elemento patient</assert>
			<assert test="count($patient)=0 or count($patient/hl7:name)=1"
			>ERRORE-13| L'elemento <name/>/recordTaget/patientRole/patient DEVE contenere l'elemento 'name'</assert>
			<assert test="count($patient)=0 or (count($patient/hl7:name/hl7:given)=1 and count($patient/hl7:name/hl7:family)=1)"
			>ERRORE-14| L'elemento <name/>/recordTaget/patientRole/patient/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			<!--Controllo recordTarget/patientRole/patient/administrativeGenderCode-->
			<let name="genderOID" value="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@codeSystem"/>
			
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode)=1"
			>ERRORE-15| L'elemento <name/>/recordTarget/patientRole/patient DEVE contenere l'elemento administrativeGenderCode </assert>
			<assert test="$genderOID='2.16.840.1.113883.5.1'"
			>ERRORE-16| L'OID assegnato all'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@codeSystem='<value-of select="$genderOID"/>' non è corretto. L'attributo DEVE essere valorizzato con '2.16.840.1.113883.5.1' </assert>
			
			<!--Controllo recordTarget/patientRole/patient/birthTime-->
			<assert test="count($patient)=0 or
			(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2' or 
			@root='2.16.840.1.113883.2.9.4.3.7' or @root='2.16.840.1.113883.2.9.4.3.3' or 
			@root='2.16.840.1.113883.2.9.4.3.17'])=0) or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthTime)=1"
			>ERRORE-17| L'elemento <name/>/recordTaget/patientRole/patient DEVE riportare un elemento 'birthTime'</assert>
			
			<!--Controllo recordTarget/patientRole/patient/birthplace/place/addr-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace)=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace/hl7:place/hl7:addr)=1"
			>ERRORE-18| L'elemento <name/>/recordTarget/patientRole/patient/birthplace DEVE contenere un elemento place/addr </assert>	
			
			<!--Controllo author/assignedAuthor/id-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-19| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo author/assignedAuthor/telecom-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:telecom)>=1"
			>ERRORE-20| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'telecom'</assert>
			
			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:author/hl7:assignedAuthor/hl7:assignedPerson"/>
			
			<assert test="count($name_author/hl7:name)=1"
			>ERRORE-21| L'elemento <name/>/author/assignedAuthor/assignedPerson DEVE avere l'elemento 'name' </assert>
			<assert test="count($name_author/hl7:name)=0 or (count($name_author/hl7:name/hl7:given)=1 and count($name_author/hl7:name/hl7:family)=1)"
			>ERRORE-22| L'elemento <name/>/author/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
			
			<!--Controllo dataEnterer-->	
			<assert test="count(hl7:dataEnterer)=0 or count(hl7:dataEnterer/hl7:time)=1"
			>ERRORE-23| L'elemento <name/>/dataEnterer se presente, DEVE contenere un elemento 'time'</assert>
			
			<let name="id_dataEnterer" value="hl7:dataEnterer/hl7:assignedEntity/hl7:id"/>
			
			<assert test="count(hl7:dataEnterer)=0 or count($id_dataEnterer[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-24| L'elemento <name/>/dataEnterer/assignedEntity DEVE avere almeno un elemento 'id' <value-of select="$id_dataEnterer"/> con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo dataEnterer/assignedEntity/assignedPerson-->
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			
			<assert test="count(hl7:dataEnterer)=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1)"
			>ERRORE-25| L'elemento <name/>/dataEnterer/assignedEntity DEVE riportare l'elemento 'assignedPerson/name'</assert>
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-26| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>	
			

			<!--Controllo custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-27| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and
			count($addr_cust/hl7:city)=$num_addr_cust and 
			count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-28| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>
			
			 <!--Controllo legalAuthenticator-->
			<assert test = "count(hl7:legalAuthenticator)=1" 
			>ERRORE-29| L'elemento <name/>/legalAuthenticator è obbligatorio </assert>
			<assert test = "count(hl7:legalAuthenticator)=0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])=1" 
			>ERRORE-30| L'elemento <name/>/legalAuthenticator/signatureCode deve essere valorizzato con il codice "S" </assert>
			<assert test = "count(hl7:legalAuthenticator)=0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-31| L'elemento <name/>/legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-32| L'elemento <name/>/legalAuthenticator/assignedEntity/assignedPerson DEVE contenere l'elemento 'name'</assert>
			<assert test = "count(hl7:legalAuthenticator)=0 or (count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and 
			count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-33| L'elemento <name/>/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			<!--Controllo participant-->
			<assert test="count(hl7:participant)=0 or count(hl7:participant/hl7:associatedEntity/hl7:id)>=1"
			>ERRORE-34| L'elemento <name/>/participant/associatedEntity deve contenere almeno un elemento 'id'</assert>
			
			<let name="num_addr_pcp" value="count(hl7:participant/hl7:associatedEntity/hl7:addr)"/>
            <let name="addr_pcp" value="hl7:participant/hl7:associatedEntity/hl7:addr"/>
			
            <assert test="$num_addr_pcp=0 or (count($addr_pcp/hl7:country)=$num_addr_pcp and
                           count($addr_pcp/hl7:city)=$num_addr_pcp and
                            count($addr_pcp/hl7:streetAddressLine)=$num_addr_pcp)"
            >ERRORE-35| L'elemento <name/>/participant/associatedEntity/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<assert test="count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson)=0 or count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name)=1"
			>ERRORE-36| L'elemento <name/>/participant/associatedEntity/associatedPerson deve contenere l'elemento 'name'</assert>
			<assert test="count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson)=0 
			or(count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:family)=1 and count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-37| L'elemento <name/>/participant/associatedEntity/associatedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
			
			
			<!--Controllo ClinicalDocument/inFulfillmentOf-->
			<assert test ="count(hl7:inFulfillmentOf/hl7:order/hl7:priorityCode)=0 or count(hl7:inFulfillmentOf/hl7:order/hl7:priorityCode[@codeSystem='2.16.840.1.113883.5.7'][@code='R' or @code='P' or @code='UR' or @code='EM'])=1" 
			>ERRORE-38| <name/>/infulfillmentOf/order/priorityCode DEVE avere l'attributo '@codeSystem='2.16.840.1.113883.5.7' e @code valorizzato con uno dei seguenti valori: 'R'|'P'|'UR'|'EM' </assert>
			
			<!--Controllo componentOf-->
			<assert test="count(hl7:componentOf)=1"
			>ERRORE-39| L'elemento <name/>/componentOf è obbligatorio </assert>
			<assert test="(count(hl7:componentOf)=0 or count(hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility)=1)"
			>ERRORE-40| L'elemento <name/>/componentOf/encompassingEncounter/location/healthcareFacility deve essere presente </assert>
			<assert test="count(hl7:componentOf)=0 or count(hl7:componentOf/hl7:encompassingEncounter/hl7:location)=1"
			>ERRORE-41| L'elemento <name/>/componentOf/encompassingEncounter DEVE contenere l'elemento 'location'</assert>
			<assert test="count(hl7:componentOf)=0 or count(hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:asOrganizationPartOf)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:asOrganizationPartOf/hl7:id)=1"
			>ERRORE-42| L'elemento <name/>/componentOf/encompassingEncounter/location/healthcareFacility/serviceProviderOrganization/asOrganizationPartOf, se presente deve contenere l'elemento 'id' </assert>	
		</rule>
		
		
		
		
<!--____________________________________________________CONTROLLI GENERICI_________________________________________________________________-->
	
		<!--Controllo use Telecom-->
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>ERRORE-43| L’elemento 'telecom' DEVE contenere l'attributo @use </assert>
		</rule>	
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension, '[A-Z0-9]{16}')"
			>ERRORE-44| Il codice fiscale '<value-of select="$CF"/>' cittadino ed operatore deve essere costituito da 16 cifre [A-Z0-9]{16}</assert>
		</rule>
	
		<!--Controllo sugli attributi di observation-->
		<rule context="//hl7:observation">
			<let name="moodCd" value="@moodCode"/>
			<assert test="count(@classCode)=1"
			>ERRORE-45| L'attributo "@classCode" dell'elemento "observation" deve essere presente </assert>
			<assert test="$moodCd='EVN'"
			>ERRORE-46| L'attributo "@moodCode" dell'elemento "observation" deve essere valorizzato con "EVN" </assert>
		</rule>

		<!--Verifica che i codici ActStatusActiveCompletedAborteSuspended utilizzati siano corretti-->
        <rule context="//hl7:statusCode">
            <let name="val_status" value="@code"/>
            <assert test="$val_status='active' or  $val_status='completed' or $val_status='aborted' or $val_status='suspended'"
            >Errore 47| Codice ActStatus '<value-of select="$val_status"/>' errato! L'attributo @code deve essere valorizzato con "active", "completed", "aborted", "suspended"
            </assert>
        </rule>
		
		<!--Verifica che i codici relativi al CodeSystem "UCUM" utilizzati siano corretti-->
		<!--rule context="//*[@unit]">
			<let name="val_UCUM" value="@unit"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.4.642.3.912.xml')//el[@code=$val_UCUM]"
			>ERRORE-50| Codice UCUM <value-of select="$val_UCUM"/> errato
			</assert>
		</rule-->
		
<!--__________________________________________________BODY__________________________________________________________________________-->

		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody">
		<!--Controlli sulle sezioni obbligatorie-->
			<!--1-->
			<!--Sezione Prestazioni-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='62387-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b1| Sezione Prestazioni: la sezione DEVE essere presente</assert>		
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='62387-6'][@codeSystem='2.16.840.1.113883.6.1'])=0 or count(hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:text)=1"
			>ERRORE-b2| Sezione Prestazioni: la sezione DEVE contenere un elemento 'text'</assert>
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='62387-6'][@codeSystem='2.16.840.1.113883.6.1'])=0 or count(hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:entry)>=1"  
			>ERRORE-b3| Sezione Prestazioni: la sezione DEVE contenere un elemento 'entry'</assert>
		
			<!--2-->
			<!--Sezione Referto-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='47045-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b4| Sezione Referto: la sezione DEVE essere presente</assert>		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47045-0']]/hl7:text)=1"
			>ERRORE-b5| Sezione Referto: la sezione DEVE contenere un elemento 'text'</assert>
		
		<!--Controlli sulle sezioni opzionali-->
			<!--3-->
			<!--Sezione Quesito Diagnostico-->	
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29299-5']])=0 or count(hl7:component/hl7:section[hl7:code[@code='29299-5']]/hl7:text)=1"
			>ERRORE-b6| Sezione Quesito Diagnostico: la sezione DEVE contenere un elemento 'text'</assert>
			
			<!--4-->
			<!--Sezione Storia Clinica-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11329-0']])=0 or count(hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:text)=1"
			>ERRORE-b7| Sezione Storia Clinica: la sezione DEVE contenere un elemento 'text'</assert>

			<!--Controllo cardinalità sotto-sezioni-->
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component[hl7:section/hl7:code[@code='48765-2']])&lt;=1)"
			>ERRORE-b8| Sezione Storia Clinica: la sezione può contenere al massimo una sotto-sezione "Allergie"</assert>	
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section/hl7:code[@code='48765-2'])=0) or 
			(count(hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:text)=1)"
			>ERRORE-b9| Sezione Storia Clinica: la sotto-sezione Allergie DEVE contenere un elemento 'text'</assert>	
			
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component[hl7:section/hl7:code[@code='10160-0']])&lt;=1)"
			>ERRORE-b10| Sezione Storia Clinica: la sezione può contenere al massimo una sotto-sezione "Terapia Farmacologica in Atto"</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section/hl7:code[@code='10160-0'])=0) or 
			(count(hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:text)=1)"
			>ERRORE-b11| Sezione Storia Clinica: la sotto-sezione Terapia Farmacologica in Atto DEVE contenere un elemento 'text'</assert>
		
			<!--5-->
			<!--Sezione Precedenti Esami Eseguiti-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:text)=1"
			>ERRORE-b12| Sezione Precedenti Esami Eseguiti: la sezione DEVE contenere un elemento 'text'</assert>
				
			<!--6-->
			<!--Sezione Esame obiettivo-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29545-1']])=0 or count(hl7:component/hl7:section[hl7:code[@code='29545-1']]/hl7:text)=1"
			>ERRORE-b13| Sezione Esame obiettivo: la sezione DEVE contenere un elemento 'text'</assert>
			
			<!--7-->
			<!--Sezione Confronto Con Precedenti Esami Eseguiti -->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='93126-1']])=0 or count(hl7:component/hl7:section[hl7:code[@code='93126-1']]/hl7:text)=1"
			>ERRORE-b14| Sezione Confronto Con Precedenti Esami Eseguiti: la sezione DEVE contenere un elemento 'text'</assert>
			
			<!--8-->
			<!--Sezione Diagnosi-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29548-5']])=0 or count(hl7:component/hl7:section[hl7:code[@code='29548-5']]/hl7:text)=1"
			>ERRORE-b15| Sezione Diagnosi: la sezione DEVE contenere un elemento 'text'</assert>
			
			<!--9-->
			<!-- Sezione Conclusioni-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='55110-1']])=0 or count(hl7:component/hl7:section[hl7:code[@code='55110-1']]/hl7:text)=1"
			>ERRORE-b16| Sezione Conclusioni: la sezione DEVE contenere un elemento 'text'</assert>
						
			<!--10-->
			<!--Sezione Suggerimenti per il medico prescrittore-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='62385-0']])=0 or count(hl7:component/hl7:section[hl7:code[@code='62385-0']]/hl7:text)=1"
			>ERRORE-b17| Sezione Suggerimenti per il medico prescrittore: la sezione DEVE contenere un elemento 'text'</assert>

			<!--11-->
			<!-- sezione Accertamenti e controlli consigliati-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='80615-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='80615-8']]/hl7:text)=1"
			>ERRORE-b18| Sezione Accertamenti e controlli consigliati: la sezione DEVE contenere un elemento 'text'</assert>
			
			<!--12-->
			<!-- Sezione Terapia farmacologica consigliata-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='93341-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='93341-6']]/hl7:text)=1"
			>ERRORE-b19| Sezione Terapia farmacologica consigliata: la sezione DEVE contenere un elemento 'text'</assert>		
		</rule>
		
		<!--Controllo sui codici delle sezioni-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section">
			<let name="codice" value="hl7:code/@code"/>
			<assert test="count(hl7:code[@code='29299-5'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='11329-0'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='30954-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 
			or count(hl7:code[@code='29545-1'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='62387-6'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='93126-1'][@codeSystem='2.16.840.1.113883.6.1'])=1 
			or count(hl7:code[@code='47045-0'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='29548-5'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='55110-1'][@codeSystem='2.16.840.1.113883.6.1'])=1  
			or count(hl7:code[@code='62385-0'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='80615-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='93341-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b20| Il codice '<value-of select="$codice"/>' non è corretto. La sezione deve essere valorizzata con uno dei seguenti codici:
			29299-5	Sezione Quesito Diagnostico
			11329-0	Sezione Storia Clinica
			30954-2	Sezione Precedenti Esami Eseguiti
			29545-1	Sezione Esame Obiettivo
			62387-6	Sezione Prestazioni
			93126-1	Sezione Confronto Con Precedenti Esami Eseguiti
			47045-0	Sezione Referto
			29548-5 Sezione Diagnosi
			55110-1	Sezione Conclusioni
			62385-0	Sezione Suggerimenti Per Il Medico Prescrittore 
			80615-8 Sezione Accertamenti e Controlli Consigliati 
			93341-6 Sezione Terapia Farmacologica Consigliata
			</assert>
		</rule>			
		
		<!--3-->
		<!--Sezione Quesito diagnostico: controllo sulla entry -->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29299-5']]/hl7:entry">
			<assert test="count(hl7:observation/hl7:code[@code='29298-7'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b21| Sezione Quesito Diagnostico: l'elemento entry/observation/code deve avere l'attributo @code='29298-7' e l'attributo @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-b22| Sezione Quesito Diagnostico: l'elemento entry/observation/value DEVE avere attributo @codeSystem valorizzato con l'OID del sistema di codifica ICD-9-CM </assert>	
		</rule>
		
		<!--4-->
		<!--Sezione Storia Clinica: dettaglio Anamnesi Patologica e Fisiologica(entry/observation) -->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry">
			
			<!--controllo sui sotto elementi di entry-->
			<assert test="count(hl7:observation)=1 or count(hl7:organizer)=1"
			>ERRORE-b23| Sezione Storia Clinica: l'elemento 'entry' deve avere uno dei seguenti sotto elementi:
			- 'observation': per l'Anamnesi patologica e fisiologica;
			- 'organizer': per l'Anamnesi familiare.</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:code[@code='75326-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b24| Sezione Storia Clinica: l'elemento entry/observation/code deve avere l'attributo @code='75326-9' e l'attributo @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b25| Sezione Storia Clinica: l'elemento entry/observation/statusCode deve avere l'attributo @code='completed'</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b26| Sezione Storia Clinica: l'elemento entry/observation/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato</assert>
			<assert test="(count(hl7:observation)=0 or count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code[@code='33999-4']])=0) or 
			(count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@code='LA18632-2'])=1 and 
			count(hl7:observation/hl7:effectiveTime/hl7:high)=1) or count(hl7:observation/hl7:effectiveTime/hl7:high)=1"
			>ERRORE-b27| Sezione Storia Clinica: l'elemento entry/observation/effectiveTime deve essere presente e deve avere l'elemento 'high' valorizzato nel caso in cui il problema non sia più presente</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-b28| Sezione Storia Clinica: l'elemento entry/observation/value deve avere l'attributo @xsi:type="CD" </assert>
			<assert test="count(hl7:observation)=0 or (count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1)
			or (count(hl7:observation/hl7:value/@code)=1 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)&lt;=1)"
			>ERRORE-b29| Sezione Storia Clinica: nel caso di entry/observation/value non codificato, deve essere valorizzato l'elemento 'originalText/reference'</assert>
			<assert test="count(hl7:observation)=0 or (count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='89261-2']])&lt;=1)"
			>ERRORE-b30| Sezione Storia Clinica: l'entry/observation può contenere al più una entryRelationship relativa alla Cronicità della patologia </assert>
			<assert test="count(hl7:observation)=0 or (count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='33999-4']])&lt;=1)"
			>ERRORE-b31| Sezione Storia Clinica: l'entry/observation può contenere al più una 'entryRelationship' relativa allo Stato Clinico del problema </assert>
		
		<!--Sezione Storia Clinica: dettaglio Anamnesi familiare(entry/organizer)-->
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer[@classCode='CLUSTER'])=1 and count(hl7:organizer/@moodCode)=1"
			>ERRORE-b32| Sezione Storia Clinica: l'elemento entry/organizer deve avere gli attributi @classCode='CLUSTER' e @moodCode </assert>
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:code[@code='10157-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b33| Sezione Storia Clinica: l'elemento entry/organizer/code deve avere gli attributi @code='10157-6' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b34| Sezione Storia Clinica: l'elemento entry/organizer/statusCode deve avere l'attributo @code='completed'</assert>
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:effectiveTime)=1"
			>ERRORE-b35| Sezione Storia Clinica: l'elemento entry/organizer/effectiveTime deve essere presente</assert>
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:subject/hl7:relatedSubject[@classCode='PRS'])=1 and 
			count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:code[@codeSystem='2.16.840.1.113883.5.111'])=1"
			>ERRORE-b36| Sezione Storia Clinica: l'elemento entry/organizer/subject/relatedSubject deve avere l'attributo @classCode='PRS' e deve contenere l'elemento 'code'</assert>
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:component)>=1"
			>ERRORE-b37| Sezione Storia Clinica: l'elemento entry/organizer deve contenere almeno un elemento component di tipo observation </assert>
		</rule>
		
		<!--Sezione Storia Clinica: dettaglio anamnesi del familiare in oggetto (entry/organizer/component/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:organizer/hl7:component">
		
			<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b38| Sezione Storia Clinica: l'elemento entry/organizer/component/observation/code deve avere l'attributo @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b39| Sezione Storia Clinica: l'elemento entry/organizer/component/observation/statusCode deve avere l'attributo @code='completed'</assert>
			<assert test="count(hl7:observation/hl7:effectiveTime)=1"
			>ERRORE-b40| Sezione Storia Clinica: l'elemento entry/organizer/component/observation/effectiveTime deve essere presente </assert>
			<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-b41| Sezione Storia Clinica: l'elemento entry/organizer/component/observation/value deve essere presente e valorizzato secondo il @codeSystem='2.16.840.1.113883.6.103' </assert>
			<assert test="count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='35267-4']])&lt;=1"
			>ERRORE-b42| Sezione Storia Clinica: l'elemento entry/organizer/component/observation può contenere una entryRelationship relativa all'Età di insorgenza o di morte </assert>
			<assert test="count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code!='35267-4']])=1 and 
			count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='39016-1']])=1 and 
			count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code[@code='39016-1']]/hl7:value)=1"
			>ERRORE-b43| Sezione Storia Clinica: l'elemento entry/organizer/component/observation/entryRelationship/observation deve avere il code valorizzato con @code='39016-1' e deve contenere un elemento 'value'</assert>
		</rule>	
	
		<!--Sezione Storia Clinica: cronicità della patologia\stato clinico del problema (entry/observation/entryRelationship/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:observation/hl7:entryRelationship">
			
			<assert test="(count(hl7:observation/hl7:code[@code='89261-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1)"
			>ERRORE-b44| Sezione Storia Clinica: l'elemento entry/observation/entryRelationship/observation/code deve avere l'attributo @code valorizzato con:
			"89261-2" per "Cronicità patologia";
			"33999-4" per "Stato clinico patologia"
			</assert>
			<assert test="count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value)=0 or 
			(count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10'])=1)"
			>ERRORE-b45| Sezione Storia Clinica: l'elemento entry/observation/entryRelationship/observation/value relativo alla Cronicità deve essere valorizzato secondo il Value set "CronicitàProblema"</assert>
			<!--per il controllo inerente il sistema di codifica da utilizzare, c'è la possibilità di usare anche sistemi di codifica locali-->
			<assert test="count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value)=0 or 
			(count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.7'])=1)"
			>ERRORE-b46| Sezione Storia Clinica: l'elemento entry/observation/entryRelationship/observation/value relativo allo Stato Clinico della patologia deve essere valorizzato secondo il Value set "StatoClinicoProblema"</assert>
		</rule>
		
		<!--4.1-->
		<!--Sotto-sezione Allergie-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry">
		
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
			>ERRORE-b47| Sotto-sezione Allergie: la sezione deve contenere un elemento entry di tipo 'act'con attributi @classCode='ACT' e @moodCode='EVN'</assert>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b48| Sotto-sezione  Allergie: l'elemento entry/act/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato</assert>
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="count(hl7:act/hl7:statusCode)=0 or ($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
			($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
			($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
			($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-b49| Sotto-sezione  Allergie: l'elemento entry/act/effectiveTime/high deve essere presente nel caso in cui lo 'statusCode' sia 'completed'oppure'aborted'</assert>
			<!--Sotto-sezione Allergie: osservazione Allergia o Intolleranza(entry/act/entryRelationship/observation)-->
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:code[@code='52473-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b50| Sotto-sezione Allergie: l'entry/act deve includere uno ed un solo elemento entryRelationship/observation con attributo @code='52473-6' e @codeSystem='2.16.840.1.113883.6.1</assert>	
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:text)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:text/hl7:reference/@value)=1"
			>ERRORE-b51| Sotto-sezione Allergie: l'entry/act/entryRelationship/observation/text se presente, ha l'attributo reference/@value valorizzato con l'URI che punta alla descrizione di allarme, allergia o intolleranza nel narrative block della sezione </assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b52| Sotto-sezione Allergie: l'elemento entry/act/entryRelationship/observation/statusCode/@code deve assumere il valore costante 'completed'</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b53| Sotto-sezione Allergie: l'elemento entry/act/entryRelationship/observation/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato </assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-b54| Sotto-sezione Allergie: l'elemento entry/act/entryRelationship/observation/value deve avere l'attributo @xsi:type='CD'</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.4'])=1"
			>ERRORE-b55| Sotto-sezione Allergie: l'elemento entry/act/entryRelationship/observation/value codificato, deve avere l'attributo @code valorizzato secondo il value set "ObservationIntoleranceType" - @codeSystem='2.16.840.1.113883.5.4'</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=0 and 
			count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText/hl7:reference/@value)=1) or 
			(hl7:act/hl7:entryRelationship/count(hl7:observation/hl7:value/@code)=1 and 
			count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText/hl7:reference/@value)&lt;=1)"
			>ERRORE-b56| Sotto-sezione Allergie: l'elemento entry/act/entryRelationship/observation/value non codificato, deve avere l'elemento originalText/reference/@value valorizzato, altrimenti l'elemento originalText/reference può non essere presente</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant)>=1"
			>ERRORE-b57| Sotto-sezione Allergie: entry/act/entryRelationship/observation deve contenere almeno un elemento 'participant'</assert>				
			<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])&lt;=1)"
			>ERRORE-b58| Sotto-sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/observation' relativo alla Criticità</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])&lt;=1)"
			>ERRORE-b59| Sotto-sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/observation' relativo allo Stato dell'allergia</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])&lt;=1)"
			>ERRORE-b60| Sotto-sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/act' relativo ai Commenti</assert>
		</rule>
		
			<!--Sotto-sezione Allergie: descrizione agente codificato(entry/act/entryRelationship/observation/participant)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant">
		
			<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
			count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2'])=1"
			>ERRORE-b61| Sotto-sezione Allergie (descrizione agente codificato): l'elemento entry/act/entryRelationship/observation/participant/participantRole/playingEntity deve avere l'attributo code/@codeSystem valorizzato come segue:
			- 2.16.840.1.113883.6.73		codifica "WHO ATC"
			- 2.16.840.1.113883.2.9.6.1.5 		codifica "AIC"
			- 2.16.840.1.113883.2.9.77.22.11.2 	value set "AllergenNoDrugs" (- per le allergie non a farmaci –)
			</assert>
		</rule>
	
			<!--Sotto-sezione Allergie: descrizione reazione (entry/act/entryRelationship/observation/entryRelationship[MFST]/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='MFST']">	
			
			<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b62| Sotto-sezione Allergie (descrizione reazione): entry/act/entryRelationship/observation/entryRelationship/observation deve avere un elemento 'code' con gli attributi @code=75321-0' e @codeSystem='2.16.840.1.113883.6.1' </assert>
			<assert test="count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b63| Sotto-sezione Allergie (descrizione reazione): entry/act/entryRelationship/observation/entryRelationship/observation deve avere un 'effectiveTime' che contiene l'elemento 'low' valorizzato </assert>
			<!--Descrizione reazione codificata-->
			<assert test="count(hl7:observation/hl7:value)=0 or	count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-b64| Sotto-sezione Allergie (descrizione reazione): l'elemento entry/act/entryRelationship/observation/entryRelationship/observation/value deve avere l'attributo @xsi:type='CD'</assert>
			<assert test="count(hl7:observation/hl7:value)=0 or
						(count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1) or
						(count(hl7:observation/hl7:value/@code)=1 and (count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)&lt;=1))"
			>ERRORE-b65| Sotto-sezione Allergie (descrizione reazione): nel caso di entry/act/entryRelationship/observation/entryRelationship/observation/value non codificato, questi deve avere l'elemento originalText/reference valorizzato</assert>
			<assert test="count(hl7:observation/hl7:value/@code)=0 or
						(count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.4'])=1 or 
						count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3'])=1 or 
						count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1)"
			>ERRORE-b66| Sotto-sezione Allergie (descrizione reazione): entry/act/entryRelationship/observation/entryRelationship/observation/value deve avere l'attributo @codeSystem valorizzato come segue:
			- "2.16.840.1.113883.2.9.77.22.11.4" per le reazioni da allergia 
			- "2.16.840.1.113883.2.9.77.22.11.3" per le reazioni da intolleranza 
			- "2.16.840.1.113883.6.103" per le reazioni riportate nel sistema ICD-9-CM
			</assert>
		</rule>
		
			<!--Sotto-sezione Allergie: Criticità dell'allergia o intolleranza (entry/act/entryRelationship/observation/entryRelationship[SUBJ]/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation]">
					
			<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1"
			>ERRORE-b67| Sotto-sezione Allergie (criticità dell'allergia o intolleranza): entry/act/entryRelationship/observation/entryRelationship/observation/code deve avere l'attributo @codesystem='2.16.840.1.113883.5.4'</assert>
			<assert test="count(hl7:observation/hl7:text)=0 or count(hl7:observation/hl7:text/hl7:reference/@value)=1"
			>ERRORE-b68| Sotto-sezione Allergie (criticità dell'allergia o intolleranza): entry/act/entryRelationship/observation/entryRelationship/observation/text/reference/value deve essere valorizzato con l'URI che punta alla descrizione della severità nel narrative block della sezione </assert>	
			<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.1063'])=1"
			>ERRORE-b69| Sotto-sezione Allergie (criticità dell'allergia o intolleranza): entry/act/entryRelationship/observation/entryRelationship/observation/value deve essere valorizzato secondo il value set "CriticalityObservation" @codesystem='2.16.840.1.113883.5.1063'</assert>	
		</rule>
			
			<!--Sotto-sezione Allergie: Stato dell'Allergia (entry/act/entryRelationship/observation/entryRelationship[REFR]/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR']">
			
			<assert test="count(hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b70| Sotto-sezione Allergie (stato dell'allergia): entry/act/entryRelationship/observation/entryRelationship/observation/code deve avere l'attributo @code='33999-4' e @codesystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b71| Sotto-sezione Allergie (stato dell'allergia): entry/act/entryRelationship/observation/entryRelationship/observation/value deve essere valorizzato secondo il value set "StatoClinicoAllergia" (@codesystem='2.16.840.1.113883.6.1')</assert>
		</rule>
	
			<!--Sotto-sezione Allergie: commenti (entry/act/entryRelationship/observation/entryRelationship/act)-->	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act]">
			
			<assert test="count(hl7:act/hl7:code[@code='48767-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b72| Sotto-sezione Allergie (commenti): l'elemento entry/act/entryRelationship/observation/entryRelationship/act deve contenere l'elemento act con attributi @code='48767-8' e @codeSystem='2.16.840.1.113883.6.1'</assert>
		</rule>
		
		<!--4.2-->
		<!--Sotto-sezione Terapia farmacologica in atto-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry">
		
			<assert test="count(hl7:substanceAdministration[@classCode='SBADM'][@moodCode='EVN'])=1"
			>ERRORE-b73| Sotto-sezione Terapia farmacologica in atto: la sezione deve contenere un elemento substanceAdministration con attributi @classCode='SBADM' e @moodCode='EVN'</assert>
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial)=1"
			>ERRORE-b74| Sotto-sezione Terapia farmacologica in atto: la sezione deve contenere un elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial </assert>
			
			<let name="man_mat" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
			count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1"
			>ERRORE-b75| Sotto-sezione Terapia farmacologica in atto: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial deve contenere un elemento 'code' il cui @codeSystem deve essere valorizzato secondo i seguenti sistemi di codifica:
			@codeSystem='2.16.840.1.113883.6.73'		(ATC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.5' 	(AIC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.51' 	(GE)
			</assert>
			<assert test="count($man_mat/hl7:code/hl7:translation)=0 or 
			(count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or 
			count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1 or
			count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
			count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1 or
			count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
			count($man_mat/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1)"
			>ERRORE-b76| Sotto-sezione Terapia farmacologica in atto: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation deve essere valorizzato secondo i seguenti sistemi di codifica:
			@codeSystem='2.16.840.1.113883.6.73'		(ATC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.5' 	(AIC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.51' 	(GE)</assert>
		</rule>
		
		<!--5-->
		<!--Sezione Precedenti esami eseguiti-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry">
			
			<assert test="count(hl7:observation)=1"
			>ERRORE-b77| Sezione Precedenti esami eseguiti: l'elemento entry DEVE contenere una observation</assert>
			<report test="not(count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1) and 
			not(count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1)"
			>W003 | Sezione Esami eseguiti durante il ricovero: l'entry/observation/code può essere valorizzato secondo i sistemi di codifica
			LOINC @codeSystem='2.16.840.1.113883.6.1'
			ICD-9-CM @codeSystem='2.16.840.1.113883.6.103'</report>
		</rule>	

		<!--7-->
		<!--Sezione prestazioni: dettaglio prestazioni amministrative eseguite (entry/act)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:entry">
			
			<assert test="count(hl7:act)=1"
			>ERRORE-b78| Sezione Prestazioni: l'elemento entry DEVE contenere un elemento act</assert>
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
			>ERRORE-b79| Sezione Prestazioni: l'elemento entry/act DEVE avere gli attributi valorizzati @classCode="ACT" e @moodCode="EVN"</assert>
			<assert test="count(hl7:act/hl7:effectiveTime/@value)=1"
			>ERRORE-b80| Sezione Prestazioni: l'elemento entry/act DEVE contenere l'elemento effectiveTime valorizzato con l'attributo @value</assert>
		</rule>
		
		<!--Sezione prestazioni: procedura operativa eseguita (entry/act/entryRelationship)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:entry/hl7:act/hl7:entryRelationship">

			<assert test="count(hl7:procedure)=1 or count(hl7:substanceAdministration)=1 or count(hl7:observation)=1 or count(hl7:act)=1"
			>ERRORE-b81| Sezione Prestazioni: l'elemento entry/act/entryRelationship deve avere uno dei seguenti sotto elementi:
			- 'procedure': per procedure diagnostiche invasive, interventistiche, chirurgiche;
			- 'substanceAdministration': per somministrazioni farmaceutiche;
			- 'observation': per osservazioni eseguite durante la prestazione;
			- 'act': per altre procedure che non ricadono nei casi precedenti.
			</assert>
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure/hl7:code)=1"
			>ERRORE-b82| Sezione Prestazioni: l'elemento entry/act/entryRelationship/procedure deve contenere l'elemento code </assert>
			<assert test="count(hl7:substanceAdministration)=0 or count(hl7:substanceAdministration/hl7:code)=1"
			>ERRORE-b83| Sezione Prestazioni: l'elemento entry/act/entryRelationship/substanceAdministration deve contenere l'elemento code </assert>
		</rule>
		
		<!--10-->
		<!--Sezione Diagnosi-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29548-5']]/hl7:entry">
			
			<assert test="count(hl7:observation)=1"
			>ERRORE-b84| Sezione Diagnosi: l'elemento entry DEVE contenere un elemento observation</assert>
			<assert test="count(hl7:observation/hl7:code[@code='29308-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b85| Sezione Diagnosi: l'elemento entry/observation DEVE contenere l'elemento code valorizzato con gli attributi @code='29308-4' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:value)=1"
			>ERRORE-b86| Sezione Diagnosi: l'elemento entry/observation DEVE contenere l'elemento value </assert>
		</rule>
		
		<!--13-->
		<!--Sezione Accertamenti e controlli consigliati-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='80615-8']]/hl7:entry">
			
			<assert test="count(hl7:act)=1"
			>ERRORE-b87| Sezione Accertamenti e controlli consigliati: l'elemento entry DEVE contenere l'elemento act </assert>
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='PRP'])=1"
			>ERRORE-b88| Sezione Accertamenti e controlli consigliati: l'elemento entry/act DEVE avere gli attributi valorizzati @classCode="ACT" e @moodCode="PRP" </assert>
		</rule>
		
		<!--14-->
		<!--Sezione Terapia Farmacologica Consigliata-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='93341-6']]/hl7:entry">
			
			<assert test="count(hl7:substanceAdministration)=1"
			>ERRORE-b89| Sezione Terapia farmacologica consigliata: l'elemento entry deve contenere un elemento substanceAdministration </assert>
			<assert test="count(hl7:substanceAdministration[@classCode='SBADM'][@moodCode='PRP'])=1"
			>ERRORE-b90| Sezione Terapia Farmacologica Cosnigliata: l'elemento entry/act DEVE avere gli attributi valorizzati @classCode="SBADM" e @moodCode="PRP" </assert>
			<assert test="count(hl7:substanceAdministration/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b91| Sezione Terapia farmacologica consigliata: l'elemento entry/substanceAdministration DEVE contenere l'elemento effectiveTime e DEVE avere l'elemento 'low' valorizzato </assert>
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1"
			>ERRORE-b92|Sezione Terapia farmacologica consigliata: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code DEVE avere l'attributo "@codeSystem" valorizzato come segue:
			- 2.16.840.1.113883.6.73 		codifica "ATC";
			- 2.16.840.1.113883.2.9.6.1.5 	codifica "AIC";
			- 2.16.840.1.113883.2.9.6.1.51	codifica "GE".
			</assert>
			<let name="trans_vl" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($trans_vl/hl7:code/hl7:translation)=0 or 
			(count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or 
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1 or
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1 or
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1)"
			>ERRORE-b93| Sezione Terapia farmacologica consigliata: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation deve essere valorizzato secondo i seguenti sistemi di codifica:
			@codeSystem='2.16.840.1.113883.6.73'		(ATC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.5' 	(AIC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.51' 	(GE)</assert>	
		</rule>	
		
		<!--Sezione Terapia Farmacologica Consigliata (entry/substanceAdministration/entryRelationship)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='93341-6']]/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship">

			<assert test="count(hl7:observation)=1 or count(hl7:supply)=1"
			>ERRORE-b94| Sezione Terapia farmacologica consigliata: l'elemento entry/substanceAdministration/entryRelationship deve avere uno dei seguenti sotto elementi:
			- 'observation': per informazioni relative a grammatura e quantità della confezione;
			- 'supply': per il numero di confezioni prescritte;
			</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:value)=1"
			>ERRORE-b95| Sezione Terapia farmacologica consigliata: l'elemento entry/substanceAdministration/entryRelationship/observation DEVE avere l'elemento 'value' valorizzato.</assert>
			<assert test="count(hl7:supply)=0 or count(hl7:supply/hl7:quantity)=1"
			>ERRORE-b96| Sezione Terapia farmacologica consigliata: l'elemento entry/substanceAdministration/entryRelationship/supply deve avere l'elemento 'quantity' valorizzato</assert>
		</rule>
		
		<!--Sezione Terapia Farmacologica Consigliata: controllo participant (entry/substanceAdministration/participant)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='93341-6']]/hl7:entry/hl7:substanceAdministration/hl7:participant">
			
			<assert test="count(hl7:participantRole/hl7:id)&gt;=1"
			>ERRORE-b97| Sezione Terapia Farmacologica consigliata: se presente entry/substanceAdministration/participant, DEVE contenere almeno un elemento participantRole/id </assert>
			<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
			>ERRORE-b98| Sezione Terapia Farmacologica consigliata: se presente entry/substanceAdministration/participant, DEVE contenere l'elemento participant/playingEntity/name con i sotto-elementi given e family </assert>
		</rule>	
		
	</pattern>
</schema>