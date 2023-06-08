<?xml version="1.0" encoding="UTF-8"?>
<!-- schematron versione: 20.1 -->
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
			<let name="num_tid" value="count(hl7:templateId)"/>
			<assert test="$num_tid >= 1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.1']) = 1 and  count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.1']/@extension)=1"
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
					($versionNumber= '1' and count(hl7:setId)=0) or 
					($versionNumber= 1 and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
			>ERRORE 8| Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del
			ClinicalDocument.id deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori del setId ed id per un documento clinico coincidono solo per la prima versione di un documento.</assert>
			
			<assert test="(string(number($versionNumber)) ='NaN') or
						  ($versionNumber=1) or 
						  (($versionNumber &gt;1) and count(hl7:relatedDocument)=1)"
			>ERRORE-9| Se l'attributo <name/>/versionNumber/@value maggiore di  1 l'elemento <name/>  deve contenere un elemento di tipo 'relatedDocument'.</assert>
			
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
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.10.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.20.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.30.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.41.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.42.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.50.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.60.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.70.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.80.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.90.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.100.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.110.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.120.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.130.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.140.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.150.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.160.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.170.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.180.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.190.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.200.4.1.1'])=1 or
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
			>ERRORE-11| L'elemento <name/>/recordTarget/patientRole/id  deve avere l'attributo @root valorizzato tramite uno dei seguenti identificatori Nazionanli:
			CF 2.16.840.1.113883.2.9.4.3.2
			TEAM 2.16.840.1.113883.2.9.4.3.7 e 2.16.840.1.113883.2.9.4.3.3
			ENI 2.16.840.1.113883.2.9.4.3.18
			STP 2.16.840.1.113883.2.9.4.3.17 oppure un identificativo regionale 
			ANA 2.16.840.1.113883.2.9.4.3.15
			Oppure tramite gli identificatori regionali generati per rappresentare l'id del paziente.
			</assert>
			
			<assert test="
			(
			  count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.7']) = 0 or
			  count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.3']) = 1 
			) and 
			(
			  count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.3']) = 0 or
			  count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.7']) = 1 
			)"
			
			>ERRORE-11a| Nel caso di Soggetti assicurati da istituzioni estere, devono essere riportati almeno due elementi di tipo 'id' contenenti:
			- 2.16.840.1.113883.2.9.4.3.7: Il numero di identificazione della Tessera TEAM (Tessera Europea di Assicurazione Malattia),
			- 2.16.840.1.113883.2.9.4.3.3Il numero di identificazione Personale TEAM
			- numero di identificazione dell’assistito nel sistema PACS @nullFlavour è ammesso ove l’informazione non sia disponibile).
			</assert>
			
			<assert test="(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=0 and 
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.7'])=0 and 
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.3'])=0 and 
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.18'])=0 and
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.15'])=0) or 
			not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.10.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.20.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.30.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.41.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.42.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.50.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.60.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.70.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.80.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.90.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.100.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.110.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.120.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.130.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.140.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.150.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.160.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.170.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.180.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.190.4.1.1'])=1 or
			count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.2.200.4.1.1'])=1)"
			
			>ERRORE-11b| Nel caso di Stranieri Temporaneamente Presenti, l'elemento <name/>/recordTarget/patientRole/id  deve avere l'attributo @root valorizzato tramite un identificativo STP.</assert>
			
			

			<!--Controllo recordTarget/patientRole/addr-->
			<let name="num_addr" value="count(hl7:recordTarget/hl7:patientRole/hl7:addr)"/>
			<assert test="$num_addr=0 or (count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:country)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:city)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:streetAddressLine)=$num_addr)"
			>ERRORE-12| L'elemento <name/>/recordTarget/patientRole/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<!--Controllo recordTarget/patientRole/patient/name-->
			<let name="patient" value="hl7:recordTarget/hl7:patientRole/hl7:patient"/>
			<assert test="count($patient)=1 "
			>ERRORE-13| L'elemento <name/>/recordTaget/patientRole DEVE contenere l'elemento patient</assert>
			<assert test="count($patient)=0 or count($patient/hl7:name)=1"
			>ERRORE-14| L'elemento <name/>/recordTaget/patientRole/patient DEVE contenere l'elemento 'name'</assert>
			<assert test="count($patient)=0 or (count($patient/hl7:name/hl7:given)=1 and count($patient/hl7:name/hl7:family)=1)"
			>ERRORE-15| L'elemento <name/>/recordTaget/patientRole/patient/name DEVE riportare gli elementi 'given' e 'family'</assert>

			<!--Controllo recordTarget/patientRole/patient/administrativeGenderCode-->
			<let name="genderOID" value="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@codeSystem"/>
			
			<assert test="count($patient)=0 or count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode)=1"
			>ERRORE-16| L'attributo <name/>/recordTarget/patientRole/patient DEVE contenere l'elemento administrativeGenderCode </assert>
			<assert test="count($patient)=0 or $genderOID='2.16.840.1.113883.5.1'"
			>ERRORE-17| L'OID assegnato all'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@codeSystem='<value-of select="$genderOID"/>' non è corretto. L'attributo DEVE essere valorizzato con '2.16.840.1.113883.5.1' </assert>
					
			<!--Controllo recordTarget/patientRole/patient/birthTime-->
			<assert test="count($patient)=0 or count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2' or 
			@root='2.16.840.1.113883.2.9.4.3.7' or @root='2.16.840.1.113883.2.9.4.3.3' or 
			@root='2.16.840.1.113883.2.9.4.3.17'])=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthTime)=1"
			>ERRORE-18| L'elemento <name/>/recordTaget/patientRole/patient DEVE riportare un elemento 'birthTime'.</assert>
			
			<!--Controllo recordTarget/patientRole/patient/birthplace/place/addr-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace)=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace/hl7:place/hl7:addr)=1"
			>ERRORE-19| L'elemento <name/>/recordTarget/patientRole/patient/birthplace DEVE contenere un elemento place/addr </assert>	
			

			<!--Controllo ClinicalDocument/dataEnterer-->	
			<assert test="count(hl7:dataEnterer)=0 or count(hl7:dataEnterer/hl7:time)=1"
			>ERRORE-20| L'elemento <name/>/dataEnterer DEVE contenere un elemento 'time'</assert>
			
			<!-- Controllo dataEnterer/assignedEntity/id -->
			<let name="id_dataEnterer" value="hl7:dataEnterer/hl7:assignedEntity/hl7:id"/>
			<assert test="count(hl7:dataEnterer)=0 or count($id_dataEnterer[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-21| L'elemento ClinicalDocument/dataEnterer DEVE avere almeno un elemento 'id' <value-of select="$id_dataEnterer"/> con l'attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo dataEnterer/assignedEntity/assignedPerson-->
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:dataEnterer)=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1)"
			>ERRORE-22| L'elemento <name/>/dataEnterer/assignedEntity DEVE riportare l'elemento 'assignedPerson/name'.</assert>
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-23| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'.</assert>

			<!-- Controllo ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-24| ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and count($addr_cust/hl7:city)=$num_addr_cust and count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-25| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine'.</assert>


			<!--legalAuthenticator -->
			<assert test = "count(hl7:legalAuthenticator)= 1" 
			>ERRORE-26| L'elemento <name/>/legalAuthenticator è obbligatorio </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])= 1" 
			>ERRORE-27| L'elemento legalAuthenticator/signatureCode deve essere valorizzato con il codice "S"  </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-28| L'elemento legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root '2.16.840.1.113883.2.9.4.3.2'</assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-29| ClinicalDocument/legalAuthenticator/assignedEntity/assignedPerson DEVE contenere l'elemento 'name'. </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or (count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-30| ClinicalDocument/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
						
			
			<!-- controllo su inFulfillmentOf-->
			<assert test ="count(hl7:inFulfillmentOf)>=1" 
			>ERRORE-31| In ClinicalDocuemnt DEVE essere presente almeno un elemento 'inFulfillmentOf'. </assert>
						

			<!--controllo su componentOf-->
			<let name="path_name" value="hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1 "
			>ERRORE-32| Deve essere presente l'elemento ClinicalDocument/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name </assert>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			(count($path_name/hl7:given)=1 and count($path_name/hl7:family)=1)"
			>ERRORE-33| L'elemento ClinicalDocument/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name deve contenere gli elementi given e family </assert>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:id)=1"
			>ERRORE-34| L'elemento ClinicalDocument/componentOf/encompassingEncounter/location/healthcareFacility/serviceProviderOrganization deve contenere l'elemento 'id' </assert>
		
		</rule>
		
		<!-- Controllo author-->
		<rule context="hl7:ClinicalDocument/hl7:author">
			<!-- Controllo author/assignedAuthor/id/@root -->
			<assert test="count(hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-35| L'elemento <name/>/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:assignedAuthor/hl7:assignedPerson"/>
			
			<assert test="count($name_author/hl7:name)=1"
			>ERRORE-36| L'elemento <name/>/assignedAuthor/assignedPerson DEVE avere l'elemento 'name' </assert>
			<assert test="count($name_author/hl7:name)=0 or (count($name_author/hl7:name/hl7:given)=1 and count($name_author/hl7:name/hl7:family)=1)"
			>ERRORE-37| L'elemento <name/>/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>

			<!-- controllo author/assignedAuthor/telecom -->
			<assert test="count(hl7:assignedAuthor/hl7:telecom)>=1"
			>ERRORE-38| L'elemento <name/>/assignedAuthor DEVE deve contenere almeno un elemento 'telecom'</assert>
			
		</rule>
		
		<!-- Controllo participant-->
		<rule context="hl7:ClinicalDocument/hl7:participant">
			<assert test="count(hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:associatedEntity/hl7:associatedPerson/hl7:name)=1)"
			>ERRORE-39| L'elemento <name/>/associatedEntity/associatedPerson deve contenere l'elemento 'name'</assert>
			
			<assert test="count(hl7:associatedEntity/hl7:associatedPerson)=0 or 
			(count(hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:family)=1 and count(hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-40| L'elemento <name/>/associatedEntity/associatedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
			
		</rule>
		<!-- Controllo inFulfillmentOf-->
		<rule context="hl7:ClinicalDocument/hl7:inFulfillmentOf">
			<let name="prioriry" value="hl7:order/hl7:priorityCode/@code"/>
			 <assert test ="count(hl7:order/hl7:priorityCode)=0 or 
			count(hl7:order/hl7:priorityCode[@codeSystem='2.16.840.1.113883.5.7'][@code='R' or @code='P' or @code='UR' or @code='EM'])=1"
            >ERRORE-41| <name/>/order/priorityCode DEVE avere l'attributo '@codeSystem='2.16.840.1.113883.5.7' e @code valorizzato con uno dei seguenti valori: 'R'|'P'|'UR'|'EM' </assert>
		</rule>
		
		<!--controllo su documentationOf-->
		<rule context="hl7:ClinicalDocument/hl7:documentationOf">
			<assert test="count(hl7:serviceEvent/hl7:performer)=0 or count(hl7:serviceEvent/hl7:performer[@typeCode!='PPRF'])=1"
			>ERRORE-41a | L'elemento ClinicalDocument/documentationOf/serviceEvent/performer deve essere valorizzato con uno dei seguenti valori: 'PRF' o 'SPRF'.</assert>
			<assert test = "count (hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			count (hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-42| L'elemento ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson se presente, deve contenere l'elemento name </assert>
			<assert test = "count (hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=0 or 
			(count (hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and 
			count (hl7:serviceEvent/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-43|l'elemento ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson/name deve contenere gli attributi given e family </assert>
			
		</rule>
		
		
	<!--________________________________CONTROLLI GENERICI_____________________________________________________________-->
		
		<!-- Controllo telecom -->
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>ERRORE-44| L’elemento 'telecom' DEVE contenere l'attributo @use.</assert>
		</rule>
		<rule context="//*[contains(local-name(), 'Organization')][hl7:telecom]">
			<assert test="not(hl7:telecom/@use='H' or hl7:telecom/@use='HP' or hl7:telecom/@use='HV')"
			>ERRORE-45| L'elemento telecom di un'organizzazione non può essere di tipo Home, ovvero l'attributo @use deve essere diverso da: H | HP | HV.
			</assert>
		</rule>
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension, '[A-Z0-9]{16}') and string-length($CF)=16"
			>ERRORE-46| codice fiscale '<value-of select="$CF"/>' cittadino ed operatore: 16 cifre [A-Z0-9]{16}</assert>
		</rule>
		
		<!-- Controllo sotto elementi name-->

		<rule context="//hl7:name[contains(local-name(..), 'Organization') or (parent::hl7:location)]">
		  <assert test="count(hl7:delimiter)=0 and count(hl7:prefix)=0 and count(hl7:suffix)=0"
		  >ERRORE-47| L’elemento 'name' di un'organizzazione non deve contenere i sotto elementi 'delimiter', 'prefix', 'suffix'.</assert>
    	</rule>

		<rule context="//hl7:name">
			<assert test="count(hl7:delimiter)=0"
			>ERRORE-48| L’elemento 'name' del soggetto non deve contenere il sotto elemento 'delimiter'.</assert>
		</rule>
		
		<!-- Controllo effectiveTime: -->
		<rule context="//hl7:effectiveTime[hl7:low/@value]">
			<let name="effective_time_low" value="string(hl7:low/@value)"/>
			<let name="effective_time_high" value="string(hl7:high/@value)"/>
			<assert test="count(hl7:high/@value)=0 or ($effective_time_high >= $effective_time_low)"
			>ERROR-49| Il valore dell'elemento effectiveTime/high : '<value-of select="$effective_time_high"/>' 
			deve essere maggione o uguale di quello di effectiveTime/low : '<value-of select="$effective_time_low"/>'.</assert>
		</rule>
		
		<rule context="//*[contains(local-name(), 'Organization')]/hl7:addr[@use='H' or @use='HP' or @use='HV']">
			<assert test="false()"
			>ERRORE-50| L'indirizzo di un'organizzazione non può essere di tipo Home, ovvero l'attributo @use deve essere diverso da: H | HP | HV.
			</assert>
		</rule>
		
		
		<!--Verifica che i codici relativi al CodeSystem "UCUM" utilizzati siano corretti-->
		<!--rule context="//*[@unit]">
			<let name="val_UCUM" value="@unit"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.4.642.3.912.xml')//el[@code=$val_UCUM]"
			>ERRORE-51| Codice UCUM <value-of select="$val_UCUM"/> errato
			</assert>
		</rule-->

	<!-- _____________________________________________ BODY______________________________________________________-->
	
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section">
			
		<!--Controllo Sezione di Specialità-->
			<let name="code_sec" value="hl7:code/@code"/>
			<assert test="count(hl7:code[@code='18717-9'])>= 1 or count(hl7:code[@code='18718-7'])>= 1 or
						count(hl7:code[@code='18719-5'])>= 1 or count(hl7:code[@code='18720-3'])>= 1 or
						count(hl7:code[@code='18721-1'])>= 1 or count(hl7:code[@code='18722-9'])>= 1 or
						count(hl7:code[@code='18723-7'])>= 1 or count(hl7:code[@code='18724-5'])>= 1 or
						count(hl7:code[@code='18725-2'])>= 1 or count(hl7:code[@code='18727-8'])>= 1 or
						count(hl7:code[@code='18728-6'])>= 1 or count(hl7:code[@code='18729-6'])>= 1 or 
						count(hl7:code[@code='18729-4'])>= 1 or count(hl7:code[@code='18767-4'])>= 1 or 
						count(hl7:code[@code='18768-2'])>= 1 or count(hl7:code[@code='18769-0'])>= 1 or 
						count(hl7:code[@code='26435-8'])>= 1 or count(hl7:code[@code='26436-6'])>= 1 or 
						count(hl7:code[@code='26437-4'])>= 1 or count(hl7:code[@code='26438-2'])>= 1 or 
						count(hl7:code[@code='18716-1'])>= 1 or count(hl7:code[@code='26439-0'])>= 1 "
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
			
			
		<!--Controllo Sezione Foglia-->
			
			<!--Sottosezioni alla sezione foglia-->
			<assert test="count(hl7:component/hl7:section/hl7:component/hl7:section)=0" 
			>ERRORE-b4| La sezione foglia non deve includere ulteriori sottosezioni.</assert>
			<!--specimen/id afferente alla section foglia (*)-->
			<!--let name="num_campioni" value="count(hl7:component/hl7:section/hl7:entry/hl7:act/hl7:specimen)"/>
			<assert test="count(hl7:component/hl7:section/hl7:entry/hl7:act/hl7:specimen)&lt;=1 or 
			not(count(hl7:component/hl7:section/hl7:entry/hl7:act/hl7:specimen/hl7:specimenRole/hl7:id)=0)" 
			>ERRORE-b5| Ciascun elemento entry/act/specimen/specimenRole presente nella sezione foglia deve contenere almeno un elemento 'id'.</assert-->
			
			<assert test="count(hl7:component/hl7:section/hl7:entry/hl7:act/hl7:specimen) &lt;= 1 or 
			not(hl7:component/hl7:section/hl7:entry/hl7:act/hl7:specimen/hl7:specimenRole[not(exists(hl7:id))])"
			>ERRORE-b5| Ciascun elemento entry/act/specimen/specimenRole presente nella sezione foglia deve contenere almeno un elemento 'id'.
			</assert>

		</rule>
		
		
	
		<!--Controllo Livello 3: machine-readable body -->
		<rule context="//hl7:entry">
			
			<!--Clinical statement-->
			<assert test="count(hl7:act)=1"
			>ERORE-b6| L'elemento entry deve essere di tipo 'act'</assert>
				
			<!--act/statusCode-->
			<assert test="count(hl7:act/hl7:statusCode[@code='completed' or @code='active' or @code='aborted'])=1"
			>ERORE-b7| L'elemento entry/act DEVE contenere un elemento 'statusCode' che deve essere valorizzato come segue: completed | active | aborted.</assert>
		 
			<!--Gestione data e ora di collezionamento campione-->
			<let name="num_gdo" value="count(hl7:act/hl7:entryRelationship/hl7:act[hl7:code/@code='33882-2'])"/>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:act[hl7:code/@code='33882-2'])=0 or
			count(hl7:act/hl7:entryRelationship/hl7:act[hl7:code/@code='33882-2']/hl7:effectiveTime)=$num_gdo"			
			>ERORE-b8| L'elemento entry/act/entryRelationship/act "Gestione data e ora di collezionamento campione" DEVE contenere un elemento 'effectiveTime'.</assert>
			<!--assert test="count(hl7:act/hl7:entryRelationship/hl7:act[hl7:code/@code='33882-2']/hl7:specimen)=0 or
			not(hl7:act/hl7:entryRelationship/hl7:act[hl7:code/@code='33882-2']/hl7:specimen/hl7:specimenRole[not(exists(hl7:id))])"			
			>ERORE-b8a| L'elemento entry/act/entryRelationship/act/specimen di "Gestione data e ora di collezionamento campione" DEVE contenere almeno un elemento 'id'.</assert-->
			
			<!--Gestione sito di prelievo del campione-->
			<let name="num_gspc" value="count(hl7:act/hl7:entryRelationship[hl7:procedure])"/>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:procedure)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:procedure/hl7:targetSiteCode)=$num_gspc"
			>ERORE-b9| L'elemento entry/act/entryRelationship/procedure "Gestione sito di prelievo del campione" DEVE contenere un elemento 'targetSiteCode'.</assert>
			<!--assert test="count(hl7:act/hl7:entryRelationship/hl7:procedure/hl7:specimen)=0 or 
			not(hl7:act/hl7:entryRelationship/hl7:procedure/hl7:specimen/hl7:specimenRole[not(exists(hl7:id))])"
			>ERORE-b9a| L'elemento entry/act/entryRelationship/procedure/specimen "Gestione sito di prelievo del campione" DEVE contenere almeno un elemento 'id'.</assert-->
			
		</rule>
				
		<!--Controllo specimen -->
		<rule context="//hl7:specimen[not(parent::hl7:act[hl7:code/@code='33882-2']) and not(parent::hl7:procedure)]">
			<assert test="count(hl7:specimenRole/hl7:specimenPlayingEntity)=1" 
			>ERRORE-b10| L'elemento specimen deve contenere l'elemento specimenRole/specimenPlayingEntity </assert>
			<assert test="count(hl7:specimenRole/hl7:specimenPlayingEntity/hl7:code)=1" 
			>ERRORE-b11| L'elemento specimen/specimenRole/specimenPlayingEntity deve contenere l'elemento 'code'</assert>
		</rule>
		
		<!--observationMedia-->
		<rule context="//hl7:observationMedia">
			<assert test="count(hl7:value[@representation='B64'])=1"
			>ERORE-b12| L'elemento observationMedia/value "Gestione oggetti multimediali" DEVE contenere l'attributo @representation valorizzato con 'B64'.</assert>
			
		</rule>
		
		<!--Controllo act - note e commenti -->
		<rule context="//hl7:act[hl7:code[@code='48767-8']]">
			<assert test="count(hl7:text/hl7:reference)=1"
			>ERORE-b13| L'elemento act di "Annotazioni e commenti" DEVE contenere l'elemento text/reference.</assert>
			<assert test="count(hl7:text/hl7:reference)=0 or string(hl7:text/hl7:reference/@value)"
			>ERORE-b14| L'elemento act/text/reference di "Annotazioni e commenti" DEVE avere l'attributo @value valorizzato.</assert>
			
		</rule>
		
		<!--Controllo organizer[CLUSTER] -->
		<rule context="//hl7:organizer[@classCode='CLUSTER']">
			<report test="not(count(hl7:code)=1)"
			>W002 | Si consiglia di valorizzare l'elemento organizer[CLUSTER]/code</report>
			<assert test="count(hl7:statusCode[@code='completed' or @code='active' or @code='aborted'])=1"
			>ERRORE-b15| L’elemento organizer di tipo 'CLUSTER' DEVE contenere un elemento 'statusCode' che deve essere valorizzato come segue: completed | active | aborted.</assert>
			<assert test="count(hl7:specimen)=1"
			>ERRORE-b16| L’elemento organizer di tipo 'CLUSTER' DEVE contenere uno e un solo elemento 'specimen' che  rappresenta il microorganismo isolato.</assert>
			<assert test="count(hl7:specimen/hl7:specimenRole/hl7:specimenPlayingEntity[@classCode='MIC'])=1"
			>ERRORE-b17| L’elemento organizer[CLUSTER]/specimen/specimenRole DEVE contenere un elemento 'specimenPlayingEntity' valorizzato con l'attributo @classCode='MIC'.</assert>
			<assert test="(count(hl7:component/hl7:organizer[@classCode='BATTERY'])>=1 and count(hl7:component/hl7:observation)>=1) or 
			(count(hl7:component/hl7:organizer[@classCode='BATTERY'])>=1 or count(hl7:component/hl7:observation)>=1)"
			>ERRORE-b18| L’elemento organizer di tipo 'CLUSTER' DEVE contenere almeno un elemento component/organizer[BATTERY] oppure almeno un elemento component/observation o entrambi.</assert>
			
		</rule>
		
		<!--Controllo organizer[BATTERY] -->
		<rule context="//hl7:organizer[@classCode='BATTERY']">
			<assert test="count(hl7:code)=1"
			>ERRORE-b19| L’elemento organizer di tipo 'BATTERY' (@classCode='BATTERY') DEVE contenere l’elemento organizer/code.
			</assert>
			<assert test="count(hl7:statusCode[@code='completed' or @code='active' or @code='aborted'])=1"
			>ERRORE-b20| L’elemento organizer di tipo 'BATTERY' DEVE contenere un elemento 'statusCode' che deve essere valorizzato come segue: completed | active | aborted.</assert>
			<assert test="count(hl7:statusCode[@code='aborted'])=0 or count(hl7:component[hl7:observation])>=1"
			>ERRORE-b21| L’elemento organizer di tipo 'BATTERY' DEVE contenere almeno un elemento 'observation'.</assert>
		</rule>
		
		<!--Controllo observation-->
		<rule context="//hl7:observation">
			<!--code LOINC-->
		    <report test ="not(count(hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1) and not(count(hl7:code/hl7:translation[@codeSystem='2.16.840.1.113883.6.1'])=1)"
			>W003 | Si consiglia di utilizzare il sistema di codifica LOINC per la valorizzazione dell'elemento observation/code.--> </report>
			<!--report test="not(count(hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1) and not(count(hl7:code/hl7:translation[@codeSystem='2.16.840.1.113883.6.1'])=1)">
				<text>W003.1 | Si consiglia di utilizzare il sistema di codifica LOINC per la valorizzazione dell'elemento observation/code o observation/code/translation.</text>
				<text>
					
					<if test="hl7:code/hl7:translation/@codeSystem='2.16.840.1.113883.6.1'">
						Si consiglia di utilizzare il sistema di codifica LOINC nel elemento 'code/@codeSystem' invece di 'code/translation/@codeSystem'.
					</if>
				</text>
			</report-->
			<!--statusCode-->
			<assert test="count(hl7:statusCode[@code='completed' or @code='aborted'])=1"
			>ERRORE-b22| L’elemento observation DEVE contenere un elemento 'statusCode' che deve essere valorizzato come segue: completed | aborted.</assert>
						
			<!--effectiveTime-->
			<assert test="count(hl7:effectiveTime)=1"
			>ERRORE-b23| L’elemento observation DEVE contenere un elemento 'effectiveTime' </assert>
			
			<!--value-->
			<assert test="count(hl7:statusCode[@code='aborted'])=1 or count(hl7:value)=1"
			>ERRORE-b24| L’elemento observation DEVE contenere un elemento 'value' che riporta il risultato dell’osservazione.</assert>
			
			<!--interpretationCode-->
			<assert test ="count(hl7:interpretationCode)=0 or count(hl7:interpretationCode[@codeSystem='2.16.840.1.113883.5.83'])=1"
			>ERRORE-b25| L'elemento observation può contenere un tag 'interpretationCode' che deve essere valorizzato secondo il sistema di codifica HL7 ObservationInterpretation (2.16.840.1.113883.5.83)</assert>
			
			<!--methodCode-->
			<assert test ="count(hl7:methodCode)=0 or count(hl7:methodCode[@codeSystem='2.16.840.1.113883.5.84'])=1"
			>ERRORE-b26|  L'elemento observation può contenere un tag 'methodCode' che deve essere valorizzato secondo sistema di codifica HL7 ObservationMethod (2.16.840.1.113883.5.84)</assert>
			
			<!--referenceRange-->
			<let name="num_range" value="count(hl7:referenceRange)"/>
			<assert test="count(hl7:referenceRange/hl7:observationRange)=0 or count(hl7:referenceRange/hl7:observationRange/hl7:interpretationCode[@codeSystem='2.16.840.1.113883.5.83'])=$num_range"
			>ERRORE-b27| Ciascun elemento referenceRange/observationRange DEVE contenere un elemento 'interpretationCode' valorizzato attraverso il vocabolario HL7 ObservationInterpretation il cui OID associato è 2.16.840.1.113883.5.83</assert>
		
		</rule>
		
		
	</pattern>
</schema>
