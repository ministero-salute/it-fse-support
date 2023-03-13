<?xml version="1.0" encoding="UTF-8"?>
<!-- schematron versione: 2.7 -->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
		xmlns:cda="urn:hl7-org:v3"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:sch="http://www.ascc.net/xml/schematron"
        queryBinding="xslt2">
	<title>Schematron Scheda della Singola Vaccinazione 1.1 </title>
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
			>ERRORE-2| L'elemento <name/>/realmCode DEVE avere l'attributo @code valorizzato come 'IT'</assert>
			
			<!--Controllo templateId-->
			<let name="num_tid" value="count(hl7:templateId)"/>
			<assert test="$num_tid >= 1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.1.1'])= 1 and  count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.1.1']/@extension)= 1"
			>ERRORE-4| Almeno un elemento <name/>/templateId DEVE essere valorizzato attraverso l'attributo @root='2.16.840.1.113883.2.9.10.1.11.1.1', associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>
			
			<!--Controllo code-->	
			<assert test="count(hl7:code[@code='87273-9'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-5| L'elemento <name/>/code DEVE essere valorizzato con l'attributo @code='87273-9' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
	
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName='Immunization Note'])=1 or
			count(hl7:code[@displayName='IMMUNIZATION NOTE'])=1 or count(hl7:code[@displayName='Immunization note'])=1 or count(hl7:code[@displayName=' Immunization note'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Immunization Note'--> </report>
			
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
					($versionNumber= '1' and count(hl7:setId)=0) or 
					($versionNumber= 1 and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
			>ERRORE-8| Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del ClinicalDocument.id 
			deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori di setId ed id per un documento clinico coincidono solo per la prima versione di un documento</assert>
			
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
			Oppure tramite gli identificatori regionali generati per rappresentare l'id del paziente.
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
			>ERRORE-17| L'elemento <name/>/recordTaget/patientRole/patient DEVE riportare un elemento 'birthTime'</assert>
			
			
			<!--Controllo recordTarget/patientRole/patient/birthplace/place/addr-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace)=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace/hl7:place/hl7:addr)=1"
			>ERRORE-18| L'elemento <name/>/recordTarget/patientRole/patient/birthplace DEVE contenere un elemento place/addr </assert>	
			
						
			
		    <!--Controllo ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-23| <name/>/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and count($addr_cust/hl7:city)=$num_addr_cust and count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-24| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>
			
			
			<!--Controllo legalAuthenticator-->
			<assert test = "(count(hl7:legalAuthenticator)&lt;=1)" 
			>ERRORE-25| L'elemento <name/>/legalAuthenticator può essere presente una volta sola</assert>
			<assert test = "count(hl7:legalAuthenticator)=0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])=1" 
			>ERRORE-26| L'elemento <name/>/legalAuthenticator/signatureCode deve essere valorizzato con il codice "S" </assert>
			<assert test = "count(hl7:legalAuthenticator)=0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-27| L'elemento <name/>/legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<assert test = "count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=0
			or (count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and 
			count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-28| L'elemento <name/>/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
				
			
		</rule>

		<!-- Controllo author-->
		<rule context="hl7:ClinicalDocument/hl7:author">
			<!--Controllo author/assignedAuthor/id-->
			<assert test="count(hl7:assignedAuthor/hl7:id/@nullFlavor)=1 or 
			count(hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-19| L'elemento <name/>/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
											
			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:assignedAuthor/hl7:assignedPerson"/>
		
		    <assert test="count(hl7:assignedAuthor/hl7:id/@nullFlavor)=1 or count($name_author/hl7:name)=1"
			>ERRORE-20| L'elemento <name/>/assignedAuthor/assignedPerson DEVE avere l'elemento 'name' </assert>
			<assert test="count(hl7:assignedAuthor/hl7:id/@nullFlavor)=1 or count($name_author/hl7:name)=0 or
			(count($name_author/hl7:name/hl7:given)=1 and count($name_author/hl7:name/hl7:family)=1)"
			>ERRORE-21| L'elemento <name/>/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
		
			<!--let name="num_addr_auth" value="count(hl7:assignedAuthor/hl7:representedOrganization/hl7:addr)"/>
			<let name="addr_auth" value="hl7:assignedAuthor/hl7:representedOrganization/hl7:addr"/>
			<assert test="$num_addr_auth=0 or (count($addr_auth/hl7:country)=$num_addr_auth and
			count($addr_auth/hl7:city)=$num_addr_auth and 
			count($addr_auth/hl7:streetAddressLine)=$num_addr_auth)"
			>ERRORE-22| L'elemento <name/>/assignedAuthor/representedOrganization/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert-->
			
		</rule>
		
		<!-- Controllo participant-->
		<rule context="hl7:ClinicalDocument/hl7:participant">
			<assert test="count(hl7:associatedEntity/hl7:id)>=1"
			>ERRORE-29| L'elemento <name/>/associatedEntity deve contenere l'elemento 'id'</assert>
			<assert test="count(hl7:associatedEntity/hl7:associatedPerson)=0 or count(hl7:associatedEntity/hl7:associatedPerson/hl7:name)=1"
			>ERRORE-30| L'elemento <name/>/associatedEntity/associatedPerson deve contenere l'elemento 'name'</assert>
			<assert test="count(hl7:associatedEntity/hl7:associatedPerson)=0 
			or(count(hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:family)=1 and count(hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-31| L'elemento <name/>/associatedEntity/associatedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
			
		</rule>
		
	<!--__________________________________________________________CONTROLLI GENERICI________________________________________________________________-->


		<!--Controllo use Telecom-->
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>ERRORE-32| L’elemento 'telecom' DEVE contenere l'attributo @use </assert>
		</rule>	
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension, '[A-Z0-9]{16}') and string-length($CF)=16"
			>ERRORE-33| Il codice fiscale '<value-of select="$CF"/>' cittadino ed operatore deve essere costituito da 16 cifre [A-Z0-9]{16}</assert>
		</rule>
	
		<!--Controllo sugli attributi di observation-->
		<rule context="//hl7:observation">
			<let name="moodCd" value="@moodCode"/>
			<assert test="count(@classCode)=0 or @classCode='OBS'"
			>ERRORE-34| L'attributo "@classCode" dell'elemento "observation" deve essere valorizzato con 'OBS' </assert>
			<assert test="$moodCd='EVN'"
			>ERRORE-35| L'attributo "@moodCode" dell'elemento "observation" deve essere valorizzato con "EVN" </assert>
		</rule>

		
		
		
		<!--___________________________________________________________________BODY__________________________________________________________________________-->
	
		
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component">
			<assert test="count(hl7:section[@classCode='DOCSECT'][@moodCode='EVN'])=1"
			>ERRORE-b1| La section DEVE contenere gli attributi @classCode='DOCSECT' @moodCode='EVN'.</assert>
			<assert test="count(hl7:section/hl7:templateId)=0 or count(hl7:section/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.3.1'])=1"
			>ERRORE-b2| L'elemento section DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.11.3.1' </assert>
			<assert test="count(hl7:section/hl7:code)=0 or count(hl7:section/hl7:code[@code='11369-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b3| L'elemento section/code DEVE contenere gli attributi valorizzati nel seguente modo: @code='11369-6' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:section/hl7:title)=1"
			>ERRORE-b4| L'elemento section DEVE contenere un elemento 'title'.</assert>
			<assert test="count(hl7:section/hl7:text)=1"
			>ERRORE-b5| L'elemento section DEVE contenere un elemento 'text'.</assert>
			<assert test="count(hl7:section/hl7:entry)=1"
			>ERRORE-b6| L'elemento section DEVE contenere un solo elemento 'entry' relativo ad uno dei seguenti casi:
			- "Dati Vaccinazione"
			- "Esonero/omissione o differimento".</assert>
		</rule>
		<!--controllo sulla entry-->
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry">
			
			<assert test="count(hl7:substanceAdministration[@classCode='SBADM'][@moodCode='EVN'])=1"
			>ERRORE-b7| L'elemento entry/substanceAdministration DEVE avere gli attributi valorizzati con @classCode='SBADM' e @moodCode='EVN'.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=1 or 
			count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'])=1"
			>ERRORE-b8| L'elemento entry/substanceAdministration DEVE contenere un elemento 'templateId' valorizzato con uno dei seguenti modi:
			- @root='2.16.840.1.113883.2.9.10.1.11.4.1' per "Dati Vaccinazione"
			- @root='2.16.840.1.113883.2.9.10.1.11.4.2' per "Esonero/omissione o differimento".</assert>
			
			<!--Dati vaccinazione-->
			
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0 or 
			count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b9| L'elemento entry/substanceAdministration (Dati vaccinazione) DEVE contenere un elemento 'statusCode' valorizzato con l'attributo @code='completed'.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0 or 
			count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:effectiveTime)=1"
			>ERRORE-b10| L'elemento entry/substanceAdministration (Dati vaccinazione) DEVE contenere un elemento 'effectiveTime'.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0 or 
			count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:consumable[@typeCode='CSM'])=1"
			>ERRORE-b11| L'elemento entry/substanceAdministration DEVE contenere un elemento 'consumable' con l'attributo @typeCode='CSM' valorizzato.</assert>
						
			<report test="not(count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0) and 
			not(count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:routeCode)=1)"
			>W003| Si consiglia di valorizzare la via di somministrazione tramite l'elemento 'routeCode'.--> </report> 	
			<report test="not(count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0) and 
			not(count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:approachSiteCode)=1)"
			>W004| Si consiglia di valorizzare la sede anatomica di somministrazione tramite l'elemento 'approachSiteCode' .--> </report>			
			<report test="not(count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0) and 
			not(count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:doseQuantity)=1)"
			>W005| Si consiglia di valorizzare la dose somministrata tramite l'elemento 'doseQuantity'.--> </report>
			
			<let name="farma" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0 or 
			(count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1)"
			>ERRORE-b12|L'elemento entry/substanceAdministration/templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'] se presente, DEVE contenere l'elemento consumable/manufacturedProduct/manufacturedMaterial/code valorizzato secondo i seguenti sistemi di codifica:
			- @codeSystem='2.16.840.1.113883.2.9.6.1.5' 	(AIC)
			</assert>	
			
			<!--Controllo incrociato tra code e translation-->
			<assert test="(count($farma/hl7:code/hl7:translation)=0 or 
			count($farma/hl7:code/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1)"
			>ERRORE-b13| L'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation deve essere valorizzato secondo i seguenti sistemi di codifica:
			- @codeSystem='2.16.840.1.113883.6.73'		(ATC)
			</assert>
			<let name="consum" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:consumable/hl7:manufacturedProduct"/>
			<assert test="(count($consum/hl7:manufacturerOrganization)=0 or
			count($consum/hl7:manufacturerOrganization/hl7:name)&gt;=1)"
			>ERRORE-b14| L'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturerOrganization DEVE contenere almeno un elemento 'name'.</assert>
			
			<assert test="count(hl7:substanceAdministration/hl7:participant)=0 or (count(hl7:substanceAdministration/hl7:participant[@typeCode='LOC'])>=1)"
			>ERRORE-b15| L'elemento entry/substanceAdministration/participant DEVE essere valorizzato con l'attributo @typeCode='LOC'</assert>
			<assert test="count(hl7:substanceAdministration/hl7:participant/hl7:participantRole/@classCode)=0 or 
			(count(hl7:substanceAdministration/hl7:participant/hl7:participantRole[@classCode='ROL'])>=1)"
			>ERRORE-b16| L'elemento entry/substanceAdministration/participant/participantRole DEVE essere valorizzato con l'attributo @typeCode='ROL'</assert>
		
				<!-- entryRelationship - Numero di dose-->
				<assert test="count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'])&lt;=1"
				>ERRORE-b17| L'elemento entry/substanceAdministration/entryRelationship relativo al "Numero di dose" può essere presente una volta sola.</assert>			
				
				<assert test="count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'])=0 or 
				count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][@inversionInd='true']/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.3'])=1"
				>ERRORE-b18| L'elemento entry/substanceAdministration/entryRelationship/observation (Numero dose) DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.11.4.3'</assert>			
				<assert test="count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'])=0 or  
				count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation/hl7:code[@code='30973-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b19| L'elemento entry/substanceAdministration/entryRelationship/observation (Numero dose) DEVE contenere l'elemento 'code' valorizzato con gli attributi @code='30973-2' e @codeSystem='2.16.840.1.113883.6.1'.</assert>			
				<assert test="count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'])=0 or 
				count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-b20| L'elemento entry/substanceAdministration/entryRelationship/observation (Numero dose) DEVE contenere l'elemento 'statusCode' valorizzato con l'attributo @code='completed'.</assert>			
				<assert test="count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'])=0 or 
				count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation/hl7:value[@xsi:type='INT'])=1"
				>ERRORE-b21| L'elemento entry/substanceAdministration/entryRelationship/observation (Numero dose) DEVE contenere l'elemento value valorizzato con l'attributo @xsi:type='INT'.</assert>
					
				
				<!--entryRelationship relativa al periodo di copertura/ data prossimo vaccino-->
				<assert test="count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:entryRelationship[@typeCode='REFR'])&lt;=2"
				>ERRORE-b22| L'elemento entry/substanceAdministration/entryRelationship relativo al "Periodo di Copertura /prossimo appuntamento" può essere presente al più due volte.</assert>			
				
				
				<!--entryRelationship relativa alla categorie a rischio-->
				<let name="risk" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.5']]"/>
				
				<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0 or 
				count($risk)&lt;=1"
				>ERRORE-b23| L'elemento entry/substanceAdministration/entryRelationship/observation (Categorie a rischio) DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.11.4.5'</assert>	
				<assert test="count($risk)=0 or 
				count($risk/hl7:code[@code='95715-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b24| L'elemento entry/substanceAdministration/entryRelationship (Categorie a rischio) DEVE contenere l'elemento code valorizzato con gli attributi @code='95715-9' e @codeSystem='2.16.840.1.113883.6.1'.</assert>			
				<assert test="count($risk)=0 or 
				count($risk/hl7:statusCode[@code='completed'])=1"
				>ERRORE-b25| L'elemento entry/substanceAdministration/entryRelationship (Categorie a rischio) DEVE contenere l'elemento statusCode valorizzato con l'attributo @code='completed'.</assert>			
				<assert test="count($risk)=0 or 
				count($risk/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-b26| L'elemento entry/substanceAdministration/entryRelationship (Categorie a rischio) DEVE contenere l'elemento value valorizzato con l'attributo @xsi:type='CD'.</assert>
	
		
				<!--entryRelationship relativa alla condizioni sanitarie a rischio-->
				<let name="cond" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.6']]"/>
				
				<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1'])=0 or 
				count($cond)&lt;=1"
				>ERRORE-b27| L'elemento entry/substanceAdministration/entryRelationship (condizioni sanitarie a rischio) DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.11.4.6'</assert>	
				<assert test="count($cond)=0 or 
				count($cond/hl7:code[@code='59785-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b28| L'elemento entry/substanceAdministration/entryRelationship (condizioni sanitarie a rischio) DEVE contenere l'elemento code valorizzato con gli attributi @code='59785-6' e @codeSystem='2.16.840.1.113883.6.1'.</assert>			
				<assert test="count($cond)=0 or 
				count($cond/hl7:statusCode[@code='completed'])=1"
				>ERRORE-b29| L'elemento entry/substanceAdministration/entryRelationship (condizioni sanitarie a rischio) DEVE contenere l'elemento statusCode valorizzato con l'attributo @code='completed'.</assert>			
				<assert test="count($cond)=0 or 
				count($cond/hl7:value[@xsi:type='CD'][@codeSystem='2.16.840.1.113883.6.103'])=1"
				>ERRORE-b30| L'elemento entry/substanceAdministration/entryRelationship (condizioni sanitarie a rischio) DEVE contenere l'elemento value valorizzato con l'attributo @xsi:type='CD' e @codeSystem='2.16.840.1.113883.6.103'.</assert>
				
				<!--entryRelationship relativa alle reazioni avverse-->
				<let name="reaction" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:entryRelationship[@typeCode='CAUS']"/>
				
				<assert test="count($reaction)=0 or 
				count($reaction/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.8']])=1"
				>ERRORE-b31| L'elemento entry/substanceAdministration/entryRelationship (reazioni avverse) DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.11.4.8'.</assert>		
				<assert test="count($reaction)=0 or 
				count($reaction/hl7:observation/hl7:code[@code='31044-1'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b32| L'elemento entry/substanceAdministration/entryRelationship (reazioni avverse) DEVE contenere l'elemento code valorizzato con gli attributi @code='31044-1' e @codeSystem='2.16.840.1.113883.6.1'.</assert>			
				<assert test="count($reaction)=0 or 
				count($reaction/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-b33| L'elemento entry/substanceAdministration/entryRelationship (reazioni avverse) DEVE contenere l'elemento statusCode valorizzato con l'attributo @code='completed'.</assert>						
				<assert test="count($reaction/hl7:observation/hl7:value)=0 or 
				count($reaction/hl7:observation/hl7:value[@xsi:type='CD'][@codeSystem='2.16.840.1.113883.6.103'])=1"
				>ERRORE-b34| L'elemento entry/substanceAdministration/entryRelationship/observation/value (reazioni avverse) DEVE essere valorizzato secondo il sistema di codifica ICD9-CM (@codeSystem='2.16.840.1.113883.6.103').</assert>
				
			
			<!--entry/substanceAdministration dati esonero/omissione o differimento-->
		
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'])=0 or 
			count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:statusCode[@code='cancelled'])=1"
			>ERRORE-b35| L'elemento entry/substanceAdministration/templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'] (in Dati Esonero/omissione o differimento) DEVE contenere l'elemento statusCode valorizzato con l'attributo @code='cancelled'.</assert>		
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'])=0 or 
			count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:effectiveTime)=1"
			>ERRORE-b36| L'elemento entry/substanceAdministration/templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'] DEVE contenere l'elemento effectiveTime.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'])=0 or 
			count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:consumable[@typeCode='CSM'])=1"
			>ERRORE-b37|L'elemento entry/substanceAdministration/templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'] DEVE contenere l'elemento consumable con l'attributo @typeCode='CSM' valorizzato .</assert>
			<let name="farma_de" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($farma_de/hl7:code)=0 or
			count($farma_de/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1"
			>ERRORE-b37.1| L'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial (in Dati Esonero/omissione o differimento) può contenere un elemento 'code' valorizzato secondo AIC - @codeSystem='2.16.840.1.113883.2.9.6.1.5'.</assert>
			<!--assert test="count($farma_de/hl7:code/hl7:translation)=0 or
			(count($farma_de/hl7:code/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1)"
			>ERRORE-b37.2| L'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code (in Dati Esonero/omissione o differimento) può contenere un elemento 'translation' valorizzato secondo ATC - @codeSystem='2.16.840.1.113883.6.73'.</assert-->
		
				<!--entryRelationship ragione esonero/omissione o differimento-->
				<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'])=0 or 
				count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON'][hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10']])=1"
				>ERRORE-b38| L'elemento entry/substanceAdministration/entryRelationship/observation (Ragione esonero/omissione o differimento) DEVE contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.11.4.10'.</assert>						
				<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'])=0 or 
				count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10']]/hl7:code[@code='85714-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-b39| L'elemento entry/substanceAdministration/entryRelationship/observation (Ragione esonero/omissione o differimento) DEVE contenere l'elemento 'code' valorizzato con gli attributi @code='85714-4' e @codeSystem='2.16.840.1.113883.6.1'.</assert>					
				<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2'])=0 or 
				count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10']]/hl7:statusCode[@code='completed'])=1"
				>ERRORE-b40| L'elemento entry/substanceAdministration/entryRelationship/observation (Ragione esonero/omissione o differimento) DEVE contenere l'elemento 'statusCode' valorizzato con l'attributo @code='completed'.</assert>			
				<assert test="count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10']]/hl7:effectiveTime)=0 or 
				count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10']]/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-b41| L'elemento entry/substanceAdministration/entryRelationship[@typeCode='RSON']/observation/effectiveTime (Ragione esonero/omissione o differimento) DEVE contenere l'elemento 'low'.</assert>				
				<assert test="count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10']]/hl7:effectiveTime)=0 or 
				count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON']/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10']]/hl7:effectiveTime/hl7:high)=1"
				>ERRORE-b42| L'elemento entry/substanceAdministration/entryRelationship[@typeCode='RSON']/observation/effectiveTime (Ragione esonero/omissione o differimento) DEVE contenere l'elemento 'high'.</assert>				
		
		
		</rule>
		
		<!--entryRelationship - periodo di copertura/prossimo appuntamento-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.1']]/hl7:entryRelationship[@typeCode='REFR']">
			
			<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.4'])=1"
			>ERRORE-b43| L'elemento entry/substanceAdministration/entryRelationship/observation (Periodo di copertura/prossimo appuntamento) DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.11.4.4'.</assert>
			<assert test="(count(hl7:observation/hl7:code[@code='59778-1'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:observation/hl7:code[@code='59778-1'][@codeSystem='2.16.840.1.113883.4.642.3.308'])=1) or
			(count(hl7:observation/hl7:code[@code='30980-7'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
			count(hl7:observation/hl7:code[@code='30980-7'][@codeSystem='2.16.840.1.113883.4.642.3.308'])=1)"
			>ERRORE-b44|L'elemento entry/substanceAdministration/entryRelationship valorizzato con l'attributo @typeCode='REFR' DEVE avere l'lemento observation/code valorizzato con i seguenti attributi:
			- @code='59778-1' con i seguenti sistemi di codifica @codeSystem='2.16.840.1.113883.6.1' o @codeSystem='2.16.840.1.113883.4.642.3.308' (Periodo di Copertura)
			- @code='30980-7' con i seguenti sistemi di codifica @codeSystem='2.16.840.1.113883.6.1' o @codeSystem='2.16.840.1.113883.4.642.3.308' (Schedulazione prossimo Vaccino)
			</assert>	
			<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b45|L'elemento entry/substanceAdministration/entryRelationship[@typeCode='REFR'] DEVE contenere l'elemento statusCode valorizzato sempre con il code 'completed'.</assert>	
			<assert test="count(hl7:observation/hl7:value[@xsi:type='IVL_TS' or @xsi:type='TS'])=1"
			>ERRORE-b46|L'elemento entry/substanceAdministration/entryRelationship[@typeCode='REFR'] DEVE contenere l'elemento value valorizzato con l'attributo @xsi:type='IVL_TS' o @xsi:type='TS'.</assert>
			
		
		</rule>
		
		<!--entryRelationship relativa alla malattia per cui si effettua la vaccinazione relativa alla entry/substanceAdministration dati vaccinazione-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship[@typeCode='RSON'][hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.9']]">
			
			<assert test="count(hl7:observation/hl7:code[@code='75323-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b47| L'elemento observation (malattia per cui si effettua la vaccinazione) DEVE contenere l'elemento code valorizzato con i seguenti attributi @code='75323-6' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b48| L'elemento observation (malattia per cui si effettua la vaccinazione) DEVE contenere l'elemento statusCode valorizzato con l'attributo @code='completed'.</assert>
			<assert test="count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-b49| L'elemento observation (malattia per cui si effettua la vaccinazione) DEVE contenere l'elemento value valorizzato con l'attributo @xsi:type='CD'.</assert>
			
		</rule>
		
		<!--entryRelationship relativa alla malattia con presunta immunità relativa alla entry/substanceAdministration dati esonero/omissione o differimento-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.2']]/hl7:entryRelationship[@typeCode='RSON'][hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.7']]">
			
			<assert test="count(hl7:observation/hl7:code[@code='59784-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-b50| L'elemento observation(malattia con presunta immunità) DEVE contenere l'elemento code valorizzato con i seguenti attributi @code='59784-9' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-b51| L'elemento observation (malattia con presunta immunità) DEVE contenere l'elemento statusCode valorizzato con l'attributo @code='completed'.</assert>
			<assert test="count(hl7:observation/hl7:value)=0 or count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-b52| L'elemento observation/value (malattia con presunta immunità) DEVE essere valorizzato secondo il sistema di codifica ICD9-CM (@codeSystem='2.16.840.1.113883.6.103').</assert>
		
		</rule>
		
		<!--controli template ER @typeCode='RSON'-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship[@typeCode='RSON']">
			
			<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.5'])=1 or
			count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.6'])=1 or
			count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.7'])>=1 or
			count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.9'])>=1 or
			count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.11.4.10'])=1"
			>ERRORE b53| Ciascuno di questi templateId è contenuto in una entryRelationship con l'attributo @typeCode='RSON'.
			- @root='2.16.840.1.113883.2.9.10.1.11.4.5' (Categorie a rischio)
			- @root='2.16.840.1.113883.2.9.10.1.11.4.6' (Condizioni sanitarie)
			- @root='2.16.840.1.113883.2.9.10.1.11.4.7' (Malattia con presunta immunità)
			- @root='2.16.840.1.113883.2.9.10.1.11.4.9' (Malattia per cui si effettua la vaccinazione)
			- @root='2.16.840.1.113883.2.9.10.1.11.4.10' (Ragione dell'esonero)</assert>
		
		</rule>
		
	</pattern>
</schema>