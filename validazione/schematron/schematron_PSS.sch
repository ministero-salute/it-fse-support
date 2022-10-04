<!-- schematron versione:2.7-->
<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
		xmlns:cda="urn:hl7-org:v3"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:sch="http://www.ascc.net/xml/schematron"
        queryBinding="xslt2">
	<title>Schematron Profilo Sanitario Sintetico 1.4 </title>
	<ns prefix="hl7" uri="urn:hl7-org:v3"/>
	<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<pattern id="all">


<!--_______________________________________________________________HEADER _____________________________________________________________________-->


	<!-- ClinicalDocument -->
		<rule context="hl7:ClinicalDocument">
	        <!--Controllo realmCode-->	
			<assert test="count(hl7:realmCode)>=1"
			>ERRORE-1| L'elemento <name/> DEVE avere almeno un elemento 'realmCode'</assert>
			<assert test="count(hl7:realmCode[@code='IT'])= 1"
			>ERRORE-2| L'elemento 'realmCode' DEVE avere l'attributo @code valorizzato con 'IT'</assert>
			
			
			<!--Controllo templateId-->
			<assert test="count(hl7:templateId)>=1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.1.1'])= 1 and  count(hl7:templateId/@extension)= 1"
			>ERRORE-4| Almeno un elemento <name/>/templateId DEVE essere valorizzato attraverso l'attributo @root='2.16.840.1.113883.2.9.10.1.4.1.1', associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>
			
			<!--Controllo code-->	
			<assert test="count(hl7:code[@code='60591-5'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-5| L'elemento <name/>/code DEVE essere valorizzato con l'attributo @code='60591-5' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
			
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName='Profilo Sanitario Sintetico'])=1 or
			count(hl7:code[@displayName='PROFILO SANITARIO SINTETICO'])=1 or count(hl7:code[@displayName='Profilo sanitario sintetico'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Profilo Sanitario Sintetico'.--> </report>
			
			<!--Controllo confidentialityCode-->
			<assert test="(count(hl7:confidentialityCode[@code='N'][@codeSystem='2.16.840.1.113883.5.25'])= 1) or 
			(count(hl7:confidentialityCode[@code='V'][@codeSystem='2.16.840.1.113883.5.25'])= 1)"
			>ERRORE-6| L'elemento <name/>/confidentialityCode DEVE avere l'attributo @code valorizzato con 'N' o 'V', e il @codeSystem='2.16.840.1.113883.5.25'</assert>
			
			<!--Controllo languageCode-->	
			<assert test="count(hl7:languageCode)=1"
			>ERRORE-7| L'elemento <name/> DEVE contenere un elemento 'languageCode' </assert>
			
			<!--Controllo incrociato tra setId-versionNumber e relatedDocument-->
			<let name="versionNumber" value="hl7:versionNumber/@value"/>
			<assert test="(string(number($versionNumber)) = 'NaN') or
					($versionNumber= 1 and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
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
			<!--report test="not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1) and
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
			>ERRORE-14| L'elemento ClinicalDocument/recordTaget/patientRole/patient/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			<!--Controllo recordTarget/patientRole/patient/administrativeGenderCode-->
			<let name="genderOID" value="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@codeSystem"/>
			
			<assert test="count($patient)=0 or count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode)=1"
			>ERRORE-15| L'attributo <name/>/recordTarget/patientRole/patient DEVE contenere l'elemento administrativeGenderCode </assert>
			<assert test="count($patient)=0 or $genderOID='2.16.840.1.113883.5.1'"
			>ERRORE-16| L'OID assegnato all'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@codeSystem='<value-of select="$genderOID"/>' non è corretto. L'attributo DEVE essere valorizzato con '2.16.840.1.113883.5.1' </assert>
			
			
		<!--Controllo recordTarget/patientRole/patient/birthTime-->
            <assert test="count($patient)=0 or
            (count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2' or
            @root='2.16.840.1.113883.2.9.4.3.7' or @root='2.16.840.1.113883.2.9.4.3.3' or
            @root='2.16.840.1.113883.2.9.4.3.17'])=0) or
            count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthTime)=1"
            >ERRORE-17| L'elemento <name/>/recordTaget/patientRole/patient DEVE riportare un elemento 'birthTime'.</assert>
			
			<!--Controllo recordTarget/patientRole/patient/birthplace/place/addr-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace)=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace/hl7:place/hl7:addr)=1"
			>ERRORE-18| L'elemento <name/>/recordTarget/patientRole/patient/birthplace DEVE contenere un elemento place/addr </assert>	
			
			<!--Controllo author/assignedAuthor/id/@root-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-19| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo author/assignedAuthor/code-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:code)=0 or 
			count(hl7:author/hl7:assignedAuthor/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.13'])=1"
			>ERRORE-20| L'elemento <name/>/author/assignedAuthor/code DEVE essere valorizzato secondo il value set "assignedAuthorCode_PSSIT" - @codeSystem='2.16.840.1.113883.2.9.77.22.11.13'</assert>
						


            <!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:author/hl7:assignedAuthor/hl7:assignedPerson"/>
			<assert test="count($name_author/hl7:name)=1"
			>ERRORE-21| L'elemento <name/>/author/assignedAuthor/assignedPerson DEVE avere l'elemento 'name' </assert>
			<assert test="count($name_author/hl7:name)=0 or (count($name_author/hl7:name/hl7:given)=1 and count($name_author/hl7:name/hl7:family)=1)"
			>ERRORE-22| L'elemento <name/>/author/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
	
			
			<!--Controllo author/assignedAuthor/telecom-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:telecom)>=1"
			>ERRORE-23| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'telecom'</assert>
		
			
			<!--Controllo dataEnterer/assignedEntity/assignedPerson-->
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:dataEnterer)=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1)"
			>ERRORE-24| L'elemento <name/>/dataEnterer/assignedEntity DEVE riportare l'elemento 'assignedPerson/name'.</assert>
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-25| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'.</assert>	
			
		
			
			<!--Controllo Informant-->
			<assert test="count(hl7:informant/hl7:relatedEntity)=0 or 
			(count(hl7:informant/hl7:relatedEntity[@classCode='CON' or @classCode='PROV' or @classCode='PRS'])=1)"
			>ERRORE-26| L'elemento <name/>/informant/relatedEntity deve essere valorizzato con l'attributo @classCode='CON' o @classCode='PROV' o @classCode='PRS'.</assert>
			
			<let name="nome" value="hl7:informant/hl7:relatedEntity/hl7:relatedPerson/hl7:name"/>
			<assert test="count(hl7:informant/hl7:relatedEntity)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-27| L'elemento <name/>/informant/relatedEntity/relatedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
			
			<assert test="count(hl7:informant/hl7:assignedEntity/hl7:id)=0 or 
			count(hl7:informant/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-28| L'elemento <name/>/informant se presente, DEVE contenere l'elemento relatedEntity/id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'.</assert>
			
			<let name="nome" value="hl7:informant/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:informant/hl7:assignedEntity)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-29| L'elemento <name/>/informant/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
						
			


<!-- Controlloo da qua domani-->
			
			<!--Controllo custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-30| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and
			count($addr_cust/hl7:city)=$num_addr_cust and 
			count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-31| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>
			
			
		    <!--Controllo ClinicalDocument/legalAuthenticator-->
			<!--let name='statusCode' value='hl7:sdtc:statusCode'/-->
			<assert test = "count(hl7:legalAuthenticator)= 1" 
			>ERRORE-32| L'elemento legalAuthenticator è obbligatorio </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])= 1" 
			>ERRORE-33| L'elemento legalAuthenticator/signatureCode deve essere valorizzato con il codice "S" </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-34| L'elemento legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>

			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-35| L'elemento legalAuthenticator/assignedEntity/assignedPerson DEVE contenere l'elemento 'name'</assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1"
			>ERRORE-36| L'elemento legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			
			
			<!--Controllo authenticator-->
			<assert test="count(hl7:authenticator)=0 or count(hl7:authenticator/hl7:signatureCode[@code='S'])=1"
			>ERRORE-37| L'elemento <name/>/authenticator se presente, DEVE contenere l'elemento signatureCode valorizzato con l'attributo @code='S'.</assert>		
			<assert test="count(hl7:authenticator)=0 or count(hl7:authenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-38| L'elemento <name/>/authenticator DEVE contenere almeno un elemento assignedEntity/id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'.</assert>
		
			<assert test = "count(hl7:authenticator/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			(count(hl7:authenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and 
			count(hl7:authenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-39| L'elemento <name/>/authenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			
			<!--Controllo participant-->
			<assert test="count(hl7:participant)=0 or count(hl7:participant/hl7:associatedEntity/hl7:id)>=1"
			>ERRORE-40| L'elemento <name/>/participant/associatedEntity deve contenere almeno un elemento 'id'</assert>
			<let name="num_addr_pcp" value="count(hl7:participant/hl7:associatedEntity/hl7:addr)"/>
            <let name="addr_pcp" value="hl7:participant/hl7:associatedEntity/hl7:addr"/>
            <assert test="$num_addr_pcp=0 or (count($addr_pcp/hl7:country)=$num_addr_pcp and
                          count($addr_pcp/hl7:city)=$num_addr_pcp and
                          count($addr_pcp/hl7:streetAddressLine)=$num_addr_pcp)"
            >ERRORE-41| L'elemento <name/>/participant/associatedEntity/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			<assert test="count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name)=1)"
			>ERRORE-42| L'elemento <name/>/participant/associatedEntity/associatedPerson deve contenere l'elemento 'name'</assert>
			
			<assert test="count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:family)=1 and count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-43| L'elemento <name/>/participant/associatedEntity/associatedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
			
		
		</rule>		

<!--__________________________________________________________CONTROLLI GENERICI________________________________________________________________-->


		<!--Controllo use Telecom-->
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>ERRORE-44| L’elemento 'telecom' DEVE contenere l'attributo @use </assert>
		</rule>	
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension,'[A-Z0-9]{16}')"
			>ERRORE-45| Il codice fiscale '<value-of select="$CF"/>' cittadino ed operatore deve essere costituito da 16 cifre [A-Z0-9]{16}</assert>
			
		</rule>
	
		<!--Controllo sugli attributi di observation-->
		<rule context="//hl7:observation">
			<let name="moodCd" value="@moodCode"/>
			<assert test="count(@classCode)=1"
			>ERRORE-46| L'attributo "@classCode" dell'elemento "observation" deve essere presente </assert>
		</rule>
		
		<!--Controllo sui valori di statusCode-->
		<rule context="//hl7:statusCode">
			<let name="val_status" value="@code"/>
			<assert test="$val_status='active' or  $val_status='completed' or $val_status='aborted' or $val_status='suspended' or $val_status='cancelled'"
			>Errore-47| Codice ActStatus '<value-of select="$val_status"/>' errato! Deve essere valorizzato con uno dei seguenti valori:
			- active
			- completed
			- aborted
			- suspended
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al CodeSystem "UCUM" utilizzati siano corretti-->
		<!--rule context="//*[@unit]">
			<let name="val_UCUM" value="@unit"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.4.642.3.912.xml')//el[@code=$val_UCUM]"
			>ERRORE-48| Codice UCUM <value-of select="$val_UCUM"/> errato
			</assert>
		</rule-->
		
<!--___________________________________________________________________BODY__________________________________________________________________________-->
	
	
	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody">
			
		<!--Controllo sulle Section obbligatorie-->
		
			<!--1-->
			<!--Allergie e intolleranze-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='48765-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b1| Sezione Allergie e intolleranze: la sezione DEVE essere presente.</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.1'])=1"
			>ERRORE-b2| Sezione Allergie e intolleranze: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.1'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:title)=1"
			>ERRORE-b3| Sezione Allergie e intolleranze: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Allergie e Intolleranze'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry)&gt;=1"
			>ERRORE-b4| Sezione Allergie e intolleranze: la sezione DEVE contenere almeno un elemento 'entry'</assert>			
		
			<!--2-->
			<!--Sezione Terapie farmacologiche-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='10160-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b5| Sezione Terapie farmacologiche: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.2'])=1"
			>ERRORE-b6| Sezione Terapie farmacologiche: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.2'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:title)=1"
			>ERRORE-b7| Sezione Terapie farmacologiche: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Terapie farmacologiche'</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']])=0 and
			count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3']])=1) or 
			(count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']])>=1 and
			count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3']])=0)"
			>ERRORE-b8| Sezione Terapie farmacologiche: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
			<!--4-->
			<!--Sezione Lista dei problemi-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='11450-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b9| Sezione Lista dei problemi: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.4'])=1"
			>ERRORE-b10| Sezione Lista dei problemi: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.4'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:title)=1"
			>ERRORE-b11| Sezione Lista dei problemi: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Lista dei problemi'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:entry)&gt;=1"
			>ERRORE-b12| Sezione Lista dei problemi: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
			<!--9-->
			<!--Protesi, Impianti e Ausili -->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='46264-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b13| Sezione Protesi, impianti e ausili: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.9'])=1"
			>ERRORE-b14| Sezione Protesi, impianti e ausili: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.9'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:title)=1"
			>ERRORE-b15| Sezione Protesi, impianti e ausili: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Protesi, impianti e ausili'</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])=0 and 
			count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2']])=1) or 
			(count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])>=1 and 
			count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2']])=0)"
			>ERRORE-b16| Sezione Protesi, impianti e ausili: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--11-->
			<!--Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='47519-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b17| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.11'])=1"
			>ERRORE-b18| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.11'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:title)=1"
			>ERRORE-b19| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche'</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:entry)&gt;=1)"
			>ERRORE-b20| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione DEVE contenere un elemento 'entry'</assert>
			
			<!--13-->
			<!--Sezione Stato funzionale del paziente-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='47420-5'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b21| Sezione Stato funzionale del paziente: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.13'])=1"
			>ERRORE-b22| Sezione Stato funzionale del paziente: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.13'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:title)=1"
			>ERRORE-b23| Sezione Stato funzionale del paziente: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Stato funzionale del paziente'</assert>
			
		
		<!--Controllo sulle Section opzionali-->
		
			<!--3-->
			<!--Sezione Vaccinazioni-->	
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11369-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.3'])=1"
			>ERRORE-b24| Sezione Vaccinazioni: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.3'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11369-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:title)=1"
			>ERRORE-b25| Sezione Vaccinazioni: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Vaccinazioni'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11369-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:entry)&gt;=1"
			>ERRORE-b26| Sezione Vaccinazioni: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--5-->
			<!--Anamnesi familiare-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10157-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.16'])=1"
			>ERRORE-b27| Sezione Anamnesi familiare: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.16”'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10157-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:title)=1"
			>ERRORE-b28| Sezione Anamnesi familiare: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Vaccinazioni'</assert>
		
			
			<!--6-->
			<!--Stile di vita-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29762-2']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='29762-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.6'])=1"
			>ERRORE-b29| Sezione Stile di vita: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.6'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29762-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='29762-2']]/hl7:title)=1"
			>ERRORE-b30| Sezione Stile di vita: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Stile di vita'</assert>
		

			<!--7-->
			<!--Gravidanze e parto-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10162-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.7'])=1"
			>ERRORE-b31| Sezione Gravidanze e parto: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.7'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10162-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:title)=1"
			>ERRORE-b32| Sezione Gravidanze e parto: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Gravidanze, parti, stato mestruale'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10162-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:entry)&gt;=1"
			>ERRORE-b33| Sezione Gravidanze e parto: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
			<!--8-->
			<!--Parametri vitali-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8716-3']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.8'])=1"
			>ERRORE-b34| Sezione Parametri vitali: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.8'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8716-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:title)=1"
			>ERRORE-b35| Sezione Parametri vitali: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Parametri vitali'</assert>
		
		
			<!--10-->
			<!--Piani di cura-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='18776-5']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.10'])=1"
			>ERRORE-b36| Sezione Piani di cura: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.10'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='18776-5']])=0 or count(hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:title)=1"
			>ERRORE-b37| Sezione Piani di cura: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Piani di cura'</assert>
			
			<!--12-->
			<!--Visite o ricoveri-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.12'])=1"
			>ERRORE-b38| Sezione Visite o ricoveri: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.12'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:title)=1"
			>ERRORE-b39| Sezione Visite o ricoveri: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Visite e ricoveri'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry)&gt;=1"
			>ERRORE-b40| Sezione Visite o ricoveri: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--14-->
			<!--Indagini diagnostiche e esami di laboratorio-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.14'])=1"
			>ERRORE-b41| Sezione Indagini diagnostiche e esami di laboratorio: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.14'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:title)=1"
			>ERRORE-b42| Sezione Indagini diagnostiche e esami di laboratorio: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Indagini diagnostiche e esami di laboratorio'</assert>
		
			<!--15-->
			<!--Assenso/dissenso donazione organi-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='42348-3']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='42348-3']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.15'])=1"
			>ERRORE-b43| Sezione Assenso/dissenso donazione organi: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.15'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='42348-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='42348-3']]/hl7:title)=1"
			>ERRORE-b44| Sezione Assenso/dissenso donazione organi: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Assenso/dissenso donazione organi'</assert>
			
			<!--16-->
			<!--Esenzioni-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='57827-8']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.17'])=1"
			>ERRORE-b45| Sezione Esenzioni: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.17'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='57827-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:title)=1"
			>ERRORE-b46| Sezione Esenzioni: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Esenzioni'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='57827-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:entry)&gt;=1"
			>ERRORE-b47| Sezione Esenzioni: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--17-->
			<!--Reti di patologia-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:code[@codeSystem='2.16.840.1.113883.2.9.5.2.8'])=1"
			>ERRORE-b48| Sezione Reti di patologia: la sezione DEVE contenere un elemento 'code' valorizzato con l'attributo @codeSystem='2.16.840.1.113883.2.9.5.2.8'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.18'])=1"
			>ERRORE-b49| Sezione Reti di patologia: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.18'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:title)=1"
			>ERRORE-b50| Sezione Reti di patologia: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Reti di patologia'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:entry)&gt;=1"
			>ERRORE-b51| Sezione Reti di patologia: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
		</rule>
	
	
		<!--Controllo sui codici delle sezioni-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section">
			<let name="codice" value="hl7:code/@code"/>
			<assert test="count(hl7:code[@code='48765-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='10160-0'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='11369-6'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:code[@code='11450-4'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='10157-6'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='29762-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:code[@code='10162-6'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='8716-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='46264-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:code[@code='18776-5'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='47519-4'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='46240-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:code[@code='47420-5'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='30954-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='42348-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='57827-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:code[@code='PSSIT99'][@codeSystem='2.16.840.1.113883.2.9.5.2.8'])=1"
			>ERRORE-b52| Il codice '<value-of select="$codice"/>' non è corretto. La sezione deve essere valorizzata con uno dei seguenti codici:
			48765-2		- Sezione Allergie e intolleranze
			10160-0		- Sezione Terapie farmacologiche
			11369-6		- Sezione Vaccinazioni
			11450-4		- Sezione Lista dei problemi
			10157-6		- Sezione Anamnesi familiare
			29762-2		- Sezione Stile di vita
			10162-6		- Sezione Gravidanze e parto
			8716-3		- Sezione Parametri vitali
			46264-8		- Sezione Protesi, impianti e ausili
			18776-5		- Sezione Piani di cura 
			47519-4 	- Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche
			46240-8	  	- Sezione Visite e ricoveri
			47420-5		- Sezione Stato funzionale del paziente
			30954-2		- Sezione Indagini diagnostiche e esami di laboratorio
			42348-3		- Sezione Assenso/dissenso donazione organi
			57827-8		- Sezione Esenzioni
			PSSIT99		- Sezione Reti di patologia			
			</assert>
		</rule>	



		<!--1-->
		<!--Allergie e Intolleranze: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry">
			
			<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.1'])=1"
			>ERRORE-b53| Sezione Allergie e Intolleranze: entry/act DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.1'.</assert>
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b54| Sezione Allergie e Intolleranze: entry/act DEVE contenere un elemento 'eWffectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
					($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
					($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
					($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-b55| Sezione Allergie e Intolleranze: entry/act/effectiveTime deve contenere l'elemento 'high' valorizzato nel caso in cui lo 'statusCode' è "completed"|"aborted".</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']])=0 and 
			count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']])=1) or
			(count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']])=0 and 
			count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']])=1)"
			>ERRORE-b56| Sezione Allergie e Intolleranze: entry/act DEVE contenere una sola entryRelationship/observation conenente l'elemento 'templateId' valorizzato nei seguenti modi:
			- @root='2.16.840.1.113883.2.9.10.1.4.3.1.4' per "Assenza allergie note" 
			- @root='2.16.840.1.113883.2.9.10.1.4.3.1.3' per "Presenza allergie e/o intolleranze".</assert>
			
			<!--Presenza  di allergie-->
			<report test="not(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3'])=0) and 
			not(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:code[@code='52473-6'][@codeSystem='2.16.840.1.113883.6.1'])=1)"
			>W003| Sezione Allergie e Intolleranze: si consiglia di valorizzare l'elemento entry/act/entryRelationship/observation/code con @code='52473-6' derivato da LOINC.--></report>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3'])=0 or
			count(hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b57| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3'])=0 or
			count(hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-b58| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE contenere un elemento 'value' con l'attributo @xsi:type="CD".</assert>			
			
			<let name="temp" value="hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]"/>
			<assert test="count($temp)=0 or 
			(count($temp/hl7:value/@code)=1 and count($temp/hl7:value/hl7:originalText/hl7:reference/@value)&lt;=1 and 
			count($temp/hl7:value[@codeSystem='2.16.840.1.113883.5.4' or @codeSystem='2.16.840.1.113883.1.11.19700'])=1) or 
			(count($temp/hl7:value/@code)=0 and count($temp/hl7:value/hl7:originalText/hl7:reference/@value)=1)"
			>ERRORE-b59| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/value può essere valorizzato nei modi seguenti:
			- nel caso di 'value' non codificato DEVE avere l'elemento originalText/reference/@value valorizzato;
			- nel caso di 'value' codificato DEVE essere valorizzato con l'attributo @codeSystem='2.16.840.1.113883.5.4' o @codeSystem='2.16.840.1.113883.1.11.19700'</assert>
				
				<!--Descrizione Agente-->
				<assert test="count($temp)=0 or count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant)>=1"
				>ERRORE-b60| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE contenere almeno un 'participant' - "Descrizione Agente".</assert>
				
				<!--Criticità allergia-->
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.3'])=1"
				>ERRORE-b61| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Criticità di un'allergia o intolleranza) DEVE includere l'identificativo 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.3' </assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation]/hl7:observation/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-b62| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Criticità di un'allergia o intolleranza) DEVE avere un elemento 'value' con l'attributo @xsi:type='CD'.</assert>
				
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.1063'])=1"
				>ERRORE-b63| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation/value (Criticità di un'allergia o intolleranza) DEVE essere derivato dal value set "CriticalityObservation" - @codeSystem='2.16.840.1.113883.5.1063'.</assert>
				<!--Stato allergia-->
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6'])=1"
				>ERRORE-b64| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Stato di un'allergia) DEVE includere l'identificativo 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.6'.</assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b65| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Stato di un'allergia) DEVE contenere un elemento 'code' valorizzato con gli attributi @code='33999-4' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.11' or @codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b66| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Stato di un'allergia) DEVE avere un elemento 'value' valorizzato secondo il value set "Stato clinico allergia" - @codeSystem='2.16.840.1.113883.6.1'. </assert>
				<!--Note e commenti-->
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
				>ERRORE-b67| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Note e commenti) DEVE contenere un 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'.</assert>
			
			
						
			<!--Assenza allergia-->
			<let name="temp_abs" value="hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']]"/>
			<assert test="count($temp_abs)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']]/hl7:code[@code='OINT'][@codeSystem='2.16.840.1.113883.5.4' or @codeSystem='2.16.840.1.113883.1.11.19700'])=1"
			>ERRORE-b68| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE avere un elemento 'code' valorizzato con @code='OINT' e @codeSystem='2.16.840.1.113883.5.4' o @codeSystem='2.16.840.1.113883.1.11.19700'.</assert>
			
			<assert test="count($temp_abs)=0 or 
			(count($temp_abs/hl7:value/@code)=1 and	
			count($temp_abs/hl7:value[@codeSystem='2.16.840.1.113883.5.1150.1' or @codeSystem='2.16.840.1.113883.11.22.9'])=1
			and count($temp_abs/hl7:value/hl7:originalText/hl7:reference/@value)&lt;=1)"
			>ERRORE-b69| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/value DEVE deve essere valorizzato secondo il value set "Absent or Unknown allergies" @codeSystem='2.16.840.1.113883.5.1150.1' or @codeSystem='2.16.840.1.113883.11.22.9'  
			</assert>
				
			
		</rule>
			
			<!--Descrizione Agente-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:participant">	
				
				
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:code/@code)=0 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2'])=1"
				>ERRORE-b70| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/participant/participantRole/playingEntity/code deve avere l'attributo @codeSystem valorizzato come segue:
				- 2.16.840.1.113883.6.73		codifica "WHO ATC"
				- 2.16.840.1.113883.2.9.6.1.5 		codifica "AIC"
				- 2.16.840.1.113883.11.22.9 		value set "AbsentorUnknownAllergies" (- per le allergie non a farmaci –)
				</assert>		
				
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:code/@nullFlavor)=0 or 
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@nullFlavor='NI'])=1"
				>ERRORE-b71| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/participant/participantRole/playingEntity DEVE contenere l'elemento code valorizzato con l'attributo @nullFlavor='NI'.</assert>
				
				<assert test="(count(hl7:participantRole/hl7:playingEntity/hl7:code/@nullFlavor)=0 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code/hl7:originalText/hl7:reference)=1) "
				>ERRORE-b72| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/participant/participantRole/playingEntity DEVE contenere l'elemento originalText/reference.</assert>
				
			</rule>
			<!--Descrizione Reazioni-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:entryRelationship[@typeCode='MFST']">	
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' or @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=1"
				>ERRORE-b73| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Descrizione reazioni) DEVE contenere il 'templateId' valorizzato come segue:
				- @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' nel caso di Descrizione Reazione codificato
				- @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2' nel caso di Descrizione reazione non codificato.</assert>			
				<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b74| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Descrizione reazioni) DEVE contenere l'elemento 'code' valorizzato con i seguenti attributi @code='75321-0' e @codeSystem='2.16.840.1.113883.6.1'. </assert>
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1'])=0 or
				count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.4' or @codeSystem='2.16.840.1.113883.6.103'])=1"
				>ERRORE-b75| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation/code (Descrizione reazioni) DEVE essere valorizzato secondo i seguenti dizionari:
				- 2.16.840.1.113883.2.9.77.22.11.3		Value Set Reazioni Intolleranza
				- 2.16.840.1.113883.2.9.77.22.11.4 		Value Set Reazioni Allergiche
				- 2.16.840.1.113883.6.103			ICD-9-CM
				</assert>				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=0 or
				count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1"
				>ERRORE-b76| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation/value (Descrizione reazioni) DEVE contenere l'elemento originalText/reference.</assert>
				
			</rule>

		
		
		<!--2-->
		<!--Sezione Terapie farmacologiche: controllo sulle entry-->			
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry">
			<assert test="count(hl7:substanceAdministration[@moodCode='INT' or @moodCode='EVN'])=1"
			>ERRORE-b77| Sezione Terapia Farmacologica: entry DEVE contenere un elemento di tipo 'substanceAdministration' con attributo @moodCode valrizzato con 'INT' o 'EVN'. </assert>
			<assert test="(count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=1 or
						  count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3'])=1)"
			>ERRORE-b78| Sezione Terapia Farmacologica: entry/substanceAdministration DEVE contenere un elemento 'templateId' valorizato come segue:
			- @root='2.16.840.1.113883.2.9.10.1.4.3.2.1' per Terapia o 
			- @root='2.16.840.1.113883.2.9.10.1.4.3.2.3' per Assenza di terapia</assert>
		<!--Terapia-->
			<assert test="count(hl7:substanceAdministration/hl7:text)=0 or count(hl7:substanceAdministration/hl7:text/hl7:reference/@value)=1"
			>ERRORE-b79| Sezione Terapia Farmacologica: entry/substanceAdministration/text DEVE contenere l'elemento reference/@value valorizzato con l’URI che punta alla descrizione della terapia nel narrative block della sezione.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=0 or
			count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1"
			>ERRORE-b80| Sezione Terapia Farmacologica: entry/substanceAdministration/effectiveTime DEVE essere presente e deve avere l'elemento 'low' valorizzato  </assert>				
			<let name="status" value="hl7:substanceAdministration/hl7:statusCode/@code"/>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=0 or
			($status='completed' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or
			($status='aborted' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or 
			($status='suspended' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0) or 
			($status='active' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0)"
			>ERRORE-b81| Sezione Terapia Farmacologica: entry/substanceAdministration/effectiveTime/high DEVE essere presente nel caso in cui lo 'statusCode' sia 'completed'oppure'aborted'
			</assert>	
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=0 or
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.2'])=1"
			>ERRORE-b82| Sezione Terapia Farmacologica: entry/substanceAdministration/consumable/manufacturedProduct DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.2.2'.</assert>
			<let name="farma" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']]/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']])=0 or 
			(count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or 
			count($farma/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
			count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1)"
			>ERRORE-b83| Sezione Terapia Farmacologica: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial deve contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
			- @codeSystem='2.16.840.1.113883.2.9.6.1.5' 	(AIC)
			- @codeSystem='2.16.840.1.113883.6.73'			(ATC)
			- @codeSystem='2.16.840.1.113883.2.9.6.1.51'	(GE)
			</assert>			
			<let name="trans_vl" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']]/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($trans_vl/hl7:code/hl7:translation)=0 or
			(count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1 or
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1 or
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1 or
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1 or
			count($trans_vl/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1)"
			>ERRORE-b84| Sezione Terapia farmacologica: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation DEVE essere valorizzato secondo i seguenti sistemi di codifica:
			@codeSystem='2.16.840.1.113883.6.73' (ATC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.5' (AIC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.51' (GE)</assert>
			
			<!--Indicazione assenza terapie note-->
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3'])=0 or 
			count(hl7:substanceAdministration/hl7:code[@codeSystem='2.16.840.1.113883.11.22.15' or @codeSystem='2.16.840.1.113883.5.1150.1'])"
			>ERRORE-b85| Sezione Terapia farmacologica: entry/substanceAdministration/code DEVE essere valorizzato secondo il value set @codeSystem='2.16.840.1.113883.11.22.15' o @codeSystem='2.16.840.1.113883.5.1150.1' (Absent or Unknown Medication)</assert>
			
		</rule>


		
		<!--3-->
		<!--Vaccinazioni-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:entry">
	   
			<assert test="count(hl7:substanceAdministration)=1 and count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.1'])=1"
			>ERRORE-b86| Sezione Vaccinazioni: entry/substanceAdministration DEVE essere conforme al 'templateId' valorizzato con  @root='2.16.840.1.113883.2.9.10.1.4.3.3.1'
			</assert>
			<assert test="count(hl7:substanceAdministration/hl7:code[@code='IMMUNIZ'][@codeSystem='2.16.840.1.113883.5.4'])=1 "
			>ERRORE-b87| Sezione Vaccinazioni: entry/substanceAdministration DEVE contenere un 'code' valorizzato con il gli attributi @code='IMMUNIZ' e @codeSystem='2.16.840.1.113883.5.4' </assert>		   
			<assert test="count(hl7:substanceAdministration/hl7:text)=0 or count(hl7:substanceAdministration/hl7:text/hl7:reference/@value)=1"
			>ERRORE-b88| Sezione Vaccinazioni: entry/substanceAdministration/text/reference DEVE contenere l'attributo @value valorizzato con l’URI che punta alla descrizione della terapia nel narrative block della sezione.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:statusCode[@code='completed'])=1 "
			>ERRORE-b89| Sezione Vaccinazioni: entry/substanceAdministration DEVE contenere uno statusCode valorizzato @code='completed' </assert>   
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.2'])=1"
			>ERRORE-b90| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct DEVE contenere l'elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.3.2'</assert>			   		
			<let name="farma_vacc" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($farma_vacc/hl7:code/@code)=0 or 
			count($farma_vacc/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or 
			count($farma_vacc/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1"
			>ERRORE-b91| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial DEVE contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
			- @codeSystem='2.16.840.1.113883.2.9.6.1.5' 	(AIC)
			- @codeSystem='2.16.840.1.113883.6.73'			(ATC)
			</assert>			
			<let name="trans_vacc" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($trans_vacc/hl7:code/hl7:translation)=0 or
			(count($trans_vacc/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count($trans_vacc/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1)"
			>ERRORE-b92| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation DEVE essere valorizzato secondo i seguenti sistemi di codifica:
			@codeSystem='2.16.840.1.113883.6.73' (ATC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.5' (AIC)</assert>	
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:lotNumberText)=1"
			>ERRORE-b93| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial DEVE contenere un elemento 'lotNumberText'. </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@nullFlavor)=0 or 
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@nullFlavor='OTH'])=1 and 
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/hl7:originalText/hl7:reference)=1"
			>ERRORE-b94| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code non codificato deve avere l'attributo @nullFlavor='OTH' e deve contenere l'elemento originalText/reference valorizzato.</assert> 
			
			<!--periodo di copertura-->
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']) &lt;=1"
			>ERRORE-b95| Sezione Vaccinazioni: entry/substanceAdministration può contenere  al più un entryRelationship/obersavation che descrive il "Periodo di copertura" conforme al 'templateId' @root='2.16.840.1.113883.2.9.10.1.4.3.3.3' </assert> 	  
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']]/hl7:code[@code='59781-5'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b96| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Periodo di copertura) DEVE avere un elemento 'code' valorizzato con @code='59781-5' e @codeSystem='2.16.840.1.113883.6.1' </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']]/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b97| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Periodo di copertura) DEVE contenere un elemento 'statusCode' valorizzato con 'completed'</assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']]/hl7:value/hl7:high)=1"
			>ERRORE-b98| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Periodo di copertura) DEVE deve contenere un elemento 'value' il quale deve avere l'elemento 'high' valorizzato. </assert> 
	 
			<!--numero di dose-->
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']) &lt;=1"
			>ERRORE-b99| Sezione Vaccinazioni: entry/substanceAdministration può contenere al più un entryRelationship/obersavation che descrive il "Numero delle dosi" conforme al 'templateId' @root='2.16.840.1.113883.2.9.10.1.4.3.3.4'.</assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:code[@code='30973-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b100| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Numero delle dosi) DEVE contenere un elemento 'code' valorizzato con @code='30973-2' e @codeSystem='2.16.840.1.113883.6.1' </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b101| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Numero delle dosi) DEVE deve contenere un elemento 'statusCode' valorizzato con @code='completed' </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:value[@xsi:type='INT'])=1"
			>ERRORE-b102| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Numero delle dosi) DEVE contenere un elemento 'value' il cui attributo @xsi:type='INT' </assert> 
		 	<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:value/@value)=1"
			>ERRORE-b103| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation/value DEVE avere l'attributo @value valorizzato</assert> 
		 	
			<!--annotazioni e commenti-->
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])=0 or 
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
			>ERRORE-b104| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/act relativo a "Annotazioni e commenti" deve contenere l'elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7' </assert> 	  
			
			
			
	   </rule>	
		
			<!--Vaccinazioni: descrizione reazioni-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship[@typeCode='CAUS']">
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' or @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=1"
				>ERRORE-b105| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation (Descrizione reazione) DEVE essere conforme al 'templateId' @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' (Descrizione reazione codificata) o '2.16.840.1.113883.2.9.10.1.4.3.1.5.2' (Descrizione reazione non codificata)</assert> 
				<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b106| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation (Descrizione reazione) DEVE contenere l'elemento 'code' valorizzato con @code='75321-0' e @codeSystem='2.16.840.1.113883.6.1'. </assert>
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1'])=0 or
				count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.4' or @codeSystem='2.16.840.1.113883.6.103'])=1"
				>ERRORE-b107| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation (Descrizione reazione) DEVE contenere l'elemento 'value' valorizzato secondo i seguenti sistemi di codifica:
				- 2.16.840.1.113883.2.9.77.22.11.3		Value Set Reazioni Intolleranza
				- 2.16.840.1.113883.2.9.77.22.11.4 		Value Set Reazioni Allergiche
				-2.16.840.1.113883.6.103				ICD-9-CM
				</assert>				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=0 or
				count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1"
				>ERRORE-b108| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation/value (Descrizione reazione) DEVE contenere l'elemento originalText/reference.</assert>
					
			</rule>
		
		
		<!--4-->
		<!--Sezione Lista dei problemi: problema (entry/act)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:entry">
			
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
			>ERRORE-b109| Sezione Lista dei problemi: la 'entry' DEVE essere di tipo 'act' valorizzato con gli attributi @classCode='ACT' e @moodCode='EVN'</assert>
			<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.1'])=1"
			>ERRORE-b110| Sezione Lista dei problemi: entry/act DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.4.1'.</assert>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b111| Sezione Lista dei problemi: entry/act DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<assert test="count(hl7:act/hl7:statusCode)=1"
			>ERRORE-b112| Sezione Lista dei problemi: entry/act DEVE contenere l'elemento 'statusCode'.</assert>
			<let name="stats" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="count(hl7:act/hl7:statusCode/@nullFlavor)=1 or 
			($stats='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
			($stats='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
			($stats='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
			($stats='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-b113| Sezione Lista dei problemi: entry/act/effectiveTime/high DEVE essere presente nel caso in cui lo 'statusCode' sia 'completed' oppure 'aborted'</assert>
			
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation)&gt;=1"
			>ERRORE-b114| Sezione Lista dei problemi: entry/act DEVE contenere almeno una entryRelationship/observation relativa ai "Dettagli del problema" </assert>
			
			
		</rule>
		
			<!--Sezione Lista dei problemi: dettagli problema (entry/act/entryRelationship/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:entry/hl7:act/hl7:entryRelationship">
			
				<assert test="count(hl7:observation)=1 or count(hl7:act)=1"
				>ERRORE-b115| Sezione Lista dei problemi: l'elemento entry/act/entryRelationship deve avere uno dei seguenti sotto elementi:
				- 'observation': per i dettagli del problema;
				- 'act': per i riferimenti interni al problema;</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.2'])=1"
				>ERRORE-b116| Sezione Lista dei problemi: entry/act/entryRelationship/observation deve avere un elemento templateId con attributo @root='2.16.840.1.113883.2.9.10.1.4.3.4.2'</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:id)=1"
				>ERRORE-b117| Sezione Lista dei problemi: entry/act/entryRelationship/observation deve contenere l'elemento id </assert>				
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-b118| Sezione Lista dei problemi: entry/act/entryRelationship/observation/effectiveTime deve contenere l'elemento low e deve essere valorizzato</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:value)=1"
				>ERRORE-b119| Sezione Lista dei problemi: entry/act/entryRelationship/observation deve contenere l'elemento 'value'.</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@nullFlavor='NA'])=0 or 
				count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.11.22.17'])=1"
				>ERRORE-b120| Sezione Lista dei problemi: entry/act/entryRelationship/observation/value deve essere valorizzato secondo il value set  "Absent or Unknown Problems" - @codeSystem='2.16.840.1.113883.11.22.17' .</assert>
			
				
					<!--Gravità del Problema-->
					<assert test="count(hl7:observation)=0 or 
					count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.4']])&lt;=1"
					>ERRORE-b121| Sezione Lista dei problemi: entry/act/entryRelationship/observation può contenere una ed una sola 'entryRelationship/observation' relativa alla "Gravità del problema" </assert>

					<!--Stato del Problema-->
					<assert test="count(hl7:observation)=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']])&lt;=1"
					>ERRORE-b122| Sezione Lista dei problemi: entry/act/entryRelationship/observation può contenere una ed una sola 'entryRelationship/observation' relativa allo "Stato clinico del problema"</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']])=0 or
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']]/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-b123| Sezione Lista dei problemi: entry/act/entryRelationship/observation/entryRelationship/observation/code (Stato problema) DEVE essere valorizzato con @code='33999-4' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']])=0 or
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.11' or @codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-b124| Sezione Lista dei problemi: entry/act/entryRelationship/observation/entryRelationship/observation/value/@code DEVE essere selezionato dal value set "Stato clinico del Problema" - @codeSystem='2.16.840.1.113883.2.9.77.22.11.11' oppure LOINC - @codeSystem='2.16.840.1.113883.6.1'. </assert>
				
					<!--Cronicità del Problema-->
					<assert test="count(hl7:observation)=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']])&lt;=1"
					>ERRORE-b125| Sezione Lista dei problemi: entry/act/entryRelationship/observation può contenere una ed una sola 'entryRelationship/observation' relativa alla "Cronicità del problema"</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']])=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']]/hl7:code[@code='89261-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-b126| Sezione Lista dei problemi: entry/entryRelationship/observation/entryRelationship/observation (Cronicità del Problema) DEVE contenere un elemento 'code' valorizzato con @code='89261-2' e @codeSystem='2.16.840.1.113883.6.1'</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']])=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10' or @codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-b127| Sezione Lista dei problemi: entry/entryRelationship/observation/entryRelationship/observation (Cronicità del Problema) DEVE contenere un elemento 'value' valorizzato secondo @codeSystem='2.16.840.1.113883.2.9.77.22.11.10' (CronicitàProblema_PSS) or @codeSystem='2.16.840.1.113883.6.1'</assert>
					<!--Note e commenti-->
					<assert test="count(hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
					>ERRORE-b128| Sezione Lista dei problemi: entry/act/entryRelationship/observation/entryRelationship/act (Note e Commenti) DEVE avere un templateId valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'</assert> 	  
					
				<!--Riferimenti Interni-->		
				<assert test="count(hl7:act)=0 or count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.3'])>=1"
				>ERRORE-b129| Sezione Lista dei problemi: entry/act/entryRelationship/act (Riferimenti interni) DEVE avere un elemento 'templateId' valorizzato con  @root='2.16.840.1.113883.2.9.10.1.4.3.4.3'</assert>
			
			</rule>
			
		<!--5-->
		<!--Sezione Anamnesi Familiare: (entry/organizer)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:entry">
			<assert test="count(hl7:organizer[@classCode='CLUSTER'][@moodCode='EVN'])=1"
			>ERRORE-b130| Sezione Anamnesi Familiare: la sezione DEVE contenere un elemento entry/organizer valorizzato con attributi @classCode='CLUSTER' e @moodCode='EVN'</assert>
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.16.1'])=1"
			>ERRORE-b131| Sezione Anamnesi Familiare: entry/organizer DEVE contenere un elemento 'templateId' dvalorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.16.1'</assert>
			<assert test="count(hl7:organizer/hl7:subject)=1"
			>ERRORE-b132| Sezione Anamnesi Familiare: entry/organizer DEVE contenere un elemento 'subject'</assert>
			<assert test="count(hl7:organizer/hl7:subject/hl7:relatedSubject[@classCode='PRS'])=1"
			>ERRORE-b133| Sezione Anamnesi Familiare: entry/organizer/subject/relatedSubject DEVE essere valorizzato con l'attributo @classCode='PRS'</assert>
			<assert test="count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:code[@codeSystem='2.16.840.1.113883.5.111'])=1"
			>ERRORE-b134| Sezione Anamnesi Familiare: entry/organizer/subject/relatedSubject/code deve essere valorizzato secondo la tabella "PersonalRelationshipRoleCodeType" relativo al code system "RoleCode" - @codeSystem='2.16.840.1.113883.5.111' </assert>
			<assert test="count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode)=0 or
			count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode[@codeSystem='2.16.840.1.113883.5.1' or @codeSystem='2.16.840.1.113883.1.11.1'])=1"
			>ERRORE-b135| Sezione Anamnesi Familiare: entry/organizer/subject/relatedSubject/subject/administrativeGenderCode DEVE essere valorizzato secondo il code system "HL7 AdministrativeGender" - @codeSystem='2.16.840.1.113883.1.11.1'</assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation])>=1"
			>ERRORE-b136| Sezione Anamnesi Familiare: entry/organizer DEVE contenere almeno un elemento 'component' di tipo 'observation'</assert>
			
		</rule>
		
			<!--Sezione Anamnesi Familiare: Dettaglio Anamnesi Familiare(entry/organizer/component/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:entry/hl7:organizer/hl7:component">
			
				<assert test="count(hl7:observation)=1"
				>ERRORE-b137| Sezione Anamnesi Familiare: entry/organizer/component DEVE contenere un elemento di tipo 'observation'</assert>
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.16.2'])=1"
				>ERRORE-b138| Sezione Anamnesi Familiare: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.16.2'</assert>
				<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.9'])=1"
				>ERRORE-b139| Sezione Anamnesi Familiare: entry/organizer/component/observation DEVE contenere un elemento 'code' valorizzato secondo @codeSystem='2.16.840.1.113883.6.1' oppure @codeSystem='2.16.840.1.113883.2.9.77.22.11.9'</assert>
				<assert test="(count(hl7:observation/hl7:entryRelationship[hl7:observation])&lt;=2)"
				>ERRORE-b140| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship di tipo 'observation' DEVE essere presente al più 2 volte:
				- età di insorgenza
				- età di decesso</assert>
			</rule>
			<!--Sezione Anamnesi Familiare: Età insorgenza e di decesso(entry/organizer/component/observation/entryRelationship/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:entry/hl7:organizer/hl7:component/hl7:observation/hl7:entryRelationship">
			
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.16.3'])=1"
				>ERRORE-b141| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.16.3'</assert>
				
				<assert test="count(hl7:observation/hl7:code[@code='35267-4' or @code='39016-1'])=1"
				>ERRORE-b142| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation/code DEVE essere valorizzato secondo il value set "EtàInsorgenza" derivato da @codeSystem='2.16.840.1.113883.6.1':
				- @code='35267-4': età di insorgenza
				- @code='39016-1': età di decesso</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-b143| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation DEVE contenere un elemento 'statusCode' valorizzato con @code='completed'</assert>
				<assert test="count(hl7:observation/hl7:value)=1"
				>ERRORE-b144| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation DEVE contenere un elemento 'value'</assert>
			
			</rule>
		

		
		<!--6-->
		<!--Sezione Stile di vita: osservazione (entry/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29762-2']]/hl7:entry">
			
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.6.1'])=1"
			>ERRORE-b145| Sezione stile di vita: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.6.1'</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:id)=1"
			>ERRORE-b146| Sezione stile di vita: entry/observation DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b147| Sezione stile di vita: entry/observation/code DEVE essere selezionato dal value set "SocialHistoryEntryElement_PSSIT DYNAMIC" derivato da @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:text)=0 or count(hl7:observation/hl7:text/hl7:reference/@value)=1"
			>ERRORE-b148| Sezione stile di vita: entry/observation/text DEVE contenere l'elemento 'reference/@value' valorizzato con l'URI che punta alla descrizione del problema nel narrative block</assert>
			<assert test="count(hl7:observation/hl7:value/hl7:originalText)=0 or count(hl7:observation/hl7:value/hl7:originalText/hl7:reference/@value)=1"
			>ERRORE-b149| Sezione stile di vita: entry/observation/value/originalText DEVE contenere l'elemento 'reference/@value' valorizzato con l'URI che punta alla descrizione dell'informazione nel narrative block</assert>
		
		</rule> 
		
		
		
		<!--7-->
		<!--Sezione Gravidanze e parto: dettaglio (entry/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:entry">
			
			<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.7.1'])=1"
			>ERRORE-b150| Sezione gravidanze e parto: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.7.1'</assert>
			<assert test="count(hl7:observation/hl7:id)=1"
			>ERRORE-b151| Sezione gravidanze e parto: entry/observation DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b152| Sezione gravidanze e parto: entry/observation/code DEVE essere selezionato dal value set "PregnancyObservation_PSSIT" derivato da @codeSystem='2.16.840.1.113883.6.1' </assert>
		</rule>



		<!--8-->
		<!--Parametri Vitali: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry">
			
			<assert test="count(hl7:organizer)=1 or count(hl7:observation)=1"
			>ERRORE-b153| Sezione Parametri Vitali: l'entry DEVE contenere o un elemento di tipo 'organizer' oppure di tipo 'observation'.</assert>
			
			<!--organizer-->
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.8.1'])=1"
			>ERRORE-b154| Sezione Parametri Vitali: entry/organizer DEVE contenere un 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.8.1' </assert>
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:component[hl7:observation])>=1"
			>ERRORE-b155| Sezione Parametri Vitali: entry/organizer DEVE contenere almeno un elemento 'component' di tipo 'observation'</assert>
			
			<!--observation-->
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.8.2'])=1"
			>ERRORE-b156| Sezione Parametri Vitali: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.8.2'.</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b157| Sezione Parametri Vitali: entry/observation/code DEVE essere valorizzato con @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:value[@xsi:type='PQ'])=1"
			>ERRORE-b158| Sezione Parametri Vitali: entry/observation/value DEVE avere valorizzato l'attributo @xsi:type='PQ'.</assert>
			
		</rule>
			
			<!--Parametri Vitali: controllo entry/organizer/component/observation-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry/hl7:organizer/hl7:component">
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.8.2'])=1"
				>ERRORE-b159| Sezione Parametri Vitali: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.8.2'.</assert>
				<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b160| Sezione Parametri Vitali: entry/organizer/component/observation/code DEVE essere valorizzato secondo il @codeSystem='2.16.840.1.113883.6.1'.</assert>
				<assert test="count(hl7:observation/hl7:value[@xsi:type='PQ'])=1"
				>ERRORE-b161| Sezione Parametri Vitali: entry/organizer/component/observation/value DEVE avere valorizzato l'attributo @xsi:type='PQ'.</assert>
			
			</rule>



		<!--9-->
		<!--Protesi, Impianti e Ausili: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry">
			
			<assert test="(count(hl7:supply)=1) and
			(count(hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1'])=1 or
			count(hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2'])=1)"
			>ERRORE-b162| Sezione Protesi, impianti, ausili: l'entry DEVE essere di tipo 'supply' e DEVE contenere un elemento 'templateId' valorizzato a seconda dei due seguenti casi:
			- Indicazione presenza: @root='2.16.840.1.113883.2.9.10.1.4.3.9.1'
			- Indiczione assenza: @root='2.16.840.1.113883.2.9.10.1.4.3.9.2'</assert>
			
			<!--dettaglio presenza protesi impianti ausili-->
			<assert test="count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])=0 or 
			count(hl7:supply/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.48'])=1"
			>ERRORE-b163| Sezione Protesi, impianti, ausili: entry/supply DEVE contenere un elemento 'code'valorizzato secondo il code system "Classificazione Nazionale dei Dispositivi medici" - @codeSystem='2.16.840.1.113883.2.9.6.1.48'.</assert>
			<assert test="count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])=0 or 
			count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']]/hl7:effectiveTime)=1"
			>ERRORE-b164| Sezione Protesi, impianti, ausili: entry/supply DEVE contenere un elemento 'effectiveTime'. </assert>
		
			<!--assenza protesi impianti ausili-->
			<assert test="count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2']])=0 or 
			count(hl7:supply/hl7:code[@codeSystem='2.16.840.1.113883.11.22.36'])=1"
			>ERRORE-b165| Sezione Protesi, impianti, ausili: entry/supply DEVE contenere un elemento 'code' valorizzato secondo il value set "IPSNoProceduresInfos" - @codeSystem='2.16.840.1.113883.11.22.36'.</assert>	
		</rule>

		
		<!--10-->
		<!--Sezione Piani di cura: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:entry">
			
			<assert test="count(hl7:observation)=1 or count(hl7:substanceAdministration)=1 or count(hl7:procedure)=1 or count(hl7:encounter)=1 or count(hl7:act)=1"
			>ERRORE-b166| Sezione Piani di cura: l'entry può contenere uno dei seguenti sotto statement:
			- 'observation':	 per le prestazioni del piano di cura;
			- 'substanceAdministration': 	per le terapie o le vaccinazioni del piano di cura;
			- 'procedure': 	per le procedure chirurgiche previste dal piano di cura;
			- 'encounter': 	per le visite o i ricoveri previsti da piano di cura;
			- 'act': 	per altre attività del piano di cura.</assert>
		
		<!--Sezione Piani di cura: observation-->
			<assert test="count(hl7:observation)=0 or count(hl7:observation[@moodCode='INT' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO' or @moodCode='GOL'])=1"
			>ERRORE-b167|Sezione Piani di cura: entry/observation DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'PRMS' or 'PRP' or 'RQO' or 'GOL' </assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.1'])=1"
			>ERRORE-b168|Sezione Piani di cura: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.1'</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:id)=1"
			>ERRORE-b169|Sezione Piani di cura: entry/observation DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:observation/hl7:effectiveTime)=0 or (count(hl7:observation/hl7:effectiveTime[@value])=1 or count(hl7:observation/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-b170|Sezione Piani di cura: entry/observation/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale.</assert>
		
		<!--Sezione Piani di cura: substanceAdministration-->
			<assert test="count(hl7:substanceAdministration)=0 or count(hl7:substanceAdministration[@moodCode='INT' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-b171|Sezione Piani di cura: entry/substanceAdministration DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:substanceAdministration)=0 or count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.2'])=1"
			>ERRORE-b172|Sezione Piani di cura: entry/substanceAdministration DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.2'</assert>
			<assert test="count(hl7:substanceAdministration)=0 or count(hl7:substanceAdministration/hl7:id)=1"
			>ERRORE-b173|Sezione Piani di cura: entry/substanceAdministration DEVE contenere un solo elemento 'id'.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS'])=0 or 
			(count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/@value)=1 or count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1)"
			>ERRORE-b174|Sezione Piani di cura: entry/substanceAdministration/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale. </assert>
		
		<!--Sezione Piani di cura: procedure-->
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure[@moodCode='INT' or @moodCode='ARQ' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-b175|Sezione Piani di cura: entry/procedure DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'ARQ' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.3'])=1"
			>ERRORE-b176|Sezione Piani di cura: entry/procedure DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.3'</assert>
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure/hl7:id)=1"
			>ERRORE-b177|Sezione Piani di cura: entry/procedure DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure/hl7:code)=1"
			>ERRORE-b178|Sezione Piani di cura: entry/procedure DEVE contenere un solo elemento code </assert>
			<assert test="count(hl7:procedure/hl7:effectiveTime)=0 or (count(hl7:procedure/hl7:effectiveTime[@value])=1 or count(hl7:procedure/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-b179|Sezione Piani di cura: entry/procedure/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale.</assert>
		
		<!--Sezione Piani di cura: encounter-->
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter[@moodCode='INT' or @moodCode='ARQ' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-b180|Sezione Piani di cura: entry/encounter DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'ARQ' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.4'])=1"
			>ERRORE-b181|Sezione Piani di cura: entry/encounter DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.4'</assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:id)=1"
			>ERRORE-b182|Sezione Piani di cura: entry/encounter DEVE contenere un solo elemento 'id'.</assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:code)=1"
			>ERRORE-b183|Sezione Piani di cura: entry/encounter DEVE contenere un solo elemento 'code' </assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.14' or @codeSystem='2.16.840.1.113883.5.4'])=1"
			>ERRORE-b184|Sezione Piani di cura: entry/encounter/code DEVE essere valorizzato secondo il value set "EncounterCode" - @codeSystem='2.16.840.1.113883.2.9.77.22.11.14' </assert>
			<assert test="count(hl7:encounter/hl7:effectiveTime)=0 or (count(hl7:encounter/hl7:effectiveTime/@value)=1 or count(hl7:encounter/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-b185|Sezione Piani di cura: entry/encounter/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale. </assert>
		
		<!--Sezione Piani di cura: act-->
			<assert test="count(hl7:act)=0 or count(hl7:act[@moodCode='INT' or @moodCode='ARQ' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-b186|Sezione Piani di cura: entry/act DEVE acere l'attributo @moodCode valorizzato secondo i seguenti valori: 'INT' or 'ARQ' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.5'])=1"
			>ERRORE-b187|Sezione Piani di cura: entry/act DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.5'</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:id)=1"
			>ERRORE-b188|Sezione Piani di cura: entry/act DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:act/hl7:effectiveTime)=0 or (count(hl7:act/hl7:effectiveTime[@value])=1 or count(hl7:act/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-b189|Sezione Piani di cura: entry/act/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale. </assert>
			
		</rule>
		
		
		
		<!--11-->
		<!--Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: controllo delle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:entry">
			
			<assert test="count(hl7:procedure/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.11.1'])=1"
			>ERRORE-b190| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: entry/procedure DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.11.1'. </assert>
			<assert test="(count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1 or
			count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.12'])=1 or
			count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.11.22.36'])=1)"
			>ERRORE-b191| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: entry/procedure DEVE contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
			- LOINC (@codeSystem: 2.16.840.1.113883.6.1)
			- ICD-9-CM (@codeSystem: 2.16.840.1.113883.6.103)
			- ProcedureTrapianti_PSSIT (2.16.840.1.113883.2.9.77.22.11.12)
			- IPSNoProceduresInfos  (@codeSystem='2.16.840.1.113883.11.22.36').</assert>
			
		</rule>	
	

	
		<!--12-->
		<!--Visite o ricoveri-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry">
			
			<assert test="count(hl7:encounter[@moodCode='EVN'])=1"
			>ERRORE-b192| Sezione Visite o ricoveri: entry/encounter DEVE avere l'attributo @moodCode valorizzato con 'EVN'.</assert>
			<assert test="count(hl7:encounter/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.12.1'])=1"
			>ERRORE-b193| Sezione Visite o ricoveri: entry/encounter DEVE contenere un elemento 'templateId valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.12.1'.</assert>
			<assert test="count(hl7:encounter/hl7:id)=1"
			>ERRORE-b194| Sezione Visite o ricoveri: entry/encounter DEVE contenere un 'id'.</assert>
			
			<assert test="(count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.14'])=1 or 
			count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1)"
			>ERRORE-b195| Sezione Visite o ricoveri: entry/encounter DEVE contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
			- LOINC (@codeSystem: 2.16.840.1.113883.6.1)
			- EncounterCode (@codeSystem=2.16.840.1.113883.2.9.77.22.11.14) (derivato da ActCode)
			- ActCode  (@codeSystem=2.16.840.1.113883.5.4).</assert>
			
			<assert test="count(hl7:encounter/hl7:text)=0 or count(hl7:encounter/hl7:text/hl7:reference/@value)=1"
			>ERRORE-b196| Sezione Visite o ricoveri: entry/encounter/text DEVE contenere un elemento reference/@value valorizzato con l’URI che punta alla descrizione estesa della visita o ricovero nel narrative block della sezione.</assert>
		
			<report test="not(count(hl7:encounter/hl7:performer)=1)"
			>W004| Sezione Visite o ricoveri: si consiglia di valorizzare, all'interno di entry/encounter, almeno un elemento 'performer'.--> </report>
		
		</rule>


	
		<!--13-->
		<!--Sezione Stato funzionale del paziente: controllo delle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:entry">
			
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.1'])=1"
			>ERRORE-b197| Sezione Stato funzionale del paziente: entry/organizer DEVE contenere un 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.1'. </assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation/hl7:code[@code='75246-9']])=1"
			>ERRORE-b198| Sezione Stato funzionale del paziente: entry/organizer DEVE contenere  una ed una sola component/observation relativa alla "Capacità motoria". </assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation/hl7:code[@code!='75246-9']])=0 or
			(count(hl7:organizer/hl7:component[hl7:observation/hl7:code[@code!='75246-9']])&lt;=1)"
			>ERRORE-b199| Sezione Stato funzionale del paziente: entry/organizer può contenere una ed una sola component/observation relativa al "Regime di assistenza" </assert>			
			
			<!--capacità motoria-->
			<assert test="count(hl7:organizer/hl7:component/hl7:observation/hl7:code[@code='75246-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b200| Sezione Stato funzionale del paziente: entry/organizer/component/observation (Capacità motoria) DEVE contenere un elemento 'code' valorizzato con @code='75246-9' e @codeSystem='2.16.840.1.113883.6.1'</assert>			
			<assert test="count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code='75246-9']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.15'])=1"
			>ERRORE-b201| Sezione Stato funzionale del paziente: entry/organizer/component/observation (Capacità motoria) DEVE contenere un elemento 'value' valorizzato secondo i seguenti code system:
			- LOINC (@codeSystem: 2.16.840.1.113883.6.1)
			- CapacitàMotoria_PSSIT  (@codeSystem=2.16.840.1.113883.2.9.77.22.11.15). </assert>
			
			<!--regime di assistenza-->
			<assert test="count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']])=0 or 
			count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']]/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1"
			>ERRORE-b202| Sezione Stato funzionale del paziente: entry/organizer/component/observation (Regime di assistenza) DEVE contenere un elemento 'code' valorizzato secondo il code system "ActCode" - @codeSystem='2.16.840.1.113883.5.4' </assert>
			<assert test="count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']]/hl7:value)=0 or
			count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.5.2.8'])=1"
			>ERRORE-b203| Sezione Stato funzionale del paziente: entry/organizer/component/observation/value (Regime di assistenza) DEVE essere valorizzato secondo il value set "AssistenzaDomiciliare_PSSIT" - @codeSystem='2.16.840.1.113883.2.9.5.2.8' </assert>
								
		</rule>
		
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:entry/hl7:organizer/hl7:component">
			
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.2'])=1"
				>ERRORE-b204| Sezione Stato funzionale del paziente: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.2'. </assert>
						
			</rule>
			
		
		
		
		<!--14-->
		<!--Indagini diagnostiche ed esami di laboratorio-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry">
			
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.1'])=1"
			>ERRORE-b205| Sezione Indagini diagnostiche ed esami di laboratorio:  entry/organizer DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.1'. </assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation])>=1"
			>ERRORE-b206| Sezione Indagini diagnostiche ed esami di laboratorio:  entry/organizer DEVE contenere almeno un elemento 'component' di tipo 'observation'</assert>
			
		</rule>
			
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry/hl7:organizer/hl7:component">
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.2'])=1"
				>ERRORE-b207| Sezione Indagini diagnostiche ed esami di laboratorio: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.2'.</assert>
				<assert test="count(hl7:observation/hl7:id)=1"
				>ERRORE-b208| Sezione Indagini diagnostiche ed esami di laboratorio: entry/organizer/component/observation DEVE contenere un solo elemento 'id'.</assert>
				
			</rule>


		<!--16-->
		<!--Esenzioni-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:entry">
			
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
			>ERRORE-b209| Sezione Esenzioni: entry/act DEVE avere valorizzati gli attributi nel seguente modo @classCode='ACT' e @moodCode='EVN'.</assert>		
			<assert test="count(hl7:act[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.17.1']])=1"
			>ERRORE-b210| Sezione Esenzioni: entry/act DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.17.1'. </assert>
			
			<assert test="count(hl7:act/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.22' or @codeSystem='2.16.840.1.113883.2.9.5.2.2'])=1 or 
			matches(hl7:act/hl7:code/@codeSystem,'2.16.840.1.113883.2.9.2.[0-9]{3}.6.22')"
			>ERRORE-b211| Sezione Esenzioni: entry/act/code DEVE essere valorizzato secondo i seguenti sistemi di codifica:
			- Catalogo Nazionale Esenzioni (2.16.840.1.113883.2.9.6.1.22)
			- Catalogo Regionale (2.16.840.1.113883.2.9.2.[REGIONE].6.22)
			- Catalogo Nazionale Nessuna Esenzione (2.16.840.1.113883.2.9.5.2.2)</assert>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b212| Sezione Esenzioni: entry/act DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
						($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
						($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
						($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-b213| Sezione Esenzioni: entry/act/effectiveTime DEVE avere un elemento 'high' nel caso in cui lo 'statusCode' è 'completed'|'aborted'.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:act)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
			>ERRORE-b214| Sezione Esenzioni: entry/act/entryRelationship/act relativo a Note e Commenti deve contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'</assert>
		</rule>


		
		<!--17-->
		<!--Reti di patologia-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:entry">
			
			<assert test="count(hl7:act[@classCode='PCPR'][@moodCode='EVN'])=1"
			>ERRORE-b215| Sezione Reti di Patologia: entry/act DEVE avere gli attributi valorizzati nel seguente modo @classCode='PCPR' e @moodCode='EVN'.</assert>		
			<assert test="count(hl7:act[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.18.1']])=1"
			>ERRORE-b216| Sezione Reti di Patologia: entry/act DEVE avere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.18.1'. </assert>
			<assert test="count(hl7:act/hl7:id)=1"
			>ERRORE-b217| Sezione Reti di Patologia: entry/act DEVE contenere un elemento 'id'.</assert>			
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b218| Sezione Reti di Patologia: entry/act DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
						($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
						($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
						($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-b219| Sezione Reti di Patologia: entry/act/effectiveTime DEVE contenere un elemento 'high' nel caso in cui lo 'statusCode' è 'completed'|'aborted'.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:act)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
			>ERRORE-b220| Sezione Reti di Patologia: entry/act/entryRelationship/act relativo a Note e Commenti deve contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'</assert>
		
		</rule>
		
	</pattern>
</schema>