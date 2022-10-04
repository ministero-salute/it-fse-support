<!-- schematron versione:17.0 -->
<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
		xmlns:cda="urn:hl7-org:v3"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:sch="http://www.ascc.net/xml/schematron"
        queryBinding="xslt2">
	<title>Schematron Laboratorio Analisi 1.3</title>
	<ns prefix="hl7" uri="urn:hl7-org:v3"/>
	<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<pattern id="all">

	<!--________________________________ HEADER _____________________________________________________________-->
	
		<!-- ClinicalDocument -->
		<rule context="hl7:ClinicalDocument">

			<!--Controllo realmCode-->	
			<assert test="count(hl7:realmCode)>=1"
			>ERRORE-1| L'elemento <name/> DEVE avere almeno un elemento 'realmCode'</assert>
			<assert test="count(hl7:realmCode[@code='IT'])= 1"
			>ERRORE-2| Almeno un elemento 'realmCode' DEVE avere l'attributo @root valorizzato come 'IT'</assert>

			<!-- Controllo su templateId-->
			<assert test="count(hl7:templateId)>=1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.1'])= 1 and  count(hl7:templateId/@extension)= 1"
			>ERRORE-4| Almeno un elemento 'templateId' DEVE essere valorizzato attraverso l'attributo  @root='2.16.840.1.113883.2.9.10.1.1' (id del template nazionale)  associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>
							
			<!-- Controllo su code-->	
			<assert test="count(hl7:code[@code='11502-2'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-5| L'elemento <name/>/code deve essere valorizzato con l'attributo @code='11502-2' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
						
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName='REFERTO DI LABORATORIO'])=1 or
			count(hl7:code[@displayName='Referto di Laboratorio'])=1 or count(hl7:code[@displayName='Referto di laboratorio'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Referto di laboratorio'.--> </report>
			
			<!-- Controllo su confidentialityCode-->
			<assert test="(count(hl7:confidentialityCode[@code='N'][@codeSystem='2.16.840.1.113883.5.25'])= 1) or 
			(count(hl7:confidentialityCode[@code='V'][@codeSystem='2.16.840.1.113883.5.25'])= 1)"
			>ERRORE-6| L'elemento  'confidentialityCode' di <name/> DEVE avere l'attributo @code  valorizzato con 'N' o 'V', e il suo @codeSystem  con '2.16.840.1.113883.5.25'</assert>
			
			<!--Controllo languageCode-->	
			<assert test="count(hl7:languageCode)=1"
			>ERRORE-7| L'elemento <name/> DEVE contenere un solo elemento 'languageCode' </assert>
			
			<!-- Controllo incrociato tra setId-versionNumber-relatedDocument-->
			<let name="versionNumber" value="hl7:versionNumber/@value"/>
			<assert test="(string(number($versionNumber)) = 'NaN') or
					($versionNumber= 1 and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
					>ERRORE 8| Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del
					ClinicalDocument.id deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori del setId ed id per un documento clinico possono coincidere solo per la prima versione di un documento.</assert>
			
			<assert test="(string(number($versionNumber)) ='NaN') or
						  ($versionNumber=1) or 
						  (($versionNumber &gt;1) and count(hl7:relatedDocument)=1)"
			>ERRORE-9| Se l'attributo <name/>/versionNumber/@value maggiore di  1 l'elemento <name/>  deve contenere un elemento di tipo 'relatedDocument'.</assert>
			
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
			ANA 2.16.840.1.113883.2.9.4.3.15.> 
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
			
			<assert test="count($patient)=0 or count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode)=1"
			>ERRORE-15| L'attributo <name/>/recordTarget/patientRole/patient DEVE contenere l'elemento administrativeGenderCode </assert>
			<assert test="count($patient)=0 or $genderOID='2.16.840.1.113883.5.1'"
			>ERRORE-16| L'OID assegnato all'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@codeSystem='<value-of select="$genderOID"/>' non è corretto. L'attributo DEVE essere valorizzato con '2.16.840.1.113883.5.1' </assert>
					
			<!--Controllo recordTarget/patientRole/patient/birthTime-->
			<assert test="count($patient)=0 or count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2' or 
			@root='2.16.840.1.113883.2.9.4.3.7' or @root='2.16.840.1.113883.2.9.4.3.3' or 
			@root='2.16.840.1.113883.2.9.4.3.17'])=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthTime)=1"
			>ERRORE-17| L'elemento <name/>/recordTaget/patientRole/patient DEVE riportare un elemento 'birthTime'.</assert>
			
			<!--Controllo recordTarget/patientRole/patient/birthplace/place/addr-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace)=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace/hl7:place/hl7:addr)=1"
			>ERRORE-18| L'elemento <name/>/recordTarget/patientRole/patient/birthplace DEVE contenere un elemento place/addr </assert>	
			
			
			
			<!-- Controllo author/assignedAuthor/id/@root -->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-19| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:author/hl7:assignedAuthor/hl7:assignedPerson"/>
			
			<assert test="count($name_author/hl7:name)=1"
			>ERRORE-20| L'elemento <name/>/author/assignedAuthor/assignedPerson DEVE avere l'elemento 'name' </assert>
			<assert test="count($name_author/hl7:name)=0 or (count($name_author/hl7:name/hl7:given)=1 and count($name_author/hl7:name/hl7:family)=1)"
			>ERRORE-21| L'elemento <name/>/author/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>

			<!-- controllo author/assignedAuthor/telecom -->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:telecom)>=1"
			>ERRORE-22| In ClinicalDocument/author/assignedAuthor DEVE essere presente almeno un elemento 'telecom' </assert>

			<!--Controllo ClinicalDocument/dataEnterer-->	
			<assert test="count(hl7:dataEnterer)=0 or count(hl7:dataEnterer/hl7:time)=1"
			>ERRORE-23| L'elemento <name/>/dataEnterer DEVE contenere un elemento 'time'</assert>
			
			<!-- Controllo dataEnterer/assignedEntity/id -->
			<let name="id_dataEnterer" value="hl7:dataEnterer/hl7:assignedEntity/hl7:id"/>
			<assert test="count(hl7:dataEnterer)=0 or count($id_dataEnterer[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-24| L'elemento ClinicalDocument/dataEnterer DEVE avere almeno un elemento 'id' <value-of select="$id_dataEnterer"/> con l'attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo dataEnterer/assignedEntity/assignedPerson-->
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:dataEnterer)=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1)"
			>ERRORE-25| L'elemento <name/>/dataEnterer/assignedEntity DEVE riportare l'elemento 'assignedPerson/name'.</assert>
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-26| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'.</assert>

			<!-- Controllo ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-27| ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and count($addr_cust/hl7:city)=$num_addr_cust and count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-28| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine'.</assert>


			<!--legalAuthenticator -->
			<assert test = "count(hl7:legalAuthenticator)= 1" 
			>ERRORE-29| L'elemento <name/>/legalAuthenticator è obbligatorio </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])= 1" 
			>ERRORE-30| L'elemento legalAuthenticator/signatureCode deve essere valorizzato con il codice "S"  </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-31| L'elemento legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root '2.16.840.1.113883.2.9.4.3.2'</assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-32| ClinicalDocument/legalAuthenticator/assignedEntity/assignedPerson DEVE contenere l'elemento 'name'. </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or (count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-33| ClinicalDocument/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			<!--Participant-->
			<assert test="count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name)=1)"
			>ERRORE-34| L'elemento <name/>/participant/associatedEntity/associatedPerson deve contenere l'elemento 'name'</assert>
			
			<assert test="count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:family)=1 and count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-35| L'elemento <name/>/participant/associatedEntity/associatedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
			
			<!-- controllo su inFulfillmentOf-->
			<let name="prioriry" value="hl7:inFulfillmentOf/hl7:order/hl7:priorityCode/@code"/>
			<assert test ="count(hl7:inFulfillmentOf)>=1" 
			>ERRORE-36| In ClinicalDocuemnt DEVE essere presente almeno un elemento 'inFulfillmentOf'. </assert>
			 <assert test ="count(hl7:inFulfillmentOf/hl7:order/hl7:priorityCode)=0 or 
			count(hl7:inFulfillmentOf/hl7:order/hl7:priorityCode[@codeSystem='2.16.840.1.113883.5.7'][@code='R' or @code='P' or @code='UR' or @code='EM'])=1"
            >ERRORE-37| <name/>/infulfillmentOf/order/priorityCode DEVE avere l'attributo '@codeSystem='2.16.840.1.113883.5.7' e @code valorizzato con uno dei seguenti valori: 'R'|'P'|'UR'|'EM' </assert>
					
			<!--controllo su documentationOf-->
			<!--report test = "count (hl7:documentationOf/hl7:serviceEvent/hl7:performer)!=0 or 
			(count (hl7:documentationOf/hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:addr)!=1 and 
			count (hl7:documentationOf/hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:telecom)!=1 )"
			>W003 | L'elemento ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity dovrebbe contenere address e telecom </report-->
			<assert test = "count (hl7:documentationOf/hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			count (hl7:documentationOf/hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-38| L'elemento ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson se presente, deve contenere l'elemento name </assert>
			<assert test = "count (hl7:documentationOf/hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=0 or 
			(count (hl7:documentationOf/hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and 
			count (hl7:documentationOf/hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-39|l'elemento ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson/name deve contenere gli attributi given e family </assert>
						

			<!--controllo su componentOf-->
			<let name="path_name" value="hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1 "
			>ERRORE-40| Deve essere presente l'elemento ClinicalDocument/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name </assert>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			(count($path_name/hl7:given)=1 and count($path_name/hl7:family)=1)"
			>ERRORE-41| L'elemento ClinicalDocument/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name deve contenere gli elementi given e family </assert>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:id)=1"
			>ERRORE-42| L'elemento ClinicalDocument/componentOf/encompassingEncounter/location/healthcareFacility/serviceProviderOrganization deve contenere l'elemento 'id' </assert>
		
		</rule>

		

		
	<!--________________________________CONTROLLI GENERICI_____________________________________________________________-->
		
		<!-- 6 -->
		<!-- verifica che gli elementi organizer di tipo battery contengano obbligatoriamente un elemento code -->
		<rule context="//*[@classCode='BATTERY']">
			<assert test="(count(hl7:code)=1)"
			>ERRORE-43| L’elemento organizer di tipo 'BATTERY' (@classCode='BATTERY') DEVE contenere l’elemento organizer/code.
			</assert>
		</rule>
		
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>ERRORE-44| L’elemento 'telecom' DEVE contenere l'attributo @use.
			</assert>
		</rule>
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension, '[A-Z0-9]{16}')"
			> ERRORE-45| codice fiscale '<value-of select="$CF"/>' cittadino ed operatore: 16 cifre [A-Z0-9]{16}</assert>
		</rule>
		
		
		<!--Verifica che i codici relativi al CodeSystem "UCUM" utilizzati siano corretti-->
		<!--rule context="//*[@unit]">
			<let name="val_UCUM" value="@unit"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.4.642.3.912.xml')//el[@code=$val_UCUM]"
			>ERRORE-46| Codice UCUM <value-of select="$val_UCUM"/> errato
			</assert>
		</rule-->


	<!-- _____________________________________________ BODY______________________________________________________-->
	
		<!--Controllo Sezione di Specialità-->
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section">
			
			<assert test="count(hl7:code[@code='18717-9'])>= 1 or count(hl7:code[@code='18718-7'])>= 1 or
						count(hl7:code[@code='18719-5'])>= 1 or count(hl7:code[@code='18720-3'])>= 1 or
						count(hl7:code[@code='18721-1'])>= 1 or count(hl7:code[@code='18722-9'])>= 1 or
						count(hl7:code[@code='18723-7'])>= 1 or count(hl7:code[@code='18724-5'])>= 1 or
						count(hl7:code[@code='18725-2'])>= 1 or count(hl7:code[@code='18727-8'])>= 1 or
						count(hl7:code[@code='18729-6'])>= 1 or count(hl7:code[@code='18729-4'])>= 1 or
						count(hl7:code[@code='18767-4'])>= 1 or count(hl7:code[@code='18768-2'])>= 1 or
						count(hl7:code[@code='18769-0'])>= 1 or count(hl7:code[@code='26435-8'])>= 1 or
						count(hl7:code[@code='26436-6'])>= 1 or count(hl7:code[@code='26437-4'])>= 1 or
						count(hl7:code[@code='26438-2'])>= 1 or count(hl7:code[@code='18716-1'])>= 1 or
						count(hl7:code[@code='26439-0'])>= 1 "
						>ERRORE-b1| L'elemento code della section DEVE essere valorizzato con uno dei seguenti codici LOINC individuati:
						18717-9 BANCA DEL SANGUE
						18718-7 MARCATORI CELLULARI 
						18719-5 CHIMICA
						18720-3	COAGULAZIONE
						18721-1 MONITORAGGIO TERAPEUTICO DEI FARMACI
						18722-9 FERTILITÀ
						18723-7 EMATOLOGIA
						18724-5 HLA
						18725-2 MICROBIOLOGIA
						18727-8 SEROLOGIA
						18728-6 TOSSICOLOGIA
						18729-4 ESAMI DELLE URINE
						18767-4 EMOGASANALISI
						18768-2 CONTE CELLULARE+DIFFERENZIALE
						18769-0 SUSCETTIBILITÀ ANTIMICROBICA
						26435-8 PATOLOGIA MOLECOLARE
						26436-6 ESAMI DI LABORATORIO
						26437-4 TEST DI SENSIBILITÀ A SOSTANZE CHIMICHE
						26438-2 CITOLOGIA
						18716-1 ALLERGOLOGIA
						26439-0 PATOLOGIA CHIRURGICA</assert>
			
			<assert test="count(hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b2| L'elemento code della section di specialità deve avere l'attributo @codeSystem valorizzato con '2.16.840.1.113883.6.1'.</assert>
			
			<!-- controllo su text --> 
			<assert test="(count(hl7:component/hl7:section)>=1 or count(hl7:text)=1) or (count(hl7:component/hl7:section)>=1 and count (hl7:text)=1)"
			>ERORE-b3| L'elemento component/structuredBody/component/section/text DEVE essere presente nel caso in cui non è riportata la sezione foglia. </assert>
			
					
			<!-- controllo section/entry/act/entryRelationship -->
			<assert test = "count(hl7:entry/hl7:act)=0 or 
			(count(hl7:entry/hl7:act/hl7:statusCode[@code='active' or @code='completed' or @code='aborted'])=1)"
			>ERRORE-b4| L'elemento <name/> /entry/act deve contenere l'elemento 'statusCode' valorizzato con uno dei seguenti valori:  active|completed|aborted </assert>
			
			<assert test = "count(hl7:entry/hl7:act)=0 or 
			(count(hl7:entry/hl7:act/hl7:entryRelationship[@typeCode='SUBJ'])=1 and 
			count(hl7:entry/hl7:act/hl7:entryRelationship[@inversionInd='true'])=1)"
			>ERRORE-b5| L'elemento <name/> /entry/act/entryRelationship deve avere gli attributi @typeCode="SUBJ"e @inversionInd="true" </assert>
		
			<assert test = "count(hl7:entry/hl7:act/hl7:entryRelationship)=0 or 
			(count(hl7:entry/hl7:act/hl7:entryRelationship/hl7:act/hl7:code[@code='48767-8'])=1 and 
			count(hl7:entry/hl7:act/hl7:entryRelationship/hl7:act/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1)"
			>ERROR-b6| L'elemento <name/> /entry/act/entryRelationship/act/code deve avere gli attributi @code="48767-8" e @codeSystem="2.16.840.1.113883.6.1" </assert>
			
			<assert test = "count(hl7:entry/hl7:act/hl7:entryRelationship)=0 or 
			(count(hl7:entry/hl7:act/hl7:entryRelationship/hl7:act/hl7:text/hl7:reference)=1)"
			>ERROR-b7| L'elemento <name/> /entry/act/entryRelationship/act/text deve contenere l'elemento reference </assert>
		
		</rule>
		
		<!--controllo entry/act/specimen sezione specialità-->	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:act/hl7:specimen">
			<assert test="count(hl7:specimenRole/hl7:id)>=1"
			>ERRORE-b8| Gli elementi entry/act/specimen/specimenRole DEVONO avere un elemento 'id'. </assert>
			<assert test="count(hl7:specimenRole/hl7:specimenPlayingEntity)=1" 
			>ERRORE-b9| L'elemento component/struturedBody/component/section/entry/act/specimen deve contenere l'elemento specimenRole/specimenPlayingEntity </assert>
			<assert test="count(hl7:specimenRole/hl7:specimenPlayingEntity/hl7:code)=1" 
			>ERRORE-b10| L'elemento entry/act/specimen/specimenRole/specimenPlayingEntity deve contenere l'elemento code</assert>
			
		</rule>
		
		<rule context = "hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:component/hl7:section">
		
				
		<!--Controllo Sezione Foglia-->
			
			<assert test = "count(hl7:component/hl7:section)=0" 
			>ERRORE-b11| La sezione foglia non deve includere ulteriori component</assert>
			
			<let name="stCode" value="hl7:entry/hl7:act/hl7:statusCode/@code"/>
			<assert test = "count(hl7:entry/hl7:act/hl7:statusCode)=1 and ($stCode='completed' or $stCode='active' or $stCode='aborted')"
			>ERRORE-b12| L'elemento entry/act/statusCode deve contenere l'attibuto @code = 'completed' or 'active' or 'aborted' </assert>
			
			<report test="not(count(hl7:entry/hl7:act/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1)"
			>W003 | Si consiglia di utilizzare il sistema di codifica LOINC per la valorizzazione dell'elemento  <name/> /entry/act/code.--> </report>

		</rule>
		
		<!-- 5 -->			
			<!-- controllo code Observation -->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:component/hl7:section/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation">
		
		    <report test ="not(count(hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1)"
			>W004 | Si consiglia di utilizzare il sistema di codifica LOINC per la valorizzazione dell'elemento entry/act/entryRelationship/observation/code.--> </report>
			
			<let name="obs_int" value="hl7:interpretationCode/@codeSystem"/>
			<assert test ="count(hl7:interpretationCode)=0 or $obs_int='2.16.840.1.113883.5.83'"
			> ERRORE-b13| L'elemento observation/interpretationCode DEVE essere valorizzato secondo il value set HL7 Observation Interpretation (2.16.840.1.113883.5.83)</assert>
			
		</rule>
		
		
		
		
		
	</pattern>
</schema>