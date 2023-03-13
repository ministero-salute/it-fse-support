<?xml version="1.0" encoding="UTF-8"?>
<!-- schematron versione: 5.1 -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
		xmlns:cda="urn:hl7-org:v3"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:sch="http://www.ascc.net/xml/schematron"
        queryBinding="xslt2">
	<title>Schematron Lettera Dimissione Ospedaliera V 1.2</title>
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
			>ERRORE-2| L'elemento 'realmCode' DEVE avere l'attributo @code valorizzato come 'IT'</assert>
	        
			<!--Controllo templateId-->
			<let name="num_tid" value="count(hl7:templateId)"/>
			<assert test="$num_tid >= 1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.5'])= 1 and  count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.5']/@extension)= 1"
			>ERRORE-4| Almeno un elemento 'templateId' DEVE essere valorizzato attraverso l'attributo @root='2.16.840.1.113883.2.9.10.1.5' (id del template nazionale), associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>
			
			<!--Controllo code-->	
			<assert test="count(hl7:code[@code='34105-7'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-5| L'elemento <name/>/code deve essere valorizzato con l'attributo @code='34105-7' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
	
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName='Lettera di dimissione ospedaliera'])=1 or
			count(hl7:code[@displayName='LETTERA DI DIMISSIONE OSPEDALIERA'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Lettera di dimissione ospedaliera'.--> </report>
						
			<!--Controllo confidentialityCode-->
			<assert test="(count(hl7:confidentialityCode[@code='N'][@codeSystem='2.16.840.1.113883.5.25'])= 1) or 
			(count(hl7:confidentialityCode[@code='V'][@codeSystem='2.16.840.1.113883.5.25'])= 1)"
			>ERRORE-6| L'elemento 'confidentialityCode' di <name/> DEVE avere l'attributo @code valorizzato con 'N' o 'V', e il @codeSystem='2.16.840.1.113883.5.25'</assert>
			
			<!--Controllo languageCode-->	
			<assert test="count(hl7:languageCode)=1"
			>ERRORE-7| L'elemento <name/> DEVE contenere un solo elemento 'languageCode' </assert>
			
			<!--Controllo incrociato tra setId-versionNumber e relatedDocument-->
			<let name="versionNumber" value="hl7:versionNumber/@value"/>
			<assert test="(string(number($versionNumber)) = 'NaN') or
					($versionNumber= '1' and count(hl7:setId)=0) or 
					($versionNumber= 1 and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
			>ERRORE-8| Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del
			ClinicalDocument.id deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori di setId ed id per un documento clinico coincidono solo per la prima versione di un documento</assert>
			
			<assert test="(string(number($versionNumber)) ='NaN') or
						  ($versionNumber=1) or 
						  (($versionNumber &gt;1) and count(hl7:relatedDocument)=1)"
			>ERRORE-9| Se l'attributo <name/>/versionNumber/@value è maggiore di 1, l'elemento <name/>  deve contenere un elemento di tipo 'relatedDocument'</assert>
			
			<!--Controllo recordTarget-->
			<assert test="count(hl7:recordTarget)=1"
			>ERRORE-10| L'elemento <name/> DEVE contenere un solo elemento 'recordTarget' </assert>
			
            <!--Controllo recordTarget/patientRole/id-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.7'])=1 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.3'])=1 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.18'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.17'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.15'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.10.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.20.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.30.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.41.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.42.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.50.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.60.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.70.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.80.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.90.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.100.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.110.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.120.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.130.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.140.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.150.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.160.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.170.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.180.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.190.4.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.200.4.1'])=1"
			>ERRORE-11a| L'elemento <name/>/recordTarget/patientRole/id  deve avere l'attributo @root valorizzato tramite uno dei seguenti identificatori Nazionanli:
			CF 2.16.840.1.113883.2.9.4.3.2
			TEAM 2.16.840.1.113883.2.9.4.3.7 o 2.16.840.1.113883.2.9.4.3.3
			ENI 2.16.840.1.113883.2.9.4.3.18
			STP 2.16.840.1.113883.2.9.4.3.17
			ANA 2.16.840.1.113883.2.9.4.3.15
			Oppure tramite gli identificatori Regionali generati per rappresentare l'id del paziente.
			</assert>
			
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
			
			
			<!--Controllo ClinicalDocument/dataEnterer-->	
			<assert test="count(hl7:dataEnterer)=0 or count(hl7:dataEnterer/hl7:time)=1"
			>ERRORE-23| L'elemento <name/>/dataEnterer DEVE contenere un elemento 'time'</assert>
			
			<let name="id_dataEnterer" value="hl7:dataEnterer/hl7:assignedEntity/hl7:id"/>
			
			<assert test="count(hl7:dataEnterer)=0 or count($id_dataEnterer[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-24| L'elemento <name/>/dataEnterer/assignedEntity DEVE avere almeno un elemento 'id' <value-of select="$id_dataEnterer"/> con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo dataEnterer/assignedEntity/assignedPerson-->
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:dataEnterer)=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1)"
			>ERRORE-25| L'elemento <name/>/dataEnterer/assignedEntity DEVE riportare l'elemento 'assignedPerson/name'.</assert>
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-26| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'.</assert>	
			
		    <!--Controllo ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-27| <name/>/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and count($addr_cust/hl7:city)=$num_addr_cust and count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-28| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>
		
		    <!--Controllo ClinicalDocument/legalAuthenticator-->
			<!--let name='statusCode' value='hl7:sdtc:statusCode'/-->
			<assert test = "count(hl7:legalAuthenticator)= 1" 
			>ERRORE-29| L'elemento <name/>/legalAuthenticator è obbligatorio </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])= 1" 
			>ERRORE-30| L'elemento <name/>/legalAuthenticator/signatureCode deve essere valorizzato con il codice "S" </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-31| L'elemento <name/>/legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-32| L'elemento <name/>/legalAuthenticator/assignedEntity/assignedPerson DEVE contenere l'elemento 'name'</assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1"
			>ERRORE-33| L'elemento <name/>/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			
		    <!--Controllo ClinicalDocument/componentOf-->
			<assert test="count(hl7:componentOf)=1"
			>ERRORE-39| L'elemento componentOf è obbligatorio </assert>
			<assert test="count(hl7:componentOf)=0 or count(hl7:componentOf/hl7:encompassingEncounter/hl7:id)=1"
			>ERRORE-40| L'elemento <name/>/componentOf/encompassingEncounter deve contenere l'elemento 'id' </assert>
			<assert test="count(hl7:componentOf)=0 or 
			count(hl7:componentOf/hl7:encompassingEncounter/hl7:effectiveTime/hl7:low)=1 and count(hl7:componentOf/hl7:encompassingEncounter/hl7:effectiveTime/hl7:high)=1"
			>ERRORE-41| L'elemento <name/>/componentOf/encompassingEncounter/effectiveTime deve contenere gli elementi 'low' e 'high' valorizzati </assert>
			
			<let name="path_name" value="hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1 "
			>ERRORE-42| Deve essere presente l'elemento <name/>/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name </assert>
			<assert test="count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			(count($path_name/hl7:given)=1 and count($path_name/hl7:family)=1)"
			>ERRORE-43| L'elemento <name/>/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name deve contenere gli elementi 'given' e 'family' </assert>
			<assert test="count(hl7:componentOf)=0 or count(hl7:componentOf/hl7:encompassingEncounter/hl7:location)=1"
			>ERRORE-44| L'elemento componentOf/encompassingEncounter DEVE contenere l'elemento 'location'</assert>
			<assert test="count(hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:id)=1"
			>ERRORE-45| L'elemento <name/>/componentOf/encompassingEncounter/location/healthcareFacility/serviceProviderOrganization deve contenere l'elemento 'id' </assert>
						
		</rule>
		
		<!-- Controllo author-->
		<rule context="hl7:ClinicalDocument/hl7:author">
			<!-- Controllo author/assignedAuthor/id/@root -->
			<assert test="count(hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-19| L'elemento <name/>/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!-- controllo author/assignedAuthor/telecom -->
			<assert test="count(hl7:assignedAuthor/hl7:telecom)>=1"
			>ERRORE-20| L'elemento <name/>/assignedAuthor DEVE deve contenere almeno un elemento 'telecom'</assert>
			
			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:assignedAuthor/hl7:assignedPerson"/>
			
			<assert test="count($name_author/hl7:name)=1"
			>ERRORE-21| L'elemento <name/>/assignedAuthor/assignedPerson DEVE avere l'elemento 'name' </assert>
			<assert test="count($name_author/hl7:name)=0 or (count($name_author/hl7:name/hl7:given)=1 and count($name_author/hl7:name/hl7:family)=1)"
			>ERRORE-22| L'elemento <name/>/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
		</rule>
		
		<!-- Controllo participant-->
		<rule context="hl7:ClinicalDocument/hl7:participant">
			<assert test="count(hl7:associatedEntity/hl7:id)>=1"
			>ERRORE-34| L'elemento <name/>/associatedEntity deve contenere l'elemento 'id'.</assert>
			<let name="num_addr_pcp" value="count(hl7:associatedEntity/hl7:addr)"/>
            <let name="addr_pcp" value="hl7:associatedEntity/hl7:addr"/>
            <assert test="$num_addr_pcp=0 or (count($addr_pcp/hl7:country)=$num_addr_pcp and
                          count($addr_pcp/hl7:city)=$num_addr_pcp and
                          count($addr_pcp/hl7:streetAddressLine)=$num_addr_pcp)"
            >ERRORE-35| L'elemento <name/>/associatedEntity/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			<assert test="count(hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:associatedEntity/hl7:associatedPerson/hl7:name)=1)"
			>ERRORE-36| L'elemento <name/>/associatedEntity/associatedPerson deve contenere l'elemento 'name'</assert>
			
			<assert test="count(hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:family)=1 and count(hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-37| L'elemento <name/>/associatedEntity/associatedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
		</rule>
		
		<!-- Controllo inFulfillmentOf-->
		<rule context="hl7:ClinicalDocument/hl7:inFulfillmentOf">
			<let name="prioriry" value="hl7:order/hl7:priorityCode/@code"/>
			<assert test ="count(hl7:order/hl7:priorityCode)=0 or 
			count(hl7:order/hl7:priorityCode[@codeSystem='2.16.840.1.113883.5.7'][@code='R' or @code='P' or @code='UR' or @code='EM'])=1"
            >ERRORE-38| <name/>/order/priorityCode DEVE avere l'attributo '@codeSystem='2.16.840.1.113883.5.7' e @code valorizzato con uno dei seguenti valori: 'R'|'P'|'UR'|'EM' </assert>
		</rule>
		
	<!--________________________________CONTROLLI GENERICI_____________________________________________________________-->
	
		<!--Controllo use Telecom-->
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>Errore-46| L’elemento 'telecom' DEVE contenere l'attributo @use </assert>
		</rule>	
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension, '[A-Z0-9]{16}') and string-length($CF)=16"
			>Errore-47| codice fiscale '<value-of select="$CF"/>' cittadino ed operatore: 16 cifre [A-Z0-9]{16}</assert>
		</rule>
	
		<!--Controllo sugli attributi di observation-->
		<rule context="//hl7:observation">
			<let name="moodCd" value="@moodCode"/>
			<assert test="count(@classCode)=0 or @classCode='OBS'"
			>Errore-48| L'attributo "@classCode" dell'elemento "observation" deve essere valorizzato con "OBS" </assert>
			<assert test="$moodCd='EVN'"
			>Errore-49| L'attributo "@moodCode" dell'elemento "observation" deve essere valorizzato con "EVN" </assert>
		</rule>

		<!--Controllo sugli attributi di act-->
		<rule context="//hl7:act">
			<let name="mood_act" value="@moodCode"/>
			<let name="class_act" value="@classCode"/>
			<assert test="$mood_act='EVN'"
			>Errore-50| L'attributo "@moodCode" dell'elemento "Act" deve essere valorizzato con "EVN" </assert>
			<assert test="$class_act='ACT'"
			>Errore-51| L'attributo "@classCode" dell'elemento "Act" deve essere valorizzato con "ACT" </assert>
		</rule>
		
		<!--Verifica che i codici relativi al CodeSystem "UCUM" utilizzati siano corretti-->
		<!--rule context="//*[@unit]">
			<let name="val_UCUM" value="@unit"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.4.642.3.912.xml')//el[@code=$val_UCUM]"
			>ERRORE-52| Codice UCUM <value-of select="$val_UCUM"/> errato
			</assert>
		</rule-->
		
		
		
	<!-- _____________________________________________ BODY______________________________________________________-->
	  
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody">
		                             <!--Controllo sulle Section obbligatorie-->
			<!-- Motivo del Ricovero-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='46241-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b1| Sezione Motivo del Ricovero: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46241-6']]/hl7:text)=1"
			>ERRORE-b2| Sezione Motivo del Ricovero: la sezione deve contenere l'elemento 'text'</assert>
					
			<!--Decorso Ospedaliero-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='8648-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b3| Sezione Decorso Ospedaliero: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8648-8']]/hl7:text)=1"
			>ERRORE-b4| Sezione Decorso Ospedaliero: La sezione deve contenere l'elemento 'text'</assert>
			
			<!--Condizioni del paziente e diagnosi alla dimissione-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='11535-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b5| Sezione Condizioni del paziente e diagnosi alla dimissione: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11535-2']]/hl7:text)=1"
			>ERRORE-b6| Sezione Condizioni del paziente e diagnosi alla dimissione: La sezione DEVE contenere l'elemento 'text'</assert>
			<report test="not(count(hl7:component/hl7:section[hl7:code[@code='11535-2']]/hl7:entry)&gt;=1)"
			>W003|  Sezione Condizioni del paziente e diagnosi alla dimissione: La sezione PUO' contenere l'elemento 'entry' </report>
		   
                                        
									<!--Controllo sulle Section opzionali-->
		   	<!--Inquadramento Clinico Iniziale-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47039-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='47039-3']]/hl7:text)=1"
			>ERRORE-b7| Sezione Inquadramento Clinico Iniziale: deve contenere l'elemento 'text'</assert>
			
			<!--Complicanze-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='55109-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='55109-3']]/hl7:text)=1"
			>ERRORE-b8| Sezione Complicanze: deve contenere l'elemento "text"</assert>
			
			<!--Riscontri e accertamenti significativi-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11493-4']])=0 or count(hl7:component/hl7:section[hl7:code[@code='11493-4']]/hl7:text)=1"
			>ERRORE-b9| Sezione Riscontri ed accertamenti significativi: deve contenere l'elemento 'text'</assert>
			
			<!--Consulenza-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='34104-0']])=0 or count(hl7:component/hl7:section[hl7:code[@code='34104-0']]/hl7:text)=1"
			>ERRORE-b10| Sezione Consulenza: deve contenere l'elemento 'text'</assert>
			
			<!--Esami eseguiti durante il ricovero-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:text)=1"
			>ERRORE-b11| Sezione Esami eseguiti durante il ricovero: deve contenere l'elemento "text" </assert>
		   
		   <!--Procedure Eseguite durante il ricovero-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47519-4']])=0 or count(hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:text)=1"
			>ERRORE-b12| Sezione Procedure Eseguite durante il ricovero: deve contenere l'elemento 'text'</assert>
			
		   	<!--Allergie-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='48765-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:text)=1"
			>ERRORE-b13| Sezione Allergie: deve contenere l'elemento "text" </assert>
			
			<!--Terapia farmacologica effettuata durante il ricovero-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10160-0']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:text)=1"
			>ERRORE-b14| Sezione Terapia farmacologica effettuata durante il ricovero: deve contenere l'elemento "text" </assert>	
		  		   
		    <!--Terapia farmacologica alla dimissione-->
			 <assert test="count(hl7:component/hl7:section[hl7:code[@code='10183-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10183-2']]/hl7:text)=1"
			 >ERRORE-b15| Sezione Terapia farmacologica alla dimissione: deve contenere l'elemento "text" </assert>
			 
			 <!--Istruzioni di follow-up-->
			 <assert test="count(hl7:component/hl7:section[hl7:code[@code='18776-5']])=0 or count(hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:text)=1"
			 >ERRORE-b16| Sezione Istruzioni di follow-up: deve contenere l'elemento 'text'</assert>

		</rule>

		<!--Controllo sui codici delle Section-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section">
		
			<let name="codice" value="hl7:code/@code"/>
			<assert test="count(hl7:code[@code='46241-6'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='47039-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='8648-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 
			or count(hl7:code[@code='55109-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='11493-4'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='34104-0'][@codeSystem='2.16.840.1.113883.6.1'])=1 
			or count(hl7:code[@code='30954-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='47519-4'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='48765-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='10160-0'][@codeSystem='2.16.840.1.113883.6.1'])=1 
			or count(hl7:code[@code='11535-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='10183-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='18776-5'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b17| Il codice '<value-of select="$codice"/>' non è corretto. La sezione deve essere valorizzata con uno dei seguenti codici:
			46241-6	Sezione Motivo del ricovero
			47039-3	Sezione Inquadramento clinico iniziale
			8648-8  Sezione Decorso Ospedaliero
			55109-3 Sezione Complicanze
			11493-4 Sezione Riscontri ed accertamenti significativi
			34104-0 Sezione Consulenza
			30954-2 Sezione Esami eseguiti durante il ricovero
			47519-4 Sezione Procedure eseguite durante il ricovero
			48765-2 Sezione Allergie
			10160-0 Sezione Terapia farmacologica effettuata durante il ricovero
			11535-2 Sezione Condizioni del paziente alla dimissione e diagnosi alla dimissione
			10183-2 Sezione Terapia farmacologica alla dimissione
			18776-5 Sezione Istruzioni di follow-up
			</assert>
		</rule>	
		 
		<!-- Motivo di Ricovero: controllo sulle entry -->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46241-6']]/hl7:entry">
		
			<assert test="count(hl7:observation/hl7:code[@code='8646-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b18| Sezione Motivo di Ricovero: l'elemento entry/observation/code deve avere l'attributo @code='8646-2' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:value)=1"
			>ERRORE-b19| Sezione Motivo di Ricovero: l'elemento entry/observation DEVE contenere l'elemento value che dettaglia il Motivo del Ricovero</assert>
			<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-b20| Sezione Motivo di Ricovero: l'elemento entry/observation/value  DEVE  essere valorizzato attraverso il dizionario ICD9-CM </assert>
		</rule>
		
		<!--Inquadramento Clinico Iniziale: Controllo sulle sotto-sezioni opzionali (Anamnesi, Esame Obiettivo, Terapia Farmacoloica all'ingresso)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47039-3']]/hl7:component">
		
			<!--Anamnesi-->
			<assert test="count(hl7:section[hl7:code[@code='11329-0']])=0 or count(hl7:section[hl7:code[@code='11329-0']]/hl7:text)=1"
			>ERRORE-b21| Sotto-sezione Anamnesi: deve contenere l'elemento 'text'</assert>
			<!--Esame Obiettivo-->
			<assert test="count(hl7:section[hl7:code[@code='29545-1']])=0 or count(hl7:section[hl7:code[@code='29545-1']]/hl7:text)=1"
			>ERRORE-b22| Sotto-sezione Esame Obiettivo: deve contenere l'elemento 'text'</assert>
			<!--Terapia Farmacologica all'ingresso-->
			<assert test="count(hl7:section[hl7:code[@code='42346-7']])=0 or count(hl7:section[hl7:code[@code='42346-7']]/hl7:text)=1"
			>ERRORE-b23| Sotto-sezione Terapia Farmacologica all'ingresso: deve contenere l'elemento 'text'</assert>
		</rule>
		
			<!--Anamnesi: controllo sulle entry-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47039-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry">

				<assert test="count(hl7:observation/hl7:code[@code='75326-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b24| Sotto-sezione Anamnesi: l'elemento entry/observation/code deve avere gli attributi @code='75326-9' e @codeSystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-b25| Sotto-sezione Anamnesi: l'elemento entry/observation/statusCode deve avere l'attributo @code='completed'</assert>
				<assert test="count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-b26| Sotto-sezione Anamnesi: l'elemento entry/observation/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato</assert>
				<assert test="count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-b27| Sotto-sezione Anamnesi: l'elemento entry/observation/value deve avere l'attributo @xsi:type="CD" </assert>
				<assert test="(count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1) or
				count(hl7:observation/hl7:value/@code)=1"
				>ERRORE-b28| Sotto-sezione Anamnesi: nel caso di 'value' non codificato (in entry/observation), deve essere valorizzato l'elemento 'originalText/reference'</assert>
					
			</rule>
		
			<!--Anamnesi: Cronicità e Stato Clinico della patologia (entry/observation/entryRelationship/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47039-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:observation/hl7:entryRelationship">
				
				<assert test="(count(hl7:observation/hl7:code[@code='89261-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
				count(hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1)"
				>ERRORE-b29| Sotto-sezione Anamnesi: l'elemento entry/observation/entryRelationship/observation/code deve avere l'attributo @code valorizzato con:
				"89261-2" per "Dettaglio Cronicità patologia"
				"33999-4" per "Dettaglio Stato patologia"
				</assert>
				<assert test="count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value)=0 or 
				(count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
				count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10'])=1)"
				>ERRORE-b30| Sotto-sezione Anamnesi: l'elemento 'value' relativo alla Cronicità deve essere valorizzato secondo il Value set "CronicitàProblema"</assert>
				
				<assert test="count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value)=0 or 
				(count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@code='LA28752-6'])=1 or
				count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@code='LA18821-1'])=1)"
				>ERRORE-b30a| Sotto-sezione Anamnesi: l'attributo @code di entry/observation/entryRelationship/observation/value relativo alla Cronicità deve essere valorizzato con:
				- "LA28752-6" se "chronic";
				- "LA18821-1" se "acute".
				</assert>
					
				<!--per il controllo inerente al sistema di codifica da utilizzare, c'è la possibilità di usare anche sistemi di codifica locali-->
				<assert test="count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value)=0 or 
				(count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
				count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.7'])=1)"
				>ERRORE-b31| Sotto-sezione Anamnesi: l'elemento 'value' relativo allo Stato Clinico della patologia deve essere valorizzato secondo il Value set "StatoClinicoProblema"</assert>
				
				<assert test="count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value)=0 or 
				(count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@code='LA16666-2'])=1 or
				count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@code='LA18632-2'])=1)"
				>ERRORE-b31a| Sotto-sezione Anamnesi: l'attributo @code di entry/observation/entryRelationship/observation/value relativo allo Stato Clinico della patologia deve essere valorizzato con:
				- "LA16666-2" se "active";
				- "LA18632-2" se "inactive".
				</assert>
					
			</rule>
		
		<!--Complicanze: controllo sui sotto-elementi di entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='55109-3']]/hl7:entry">
			
			<assert test="count(hl7:observation/hl7:code[@code='75326-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b32| Sezione Complicanze:l'elemento entry DEVE contenere al suo interno un observation che valorizza  l'elemento "code" con attributi @code='75326-9' e @codeSystem='2.16.840.1.113883.6.1 </assert>
			<assert test="count(hl7:observation/hl7:value)=1"
			>ERRORE-b33| Sezione Complicanze: entry/observation deve contenere l'elemento "value"</assert>
		</rule>
		
		<!--Consulenza: controllo sui sotto elementi di entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='34104-0']]/hl7:entry">	

			<assert test="count(hl7:observation/hl7:value)=1"
			>ERRORE-b34| Sezione Consulenza: l'elemento entry/observation DEVE contenere l'elemento 'value'</assert>
		</rule>
		
			<!--Consulenza: controllo sui sotto elementi del performer-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='34104-0']]/hl7:entry/hl7:observation/hl7:performer">
				
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
				>ERRORE-b35| Sezione Consulenza: l'elemento entry/observation/performer/assignedEntity/assignedPerson DEVE contenere l'elemento name</assert>
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and 
				count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1"
				>ERRORE-b36| Sezione Consulenza: se presente section/entry/observation/performer/assignedEntity/assignedPerson/name deve contenere gli elementi "given" e "family" </assert>
				
			</rule>
			<!--Consulenza: controllo sui sotto elementi del participant-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='34104-0']]/hl7:entry/hl7:observation/hl7:participant">
				
				<assert test="count(hl7:participantRole)=1 and count(hl7:participantRole/hl7:id)>=1"
				>ERRORE-b37| Sezione Consulenza: l'elemento entry/observation/participant DEVE contenere l'elemento 'participantRole' e almeno un elemento 'id'</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name)=1"
				>ERRORE-b38| Sezione Consulenza: l'elemento entry/observation/participant/participantRole/playingEntity DEVE contenere l'elemento name</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and 
				count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
				>ERRORE-b39| Sezione Consulenza: se presente section/entry/observation/participant/participantRole/playingEntity/name deve contenere gli elementi "given" e "family" </assert>
			
			</rule>
			
		<!--Esami eseguiti durante il ricovero: controllo sui sotto elementi di entry-->	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry">
		
			<assert test="count(hl7:observation)=1"
			>ERRORE-b40| Sezione Esami eseguiti durante il ricovero: se presente l'elemento section/entry, deve contenere l'elemento "observation" </assert>
			<!--assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-87| Sezione Esami eseguiti durante il ricovero: l'entry/observation/code può essere valorizzato secondo i sistemi di codifica
			LOINC @codeSystem='2.16.840.1.113883.6.1'
			ICD-9-CM @codeSystem='2.16.840.1.113883.6.103'</assert-->
			<report test="not(count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1) and 
			not(count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1)"
			>W004 | Sezione Esami eseguiti durante il ricovero: l'entry/observation/code può essere valorizzato secondo i sistemi di codifica
			LOINC @codeSystem='2.16.840.1.113883.6.1'
			ICD-9-CM @codeSystem='2.16.840.1.113883.6.103'</report>
		</rule>
		
			<!--Esami eseguiti durante il ricovero: controllo sui sotto elementi di performer-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry/hl7:observation/hl7:performer">
				
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
				>ERRORE-b41| Sezione Esami eseguiti durante il ricovero: section/entry/observation/performer/assignedEntity/assignedPerson deve avere l'elemento "name" </assert>
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1"
				>ERRORE-b42| Sezione Esami eseguiti durante il ricovero: section/entry/observation/performer/assignedEntity/assignedPerson/name deve contenere gli elementi "given" e "family" </assert>
			</rule>
		
			<!--Esami eseguiti durante il ricovero: controllo sui sotto elementi di participant-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry/hl7:observation/hl7:participant">
				
				<assert test="count(hl7:participantRole/hl7:id)>=1"
				>ERRORE-b43| Sezione Esami eseguiti durante il ricovero: se presente section/entry/observation/participant deve avere l'elemento "participantRole/id" </assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name)=1"
				>ERRORE-b44| Sezione Esami eseguiti durante il ricovero: se presente section/entry/observation/participant/participantRole/playingEntity deve avere l'elemento "name" </assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1"
				>ERRORE-b45| Sezione Esami eseguiti durante il ricovero: se presente section/entry/observation/participant/participantRole/playingEntity/name deve contenere gli elementi "given" e "family" </assert>
			</rule>
	
		<!--Procedure eseguite durante il ricovero: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:entry">
			
			<assert test="count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1 or count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.12'])=1"
			>ERRORE-b46|Sezione Procedure Eseguite durante il ricovero: l'elemento entry/procedure/code deve essere valorizzato con uno dei seguenti sistemi di codifica:
			  -2.16.840.1.113883.6.1
			  -2.16.840.1.113883.6.103
			  -2.16.840.1.113883.2.9.77.22.11.12
			</assert>
		</rule>	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:entry/hl7:procedure/hl7:entryRelationship">
		
			<assert test="@typeCode='RSON'"
			>ERRORE-b47|Sezione Procedure Eseguite durante il ricovero: L'elemento proceduere/entryRelationship, deve avere un attributo @typeCode='RSON' </assert>
			<assert test="count(hl7:observation)=1"
			>ERRORE-b48| Sezione Procedure Eseguite durante il ricovero: L'elemento proceduere/entryRelationship, deve avere un elemento 'observation'.</assert>
			<report test="not(count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1)"
			>W005| Sezione Procedure Eseguite durante il ricovero: Si consiglia di valorizzare l'attributo @codeSystem dell'elemento procedure/entryRelationship/observation/code con il sistema di codifica ICD-9-CM (@codesystem='2.16.840.1.113883.6.103')--> </report>
		</rule>
		
		<!--Allergie-->	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry">
		
			<assert test="count(hl7:act)=1"
			>ERRORE-b49| Sezione Allergie: la sezione deve contenere l'elemento entry di tipo 'act'</assert>
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			
			<assert test="count(hl7:act)=0 or 
			$status='active' or $status='completed' or $status='aborted' or $status='suspended'"
			>ERRORE-b50| Sezione Allergie: l'elemento 'statusCode' deve essere valorizzato secondo il value set ActStatus: 'active'|'completed'|'aborted'|'suspended'</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b51| Sezione Allergie: l'elemento 'effectiveTime' deve essere presente e deve avere l'elemento 'low' valorizzato</assert>
			<assert test="count(hl7:act)=0 or ($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
					($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
					($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
					($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-b52| Sezione Allergie: l'elemento 'effectiveTime/high' deve essere presente nel caso in cui lo 'statusCode' sia 'completed'oppure'aborted'</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:code[@code='52473-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b53| Sezione Allergie: l'entry/act deve includere uno ed un solo elemento entryRelationship/observation con attributo @code='52473-6'</assert>	
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:text)=0 or 
						count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:text/hl7:reference/@value)=1"
			>ERRORE-b54| Sezione Allergie: l'entry/act/entryRelationship/observation/text/reference/value deve essere valorizzato con l'URI che punta alla descrizione di allarme, allergia o intolleranza nel narrative block della sezione </assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b55| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/statusCode/@code deve assumere il valore costante 'completed'</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-b56| Sezione Allergie: l'elemento 'effectiveTime' deve essere presente e deve avere l'elemento 'low' valorizzato </assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value)=0 or 
						count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-b57| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/value deve avere l'attributo @xsi:type='CD'</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=0 or 
						count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.4' or @codeSystem='2.16.840.1.113883.1.11.19700'])=1"
			>ERRORE-b58| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/value codificato, deve avere l'attributo @code valorizzato secondo il 
			value set "ObservationIntoleranceType" (@codeSystem=2.16.840.1.113883.1.11.19700) oppure il dizionario "ActCode" (@codeSystem=2.16.840.1.113883.5.4).</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=1 or 
						count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1"
			>ERRORE-b59| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/value non codificato, deve avere l'elemento originalText/reference valorizzato </assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText)=0 or 
						count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText/hl7:reference/@value)=1"
			>ERRORE-b60| Sezione Allergie: entry/act/entryRelationship/observation/value/originalText/reference/value deve essere valorizzato con l'URI che punta alla descrizione del concetto espresso all'interno del narrative block </assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant)>=1"
			>ERRORE-b61| Sezione Allergie: entry/act/entryRelationship/observation deve contenere almeno un elemento 'participant'</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation)&lt;=1)"
			>ERRORE-b62| Sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/observation' relativo alla Criticità</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR']/hl7:observation)&lt;=1)"
			>ERRORE-b63| Sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/observation' relativo allo Stato dell'allergia</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:act)&lt;=1)"
			>ERRORE-b64| Sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/act' relativo ai Commenti</assert>
			
		</rule>
		
			<!--Descrizione Agente-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant">
				
				<!--Descrizione Agente Codificato-->
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
					count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
					count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2'])=1"
					>ERRORE-b65| Sezione Allergie: l'elemento participant/participantRole/playingEntity deve avere l'attributo code/@codeSystem valorizzato come segue:
					- '2.16.840.1.113883.6.73' per la codifica "WHO ATC"
					- '2.16.840.1.113883.2.9.6.1.5' per la codifica "AIC"
					- '2.16.840.1.113883.2.9.77.22.11.2' per il value set "AllergenNoDrugs" (- per le allergie non a farmaci –)
				</assert>
			</rule>
			
			<!--Descrizione Reazione-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='MFST']">	
				
				<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b66| Sezione Allergie: entryRelationship/observation (Descrizione Reazioni) deve avere un elemento 'code' con gli attributi @code=75321-0' e @codeSystem='2.16.840.1.113883.6.1' e @displayName='Obiettività Clinica'</assert>
				<assert test="count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-b67| Sezione Allergie: L'entryRelationship/observation (Descrizione Reazioni) deve avere un 'effectiveTime' con l'elemento 'low' valorizzato</assert>
		
				<!--Descrizione Reazione Codificata-->
				<assert test="count(hl7:observation/hl7:value)=0 or	count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-b68| Sezione Allergie: l'elemento 'value' di entryRelationship/observation (Descrizione Reazioni) deve avere l'attributo @xsi:type='CD'</assert>
				<assert test="count(hl7:observation/hl7:value)=0 or
							(count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1) or
							(count(hl7:observation/hl7:value/@code)=1 and (count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)&lt;=1))"
				>ERRORE-b69| Sezione Allergie: nel caso di 'value' non codificato (in Descrizione Reazioni), questo deve avere l'elemento originalText/reference valorizzato</assert>
				<assert test="count(hl7:observation/hl7:value/@code)=0 or
							(count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.4'])=1 or 
							count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3'])=1 or 
							count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1)"
				>ERRORE-b70| Sezione Allergie: entryRelationship/observation/value (in Descrizione Reazioni) deve avere l'attributo @codeSystem valorizzato come segue:
				- "2.16.840.1.113883.2.9.77.22.11.4" per le reazioni da allergia 
				- "2.16.840.1.113883.2.9.77.22.11.3" per le reazioni da intolleranza 
				- "2.16.840.1.113883.6.103" per le reazioni riportate nel sistema ICD-9-CM
				</assert>
			</rule>
		
			<!--Criticità dell'allergia o intolleranza-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation]">
				
				<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1"
				>ERRORE-b71| Sezione Allergie: entryRelationship/observation (Criticità dell'allergia) deve avere l'attributo @codesystem='2.16.840.1.113883.5.4'</assert>
				<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.1063'])=1"
				>ERRORE-b72| Sezione Allergie: entryRelationship/observation/value (Criticità dell'allergia) deve essere valorizzato secondo il value set "CriticalityObservation" @codesystem='2.16.840.1.113883.5.1063'</assert>
				<assert test="count(hl7:observation/hl7:text)=0 or count(hl7:observation/hl7:text/hl7:reference/@value)=1"
				>ERRORE-b73| Sezione Allergie: entry/act/entryRelationship/observation/text/reference/value deve essere valorizzato con l'URI che punta alla descrizione della severità nel narrative block della sezione </assert>	
			</rule>
			
			<!--Stato dell'Allergia-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR']">
				
				<assert test="count(hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b74| Sezione Allergie: l'elemento 'code' all'interno di entryRelationship/observation (Stato dell'allergia) deve avere l'attributo @code='33999-4' e @codesystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.7'])=1"
				>ERRORE-b75| Sezione Allergie: l'elemento 'value' all'interno di entryRelationship/observation (Stato dell'allergia) deve essere valorizzato secondo il value set "StatoClinicoProblema" (@codesystem='2.16.840.1.113883.2.9.77.22.11.7') oppure secondo il dizionario LOINC (@codesystem='2.16.840.1.113883.6.1')</assert>
				
				<assert test="count(hl7:observation/hl7:value[@code='LA16666-2'])=1 or
				count(hl7:observation/hl7:value[@code='LA18632-2'])=1"
				>ERRORE-b75a| Sezione Allergie (stato dell'allergia): il @code di entry/act/entryRelationship/observation/entryRelationship/observation/value deve essere valorizzato con:
				- "LA16666-2" se "active";
				- "LA18632-2" se "inactive".
				</assert>
			</rule>
			
			<!--Commenti-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act]">
				
				<assert test="count(hl7:act/hl7:code[@code='48767-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b76| Sezione Allergie: l'elemento 'code' all'interno di entryRelationship/act (Commenti) deve avere l'attributo @code='48767-8' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			</rule>
		
		<!--Terapia farmacologica effettuata durante il ricovero: controllo sotto-elementi di entry-->		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry">
			
			<assert test="count(hl7:substanceAdministration[@moodCode='EVN'])=1"
			>ERRORE-b77| Sezione Terapia farmacologica effettuata durante il ricovero: se presente section/entry deve avere l'elemento "substanceAdministration" con attributi "classCode=SBADM"e "moodCode=EVN" </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
						count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1"
			>ERRORE-b78| Sezione Terapia farmacologica effettuata durante il ricovero: l'elemento section/entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code deve avere l'attributo "@codeSystem" valorizzato come segue:
			- '2.16.840.1.113883.2.9.6.1.5' codifica "AIC"
			- '2.16.840.1.113883.6.73' codifica "WHO ATC" </assert>
			
			<let name="stats" value="hl7:substanceAdministration/hl7:statusCode/@code"/>
			<assert test="$stats='active' or $stats='completed' or $stats='aborted' or $stats='suspended'"
			>ERRORE-b79| Sezione Terapia farmacologica effettuata durante il ricovero: section/entry/substanceAdministration deve avere l'elemento "statusCode" valorizzato secondo il value set ActStatus: 'active'|'completed'|'aborted'|'suspended'</assert>
			<assert test="count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1"
			>ERRORE-b80| Sezione Terapia farmacologica effettuata durante il ricovero: section/entry/substanceAdministration/effectiveTime deve avere l'elemento 'low' valorizzato </assert>
			<assert test="($stats='completed' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or
					($stats='aborted' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or 
					($stats='suspended' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0) or 
					($stats='active' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0)"
			>ERRORE-b81| Sezione Terapia farmacologica effettuata durante il ricovero: section/entry/substanceAdministration/effectiveTime/high deve essere presente solo nel caso in cui lo 'statusCode' è 'completed'oppure'aborted'</assert>
		</rule>
		
			<!--Terapia farmacologica effettuata durante il ricovero: controllo sotto-elementi di performer-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry/hl7:substanceAdministration/hl7:performer">
			
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
				>ERRORE-b82| Sezione Terapia farmacologica effettuata durante il ricovero: se presente section/entry/substanceAdministration/assignedEntity/assignedPerson deve avere l'elemento "name" </assert>
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1"
				>ERRORE-b83| Sezione Terapia farmacologica effettuata durante il ricovero: se presente section/entry/substanceAdministration/performer/assignedEntity/assignedPerson/name deve contenere gli elementi "given" e "family" </assert>
			</rule>
	
			<!--Terapia farmacologica effettuata durante il ricovero: controllo sotto-elementi di participant-->	
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry/hl7:substanceAdministration/hl7:participant">
				
				<assert test="count(hl7:participantRole/hl7:id)>=1"
				>ERRORE-b84| Sezione Terapia farmacologica effettuata durante il ricovero: se presente section/entry/substanceAdministration/participant, deve avere almeno un elemento "participantRole/id" </assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name)=1"
				>ERRORE-b85| Sezione Terapia farmacologica effettuata durante il ricovero: se presente section/entry/substanceAdministration/participant/participantRole/playingEntity, deve avere l'elemento "name" </assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
				>ERRORE-b86| Sezione Terapia farmacologica effettuata durante il ricovero: se presente section/entry/substanceAdministration/participant/participantRole/playingEntity/name, deve contenere gli elementi "given" e "family" </assert>
			</rule>
			
			<!--Terapia farmacologica effettuata durante il ricovero: controllo sotto-elementi di entryRelationship-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship">
				
				<assert test="count(hl7:observation)=1 or count(hl7:supply)=1"
				>ERRORE-b87| Sezione Terapia farmacologica effettuata durante il ricovero: se presente section/entry/substanceAdministration/entryRelationship  deve contenere uno o più elementi di tipo "observation" o "supply" </assert>
			</rule>
		
		<!--Condizioni paziente diagnosi dimissione-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11535-2']]/hl7:entry">
			
			<assert test="count(hl7:observation)=1"
			>ERRORE-b88| Sezione Condizioni del paziente e diagnosi alla dimissione: la section/entry deve contenere l'elemento 'observation'</assert>
			<assert test="count(hl7:observation/hl7:code[@code='8651-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b89| Sezione Condizioni del paziente e diagnosi alla dimissione: l'elemento entry/observation/code deve avere l'attributo @code='8651-2' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:value)=0 or count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-b90| Sezione Condizioni del paziente e diagnosi alla dimissione: l'elemento entry/observation/value deve avere l'attributo @codeSystem='2.16.840.1.113883.6.103'</assert>
		</rule>
		
		<!--Terapia farmacologica alla dimissione: controllo sotto-elementi di entry-->		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10183-2']]/hl7:entry">
		
			<assert test="count(hl7:substanceAdministration[@classCode='SBADM'][@moodCode='INT'])=1"
			>ERRORE-b91|Sezione Terapia farmacologica alla dimissione: se presente section/entry deve avere l'elemento "substanceAdministration" con attributi "classCode=SBADM"e "moodCode=INT" </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
						count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
						count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1"
			>ERRORE-b92|Sezione Terapia farmacologica alla dimissione: l'elemento section/entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code deve avere l'attributo "@codeSystem" valorizzato come segue:
			- '2.16.840.1.113883.2.9.6.1.5' codifica "AIC"
			- '2.16.840.1.113883.6.73' codifica "WHO ATC" 
			- '2.16.840.1.113883.2.9.6.1.51' codifica "GE"
			</assert>
			
			<let name="stscd" value="hl7:substanceAdministration/hl7:statusCode/@code"/>
			<assert test="$stscd='active' or $stscd='completed' or $stscd='aborted' or $stscd='suspended'"
			>ERRORE-b93|Sezione Terapia farmacologica alla dimissione: section/entry/substanceAdministration deve avere l'elemento "statusCode" valorizzato secondo il value set ActStatus: 'active'|'completed'|'aborted'|'suspended'</assert>
			<assert test="count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1"
			>ERRORE-b94|Sezione Terapia farmacologica alla dimissione: section/entry/substanceAdministration/effectiveTime deve avere l'elemento 'low' valorizzato </assert>
			<assert test="($stscd='completed' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or
					($stscd='aborted' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or 
					($stscd='suspended' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0) or 
					($stscd='active' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0)"
			>ERRORE-b95|Sezione Terapia farmacologica alla dimissione: section/entry/substanceAdministration/effectiveTime/high deve essere presente solo nel caso in cui lo 'statusCode' sia 'completed'oppure'aborted'</assert>
		</rule>
		
			<!--Terapia farmacologica effettuata alla dimissione: controllo sotto-elementi di participant-->	
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10183-2']]/hl7:entry/hl7:substanceAdministration/hl7:participant">
					
					<assert test="count(hl7:participantRole/hl7:id)>=1"
					>ERRORE-b96|Sezione Terapia farmacologica alla dimissione: se presente section/entry/substanceAdministration/participant, deve avere almeno un elemento "participantRole/id" </assert>
					<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name)=1"
					>ERRORE-b97|Sezione Terapia farmacologica alla dimissione: se presente section/entry/substanceAdministration/participant/participantRole/playingEntity, deve avere l'elemento "name" </assert>
					<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
					>ERRORE-b98|Sezione Terapia farmacologica alla dimissione: se presente section/entry/substanceAdministration/participant/participantRole/playingEntity/name, deve contenere gli elementi "given" e "family" </assert>
				</rule>
		
			<!--Terapia farmacologica alla dimissione: controllo sotto-elementi di entryRelationship-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10183-2']]/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship">
			
				<assert test="count(hl7:observation)=1 or count(hl7:supply)=1"
				>ERRORE-b99|Sezione Terapia farmacologica alla dimissione: se presente section/entry/substanceAdministration/entryRelationship  deve contenere uno o più elementi di tipo "observation" o "supply" </assert>
			</rule>
		
		
		
	</pattern>
</schema>
	

