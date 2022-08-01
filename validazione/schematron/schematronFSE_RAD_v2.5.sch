<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
		xmlns:cda="urn:hl7-org:v3"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:sch="http://www.ascc.net/xml/schematron"
        queryBinding="xslt2">
	<title>Schematron Referto di Radiologia  1.1</title>
	<ns prefix="hl7" uri="urn:hl7-org:v3"/>
	<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<pattern id="all">
	
	<!--________________________________ HEADER _____________________________________________________________-->
	
	<!-- ClinicalDocument -->
		<rule context="hl7:ClinicalDocument">
		
			<!--Controllo realmCode-->	
			<assert test="count(hl7:realmCode) >= 1 and count(hl7:languageCode)=1"
			>ERRORE-1| L'elemento <name/> DEVE avere almeno un elemento 'realmCode' e un solo elemento 'languageCode'.</assert>
			<assert test="count(hl7:realmCode[@code='IT'])= 1">ERRORE-2| L'elemento 'realmCode' DEVE avere l'attributo @root valorizzato come 'IT'</assert>
	        		
			<!--Controllo templateId-->
			<assert test="count(hl7:templateId)>=1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.7.1'])= 1 and  count(hl7:templateId/@extension)= 1"
			>ERRORE-4| Almeno un elemento 'templateId' DEVE essere valorizzato attraverso l'attributo  @root='2.16.840.1.113883.2.9.10.1.7.1' (id del template nazionale)  associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>
			
			<!--Controllo code-->	
			<assert test="count(hl7:code[@code='68604-8'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-5| L'elemento <name/>/code deve essere valorizzato con l'attributo @code='68604-8' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
			
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName='Referto Radiologico'])=1 or
			count(hl7:code[@displayName='REFERTO RADIOLOGICO'])=1 or count(hl7:code[@displayName='Referto radiologico'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Referto Radiologico'.--> </report>
				
			<!--Controllo confidentialityCode-->
			<assert test="(count(hl7:confidentialityCode[@code='N'][@codeSystem='2.16.840.1.113883.5.25'])= 1) or 
			(count(hl7:confidentialityCode[@code='V'][@codeSystem='2.16.840.1.113883.5.25'])= 1)"
			>ERRORE-6| L'elemento  'confidentialityCode' di <name/> DEVE avere l'attributo @code  valorizzato con 'N' o 'V', e il suo @codeSystem  con '2.16.840.1.113883.5.25'</assert>

			<!--Controllo incrociato tra setId-versionNumber e relatedDocument-->
			<let name="versionNumber" value="hl7:versionNumber/@value"/>
			<assert test="(string(number($versionNumber)) = 'NaN') or
					($versionNumber= 1 and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
			>ERRORE-7: Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del
			ClinicalDocument.id deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori del setId ed id per un documento clinico possono coincidere solo per la prima versione di un documento.</assert>
			
			<assert test="(string(number($versionNumber)) ='NaN') or
						  ($versionNumber=1) or 
						  (($versionNumber &gt;1) and count(hl7:relatedDocument)=1)"
			>ERRORE-8| Se l'attributo <name/>/versionNumber/@value maggiore di  1 l'elemento <name/>  deve contenere un elemento di tipo 'relatedDocument'.</assert>

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
			
			<!--Controllo addr-->
			<let name="num_addr" value="count(hl7:recordTarget/hl7:patientRole/hl7:addr)"/>
			<assert test="$num_addr=0 or (count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:country)>=$num_addr and count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:city)=$num_addr and count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:streetAddressLine)=$num_addr)"
			>ERRORE-9: L'elemento <name/>/recordTarget/patientRole/addr DEVE riportare i suoi sotto-elementi 'country', 'city' e 'streetAddressLine'.   </assert>
			
			<!--Controllo recordTarget/patientRole/patient/name-->
			<let name="patient" value="hl7:recordTarget/hl7:patientRole/hl7:patient"/>
			<assert test="count($patient)=0 or count($patient/hl7:name)=1"
			>ERRORE-10| L'elemento <name/>/recordTaget/patientRole/patient DEVE contenere l'elemento 'name'</assert>
			<assert test="count($patient)=0 or (count($patient/hl7:name/hl7:given)=1 and count($patient/hl7:name/hl7:family)=1)"
			>ERRORE-11| L'elemento ClinicalDocument/recordTaget/patientRole/patient/name DEVE riportare gli elementi 'given' e 'family'</assert>

			<!--Controllo recordTarget/patientRole/patient/administrativeGenderCode-->
			<let name="genderCode" value="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@code"/>
			<let name="genderOID" value="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@codeSystem"/>
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient)=0 or ($genderCode='M' or $genderCode='F' or $genderCode='UN')"
			>ERRORE-12| L'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@code='<value-of select="$genderCode"/>' non è valorizzato correttamente. Deve assumere uno dei seguenti valori:'M', 'F', 'UN', e l'attributo @codeSystem con '2.16.840.1.113883.5.1' </assert>
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient)=0 or $genderOID='2.16.840.1.113883.5.1'"
			>ERRORE-13| L'OID assegnato all'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@codeSystem='<value-of select="$genderOID"/>' non è corretto. L'attributo DEVE essere valorizzato con '2.16.840.1.113883.5.1' </assert>
            
			<!--Controllo recordTarget/patientRole/patient/birthTime-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient)=0 or count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthTime)=1"
			>ERRORE-14| L'elemento ClinicalDocument/recordTaget/patientRole/patient DEVE riportare un elemento 'birthTime'.</assert>

			<!--Controllo author/assignedAuthor/id/@root-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-15| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo author/assignedAuthor/addr-->
			<let name="num_addr_author" value="count(hl7:author/hl7:assignedAuthor/hl7:addr)"/>
			<assert test="$num_addr_author=0 or (count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:country)=$num_addr_author and count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:city)=$num_addr_author and count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:streetAddressLine)=$num_addr_author)"
			>ERRORE-16: L'elemento <name/>/author/assignedAuthor/addr DEVE riportare i suoi sotto-elementi 'country', 'city' e 'streetAddressLine'. </assert>

			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:author/hl7:assignedAuthor/hl7:assignedPerson"/>
			<assert test="count($name_author)=0 or count($name_author/hl7:name)=1"
			>ERRORE-17| L'elemento ClinicalDocument/author/assignedAuthor/assignedPerson DEVE avere l'elemento 'name' </assert>
			<assert test="count($name_author)=0 or (count($name_author/hl7:name/hl7:given)=1 and count($name_author/hl7:name/hl7:family)=1)"
			>ERRORE-18| L'elemento ClinicalDocument/author/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
			
			<!--Controllo author/assignedAuthor/telecom-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:telecom)>=1"
			>ERRORE-19| In ClinicalDocument/author/assignedAuthor DEVE essere presente almeno un elemento 'telecom' </assert>
			
			<!--Controllo dataEnterer/time-->	
			<assert test="count(hl7:dataEnterer)=0 or count(hl7:dataEnterer/hl7:time)"
			>ERRORE-20| L'elemento <name/>/dataEnterer DEVE avere un elemento 'time'</assert>
			
			<!--Controllo dataEnterer/assignedEntity/id-->
			<let name="id_dataEnterer" value="hl7:dataEnterer/hl7:assignedEntity/hl7:id"/>
			<assert test="count(hl7:dataEnterer)=0 or count($id_dataEnterer[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-21| L'elemento ClinicalDocument/dataEnterer/assignedEntity DEVE avere almeno un elemento 'id' <value-of select="$id_dataEnterer"/> con l'attributo @root valorizzato con '2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo dataEnterer/assignedEntity/assignedPerson-->
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:dataEnterer)=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson)=1 and 
			count(hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1)"
			>ERRORE-22| L'elemento <name/>/dataEnterer/assignedEntity DEVE riportare l'elemento 'assignedPerson/name'.</assert>
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-23| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'.</assert>

			<!--Controllo ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-24| ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and count($addr_cust/hl7:city)=$num_addr_cust and count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-25: L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine'.</assert>
			
			<!--Controllo legalAuthenticator-->
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])= 1" 
			>ERRORE-26| L'elemento legalAuthenticator/signatureCode deve essere valorizzato con il codice "S"  </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])= 1"
			>ERRORE-27| L'elemento legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root '2.16.840.1.113883.2.9.4.3.2'</assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1"
			>ERRORE-28| ClinicalDocument/legalAuthenticator/assignedEntity/assignedPerson DEVE contenere l'elemento 'name'. </assert>
			<assert test = "count(hl7:legalAuthenticator)= 0 or (count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-29| ClinicalDocument/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>

			<!--Controllo inFulfillmentOf-->
			<let name="prioriry" value="hl7:inFulfillmentOf/hl7:order/hl7:priorityCode/@code"/>
			<assert test ="count(hl7:inFulfillmentOf)>=1" 
			>ERRORE-30| In ClinicalDocuemnt DEVE essere presente almeno un elemento 'inFulfillmentOf'. </assert>
			<assert test ="count(hl7:inFulfillmentOf/hl7:order/hl7:priorityCode)=0 or ($prioriry='R' or $prioriry='P' or $prioriry='UR' or $prioriry='EM')"
			>ERRORE-31| ClinicalDocument/infulfillmentOf/order/priorityCode DEVE avere l'attributo code valorizzato con uno dei seguenti valori: 'R'|'P'|'UR'|'EM' </assert>

            <!--Controllo documentationOf-->
			<assert test = "count (hl7:documentationOf/hl7:serviceEvent)=0 or 
			                count (hl7:documentationOf/hl7:serviceEvent/hl7:code[@code='PROG'])=1 or
                            count (hl7:documentationOf/hl7:serviceEvent/hl7:code[@code='DIR'])=1 or 
							count (hl7:documentationOf/hl7:serviceEvent/hl7:code[@code='RAD_PROG'])=1 or 
							count (hl7:documentationOf/hl7:serviceEvent/hl7:code[@code='RAD_DIR'])=1"
			>ERRORE-32| L'elemento ClinicalDocument/documentationOf/serviceEvent deve contenere l'elemento code e DEVE valorizzare il suo attributo code con uno dei seguenti valori: 'PROG'|'DIR'|'RAD_PROG|'RAD_DIR' </assert>			
			<assert test = "count(hl7:documentationOf/hl7:serviceEvent)= 0 or count(hl7:documentationOf/hl7:serviceEvent/hl7:code[@codeSystem='2.16.840.1.113883.2.9.5.1.4'])= 1"
			>ERRORE-33| L'elemento ClinicalDocument/documentationOf/serviceEvent DEVE contenere l'elemento code valorizzato con l'attributo @codeSystem '2.16.840.1.113883.2.9.5.1.4'</assert>

			<!--Controllo componentOf-->
			<let name="path_name" value="hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<let name="code_encomp" value="hl7:componentOf/hl7:encompassingEncounter/hl7:code/@code"/>
			<!--WARNING-->
			<!--report test="not(count(hl7:componentOf/hl7:encompassingEncounter/hl7:code)=0) and (not($code_encomp=IMP) or not($code_encomp=AMB) or not($code_encomp=EMER))"
			>W003| L'attributo code dell'elemento componentOf/encompassingEncounter/code PUO' assumere uno dei seguenti valori :IMP|AMB|EMER ></report-->
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or count (hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name)=1 "
			>ERRORE-34| deve essere presente l'elemento ClinicalDocument/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name </assert>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or (count($path_name/hl7:given)=1 and count($path_name/hl7:family)=1)"
			>ERRORE-35| L'elemento ClinicalDocument/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name deve contenere gli elementi given e family </assert>
			<assert test = "count(hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization)=0 or count (hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:id)=1"
			>ERRORE-36| L'elemento ClinicalDocument/componentOf/encompassingEncounter/location/healthcareFacility/serviceProviderOrganization deve contenere l'elemento 'id' </assert>
		
		</rule>
			
		
	<!--________________________________ CONTROLLI SUI DIZIONARI _____________________________________________________________-->
	
		<!--Verifica che i codici LOINC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.6.1']">
			<let name="val_LOINC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.6.1.xml')//el[@code=$val_LOINC] or 
			$val_LOINC='LA16666-2' or $val_LOINC='LA18632-2' or $val_LOINC='LA28752-6' or $val_LOINC='LA18821-1'"
			>Errore 1_DIZ| Codice LOINC '<value-of select="$val_LOINC"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici AIC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.6.1.5']">
			<let name="val_AIC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.6.1.5.xml')//el[@code=$val_AIC]"
			>Errore 2_DIZ| Codice  AIC  '<value-of select="$val_AIC"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici ATC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.6.73']">
			<let name="val_ATC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.6.73.xml')//el[@code=$val_ATC]"
			>Errore 3_DIZ| Codice  ATC  '<value-of select="$val_ATC"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici derivati da "Absent or Unknown Allergies" siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.11.22.9']">
			<let name="val_UKA" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.11.22.9.xml')//el[@code=$val_UKA]"
			>Errore 4_DIZ| Codice Absent or Unknown Allergies '<value-of select="$val_UKA"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di ObservationIntoleranceType utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.1.11.19700']">
			<let name="val_OIT" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.1.11.19700.xml')//el[@code=$val_OIT]"
			>Errore 5_DIZ| Codice ObservationIntoleranceType  '<value-of select="$val_OIT"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di ObservationIntoleranceType utilizzati siano corretti-->
		<!--rule context="//*[@codeSystem='2.16.840.1.113883.5.4']">
			<let name="val_OIT" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.4.xml')//el[@code=$val_OIT]"
			>Errore 6_DIZ| Codice ObservationIntoleranceType  '<value-of select="$val_OIT"/>' errato!
			</assert>
		</rule-->
		
		<!--Verifica che i codici di Allergeni (No Farmaci) utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2']">
			<let name="val_ANF" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.2.xml')//el[@code=$val_ANF]"
			>Errore 7_DIZ| Codice Allergeni (No Farmaci)  '<value-of select="$val_ANF"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di Reazioni Intolleranza utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3']">
			<let name="val_REAZINT" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.3.xml')//el[@code=$val_REAZINT]"
			>Errore 8_DIZ| Codice  Reazioni Intolleranza  '<value-of select="$val_REAZINT"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di Reazioni Allergiche utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.4']">
			<let name="val_REAZALL" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.4.xml')//el[@code=$val_REAZALL]"
			>Errore 9_DIZ| Codice  Reazioni Allergiche  '<value-of select="$val_REAZALL"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di SeverityObservation utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.5']">
			<let name="val_SEVOBS" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.5.xml')//el[@code=$val_SEVOBS]"
			>Errore 10_DIZ| Codice  SeverityObservation  '<value-of select="$val_SEVOBS"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di CriticalityObservation utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.6']">
			<let name="val_CRIOBS" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.6.xml')//el[@code=$val_CRIOBS]"
			>Errore 11_DIZ| Codice  CriticalityObservation  '<value-of select="$val_CRIOBS"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di StatoClinicoAllergia utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.11']">
			<let name="val_STATCLINALL" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.11.xml')//el[@code=$val_STATCLINALL]"
			>Errore 12_DIZ| Codice  StatoClinicoAllergia  '<value-of select="$val_STATCLINALL"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica correttezza codici EtaInsorgenza_PSSIT-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.8']">
			<let name="val_age" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.8.xml')//el[@code=$val_age]"
			>Errore 13_DIZ| Codice EtaInsorgenza_PSSIT '<value-of select="$val_age"/>' errato!
			</assert>
		</rule>

		<!--Verifica correttezza codici ProblemObservation_PSSIT-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.9']">
			<let name="val_problem_obs" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.9.xml')//el[@code=$val_problem_obs]"
			>Errore 14_DIZ| Codice ProblemObservation_PSSIT '<value-of select="$val_problem_obs"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di "RoleCode"  siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.111']">
			<let name="val_parentela" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.111.xml')//el[@code=$val_parentela]"
			>Errore 15_DIZ| Codice RoleCode '<value-of select="$val_parentela"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici di "AdministrativeGender"  siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.1']">
			<let name="val_Gender1" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.1.xml')//el[@code=$val_Gender1]"
			>Errore 16_DIZ| Codice AdministrativeGender '<value-of select="$val_Gender1"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici derivati da "AdministrativeGender"  siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.1.11.1']">
			<let name="val_Gender2" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.1.11.1.xml')//el[@code=$val_Gender2]"
			>Errore 17_DIZ| Codice AdministrativeGender '<value-of select="$val_Gender2"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici derivati da "CronicitàProblema" siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10']">
			<let name="val_CronProbl" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.10.xml')//el[@code=$val_CronProbl]"
			>Errore 18_DIZ| Codice CronicitàProblema '<value-of select="$val_CronProbl"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici derivati da "StatoClinicaoProblema" siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.7']">
			<let name="val_StatoProbl" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.7.xml')//el[@code=$val_StatoProbl]"
			>Errore 19_DIZ| Codice StatoClinicoProblema '<value-of select="$val_StatoProbl"/>' errato!
			</assert>
		</rule>
	<!--Verifica che i codici ICD-9-CM utilizzati siano corretti-->
		<!--rule context="//*[@codeSystem='2.16.840.1.113883.6.103']">
			<let name="val_ICD9CM" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.6.103.xml')//el[@code=$val_ICD9CM]"
			>Errore 20_DIZ| Codice ICD-9-CM '<value-of select="$val_ICD9CM"/>' errato!
			</assert>
		</rule-->
		
	
	<!--________________________________ CONTROLLI GENERICI _____________________________________________________________-->
	
		<!--Controllo use Telecom-->
	    <rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>Errore-37| L’elemento 'telecom' DEVE contenere l'attributo @use.
			</assert>
		</rule>	
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension, '[A-Z0-9]{16}')"
			>Errore-38| codice fiscale '<value-of select="$CF"/>' cittadino ed operatore: 16 cifre [A-Z0-9]{16}</assert>
		</rule>
		
		 <!--Controllo sugli attributi di observation-->
		<rule context="//hl7:observation">
			<let name="moodCd" value="@moodCode"/>
			<assert test="count(@classCode)=1"
			>Errore-39| L'attributo "@classCode" dell'elemento "observation" deve essere presente </assert>
			<assert test="$moodCd='EVN'"
			>Errore-40| L'attributo "@moodCode" dell'elemento "observation" deve essere valorizzato con "EVN" </assert>
        </rule>
		
		<!--Controllo sugli attributi di act-->
		<rule context="//hl7:act">
			<let name="mood_act" value="@moodCode"/>
			<let name="class_act" value="@classCode"/>
			<assert test="$mood_act='EVN'"
			>Errore-41| L'attributo "@moodCode" dell'elemento "Act" deve essere valorizzato con "EVN" </assert>
			<assert test="$class_act='ACT'"
			>Errore-42| L'attributo "@classCode" dell'elemento "Act" deve essere valorizzato con "ACT" </assert>
		</rule>
		
		
		
	<!--________________________________ BODY _____________________________________________________________-->	
	
	    <!--Controllo sulle Section obbligatorie-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody">
		
			<!--Esame eseguito-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='55111-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-43| Sezione Esame Eseguito: la sezione DEVE essere presente.</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='55111-9']]/hl7:text)=1"
			>ERRORE-44| Sezione Esame Eseguito: La sezione deve contenere l'elemento 'text'.</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='55111-9']]/hl7:entry)>=1"
			>ERRORE-45| Sezione Esame Eseguito: La sezione deve contenere un elemento 'entry'.</assert>
						
			<!--Referto-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='18782-3'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-46| Sezione Referto: DEVE essere presente la sezione "Referto".</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='18782-3']]/hl7:text)=1"
			>ERRORE-47| Sezione Referto: La sezione deve contenere l'elemento 'text'.</assert>
		</rule>	
		
		<!--Controllo sui codici delle Section-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section">
			<let name="codice" value="hl7:code/@code"/>
			<assert test="count(hl7:code[@code='121181'])=1 or count(hl7:code[@code='18785-6'])=1 or count(hl7:code[@code='11329-0'])=1 
			or count(hl7:code[@code='55114-3'])=1 or count(hl7:code[@code='55111-9'])=1 or count(hl7:code[@code='18782-3'])=1 
			or count(hl7:code[@code='55110-1'])=1 or count(hl7:code[@code='55107-7'])=1 or count(hl7:code[@code='55109-3'])=1 or count(hl7:code[@code='18783-1'])=1"
			>ERRORE-48| Il codice '<value-of select="$codice"/>' non è corretto. La sezione deve essere valorizzata con uno dei seguenti codici:
			121181   Sezione DICOM Object Catalog
			18785-6  Sezione Quesito Diagnostico
			11329-0	 Sezione Storia Clinica
			55114-3	 Sezione Precedenti Esami Eseguiti
			55111-9	 Sezione Esame Eseguito
			18782-3	 Sezione Referto
			55110-1	 Sezione Conclusioni
			55107-7	 Sezione Informazioni Aggiuntive
			55109-3	 Sezione Complicanze
			18783-1  Sezione Suggerimenti per il medico prescrittore
			</assert>
		</rule>
		
		<!--Controllo sulle Section opzionali-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component">
			<!--DICOM Object Catalog-->
			<assert test="count(hl7:section[hl7:code[@code='121181']])=0 or
			count(hl7:section[hl7:code[@code='121181']]/hl7:entry/hl7:act)=1"
			>ERRORE-49| Sezione Dicom Object Catalog: La sezione deve avere l'elemento 'entry' di tipo 'act'.</assert>
			
			<!--Quesito Diagnostico-->
			<assert test="count(hl7:section[hl7:code[@code='18785-6']])=0 or count(hl7:section[hl7:code[@code='18785-6']]/hl7:text)=1"
			>ERRORE-50| Sezione Quesito Diagnostico: La sezione deve contenere l'elemento 'text'.</assert>
			<assert test="count(hl7:section[hl7:code[@code='18785-6']]/hl7:entry)=0 or count(hl7:section[hl7:code[@code='18785-6']]/hl7:entry/hl7:observation)=1"
			>ERRORE-51| Sezione Quesito Diagnostico: La 'entry' della sezione deve contenere l'elemento 'observation'.</assert>
			<assert test="count(hl7:section[hl7:code[@code='18785-6']]/hl7:entry)=0 or 
			count(hl7:section[hl7:code[@code='18785-6']]/hl7:entry/hl7:observation/hl7:code[@code='29308-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-52| Sezione Quesito Diagnostico: L'elemento entry/observation/code deve avere l'attributo @code='29308-4' secondo il @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:section[hl7:code[@code='18785-6']]/hl7:entry)=0 or 
			count(hl7:section[hl7:code[@code='18785-6']]/hl7:entry/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-53| Sezione Quesito Diagnostico: L'elemento entry/observation/value deve essere presente e deve essere valorizzato secondo il sistema di codifica  ICD-9-CM (@codeSystem='2.16.840.1.113883.6.103')</assert>
			
			<!--Storia Clinica-->
			<assert test="count(hl7:section[hl7:code[@code='11329-0']])=0 or count(hl7:section[hl7:code[@code='11329-0']]/hl7:text)=1"
			>ERRORE-54| Sezione Storia Clinica: La sezione deve contenere l'elemento 'text'.</assert>
			
			<!--Precedenti Esami eseguiti-->
			<assert test="count(hl7:section[hl7:code[@code='55114-3']])=0 or count(hl7:section[hl7:code[@code='55114-3']]/hl7:text)=1"
			>ERRORE-55| Sezione Precedenti Esami Eseguiti: La section deve contenere l'elemento 'text'.</assert>			
			
			<!--Conclusioni-->
			<assert test="count(hl7:section[hl7:code[@code='55110-1']])=0 or count(hl7:section[hl7:code[@code='55110-1']]/hl7:text)=1"
			>ERRORE-56| Sezione Conclusiooni: La section deve contenere l'elemento "text"</assert>


			<!--Informazioni aggiuntive-->
			<assert test="count(hl7:section[hl7:code[@code='55107-7']])=0 or count(hl7:section[hl7:code[@code='55107-7']]/hl7:text)=1"
			>ERRORE 57| Sezione Informazioni Aggiuntive: La section deve contenere l'elemento "text"</assert>
			
			
			<!--Complicanze-->
			<assert test="count(hl7:section[hl7:code[@code='55109-3']])=0 or count(hl7:section[hl7:code[@code='55109-3']]/hl7:text)=1"
			>ERRORE-58| Sezione Complicanze: La section deve contenere l'elemento "text".</assert>
			<assert test="count(hl7:section[hl7:code[@code='55109-3']]/hl7:entry)=0 or count(hl7:section[hl7:code[@code='55109-3']]/hl7:entry/hl7:observation)=1"
			>ERRORE-59|Sezione Complicanze: La section/entry deve contenere l'elemento "observation"</assert>

			<!--Suggerimenti per il medico prescrittore-->
			<assert test="count(hl7:section[hl7:code[@code='18783-1']])=0 or count(hl7:section[hl7:code[@code='18783-1']]/hl7:text)=1"
			>ERRORE-60| Sezione Suggerimenti per il medico prescrittore: La section deve contenere l'elemento 'text'.</assert>
		</rule>
		
			<!--Storia Clinica: controllo delle entry-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry">
				<!--controllo sui sotto elementi di etry-->
				<assert test="count(hl7:observation)=1 or count(hl7:organizer)=1"
				>ERRORE-61| Sezione Storia Clinica: L'elemento 'entry' deve avere uno dei seguenti sotto elementi:
				- 'observation': per l'Anamnesi patologica e fisiologica;
				- 'organizer': per l'Anamnesi familiare.</assert>
				
				<!--Storia Clinica: Dettaglio Anamnesi Patologica e Fisiologica (observation)-->
				<assert test="count(hl7:observation)=0 or 
				count(hl7:observation/hl7:code[@code='75326-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-62| Sezione Storia Clinica: L'elemento entry/observation/code deve avere gli attributi @code='75326-9' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
				<assert test="count(hl7:observation)=0 or 
				count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-63| Sezione Storia Clinica: L'elemento entry/observation/statusCode deve avere l'attributo @code='completed'.</assert>
				<assert test="count(hl7:observation)=0 or
				count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-64| Sezione Storia Clinica: L'elemento entry/observation/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato.</assert>
				<assert test="count(hl7:observation)=0 or
				count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-65| Sezione Storia Clinica: L'elemento entry/observation/value deve avere l'attributo @xsi:type="CD".</assert>
				<assert test="count(hl7:observation)=0 or 
				(count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1) or
				count(hl7:observation/hl7:value/@code)=1"
				>ERRORE-66| Sezione Storia Clinica: Nel caso di 'value' non codificato (in entry/observation), deve essere valorizzato l'elemento 'originalText/reference'.</assert>
				
				<!--Storia Clinica: Dettaglio Anamnesi Familiare (organizer)-->
				<assert test="count(hl7:organizer)=0 or count(hl7:organizer[@classCode='CLUSTER'])=1"
				>ERRORE-67| Sezione Storia Clinica: L'elemento entry/organizer deve avere l'attributo @classCode valorizzato come "CLUSTER".</assert>
				<assert test="count(hl7:organizer)=0 or 
				count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:code)=1"
				>ERRORE-68| Sezione Storia Clinica: La entry/organizer deve avere un elemento subjectect/relatedSubject il quale deve contenere l'elemento 'code'. </assert>
		<!---->	<assert test="count(hl7:organizer)=0 or 
				count(hl7:organizer/hl7:component/hl7:observation)>=1"
				>ERRORE-69| Sezione Storia Clinica: L'elemento entry/organizer deve contenere almeno un elemento 'component' di tipo 'observation'.</assert>				
			</rule>
		
			<!--Storia Clinica: Cronicità e Stato Clinico della patologia (entry/observation/entryRelationship/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:observation/hl7:entryRelationship">
				<assert test="(count(hl7:observation/hl7:code[@code='89261-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
				count(hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1)"
				>ERRORE-70| Sezione Storia Clinica: L'elemento entry/observation/entryRelationship/observation/code deve avere l'attributo @code valorizzato con:
				"89261-2" per "Dettaglio Cronicità patologia"
				"33999-4" per "Dettaglio Stato patologia"
				</assert>
				<assert test="count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value)=0 or 
				(count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
				count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10'])=1)"
				>ERRORE-71| Sezione Storia Clinica: L'elemento 'value' relativo alla Cronicità deve essere valorizzato secondo il Value set "CronicitàProblema".</assert>
				<assert test="count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value)=0 or 
				(count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
				count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.7'])=1)"
				>ERRORE-72| Sezione Storia Clinica: L'elemento 'value' relativo allo Stato Clinico della patoligia deve essere valorizzato secondo il Value set "StatoClinicoProblema".</assert>
			</rule>
			
			<!--Storia Clinica: Dettaglio Anamnesi del familiare in oggetto (entry/organizer/component/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:organizer/hl7:component">
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-73| Sezione Storia Clinica: L'elemento entry/organizer/component/observation/statusCode deve contenere l'attributo @code valorizzato con 'completed'.</assert>
				<assert test="count(hl7:observation/hl7:effectiveTime)=1"
				>ERRORE-74| Sezione Storia Clinica: L'elemento entry/organizer/component/observation deve contenere l'elemento 'effectiveTime'.</assert>
				<assert test="count(hl7:observation/hl7:value)=1"
				>ERRORE-75| Sezione Storia Clinica: L'elemento entry/organizer/component/observation deve contenere l'elemento 'value'.</assert>
				<assert test="(count(hl7:observation/hl7:entryRelationship)>=1 and count(hl7:observation/hl7:entryRelationship)&lt;=2) and
				(count(hl7:observation/hl7:entryRelationship/hl7:observation)>=1 and count(hl7:observation/hl7:entryRelationship/hl7:observation)&lt;=2)"
				>ERRORE-76| Sezione Storia Clinica: L'elemento entry/organizer/component/observation deve avere al più 2 elementi 'entryRelationship' di tipo observation:
				- Età di insorgenza (OBBLIGATORIO)
				- Età di decesso (OPZIONALE)</assert>
			</rule>
			
			<!--Storia Clinica: Età di insorgenza e/o età di decesso (entry/organizer/component/observation/entryRelationship/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:organizer/hl7:component/hl7:observation/hl7:entryRelationship">
				<assert test="(count(hl7:observation/hl7:code[@code='35267-4'])=1 or count(hl7:observation/hl7:code[@code='39016-1'])=1)"
				>ERRORE-77| Sezione Storia Clinica: La 'entryRelationship' deve avere l'elemento observation/code valorizzato con uno dei seguenti valori:
				"35267-4" per "Età di insorgenza" 
				"39016-1" per "Età di decesso".</assert>
				<assert test="count(hl7:observation/hl7:value)=1"
				>ERRORE-78| Sezione Storia Clinica: La entryRelationship/observation relativa all'Età di insorgenza o Età di decesso deve avere l'elemento 'value' valorizzato.</assert>
			</rule>
		
		<!--Sezione Allergie-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component">
			<assert test="count(hl7:section/hl7:code[@code='48765-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-79| Sotto sezione Allergie: Il code della section deve essere valorizzato con il @code='48765-2' e il @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:section/hl7:text)=1"
			>ERRORE-80| Sotto sezione Allergie: La section deve avere un elemento 'text'.</assert>
			
			<!--Criticità dell'allergia o dell'intolleranza-->
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or 
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation)=1"
			>ERRORE-81| Sotto sezione Allergie: L'entryRelationship/observation relativa alla "Criticità dell'allergia"  può essere presente solo una volta.</assert>			
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1"
			>ERRORE-82| Sotto sezione Allergie: L'entryRelationship/observation (Criticità dell'allergia) deve avere l'attributo @codesystem='2.16.840.1.113883.5.4'.</assert>
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation)=0 or 
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.1063'])=1"
			>ERRORE-83| Sotto sezione Allergie: L'entryRelationship/observation/value (Criticità dell'allergia) deve essere valorizzato secondo il value set "CriticalityObservation" @codesystem='2.16.840.1.113883.5.1063'.</assert>
				
			<!--Stato dell'allergia o dell'intolleranza-->
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or 
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR']/hl7:observation)=1"
			>ERRORE-84| Sotto sezione Allergie: L'entryRelationship/observation relativa allo "Stato"  può essere presente solo una volta.</assert>
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or 
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR']/hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-85| Sotto sezione Allergie: L'elemento 'code' all'interno di entryRelationship/observation (Stato dell'allergia) deve avere l'attributo @code='33999-4' e il @codesystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or 
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR']/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-86| Sotto sezione Allergie: L'elemento 'value' all'interno di entryRelationship/observation (Stato dell'allergia) deve essere valorizzato secondo il value set "StatoClinicoAllergia" @codesystem='2.16.840.1.113883.6.1'.</assert>
			
			<!--Commenti-->
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])=0 or 
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:act)=1"
			>ERRORE-87| Sotto sezione Allergie: L'entryRelationship/act relativo ai "Commenti" può essere presente una sola volta.</assert>
			<assert test="count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:act)=0 or 
			count(hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ']/hl7:act/hl7:code[@code='48767-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-88| Sotto sezione Allergie: L'elemento 'code' all'interno di entryRelationship/act (Commenti) deve avere l'attributo @code='48767-8' e il @codeSystem='2.16.840.1.113883.6.1'.</assert>
		</rule>
		
		<!--Sottosezione Allergie: blocco strutturato (entry/act)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry">
			<assert test="count(hl7:act)=1"
			>ERRORE-89| Sotto sezione Allergie: La 'entry' della section deve essere di tipo 'act'.</assert>
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="$status='active' or $status='completed' or $status='aborted' or $status='suspended'"
			>ERRORE-90| Sotto sezione Allergie: L'elemento 'statusCode' deve essere valorizzato secondo il value set ActStatus: 'active'|'completed'|'aborted'|'suspended'.</assert>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-91| Sotto sezione Allergie: L'elemento 'effectiveTime' deve essere presente e deve avere l'elemento 'low' valorizzato.</assert>
			<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
					($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
					($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
					($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-92| Sotto sezione Allergie: L'elemento 'effectiveTime/high' deve essere presente nel caso in cui lo 'statusCode' è 'completed'|'aborted'.</assert>
			
			<!--Dettaglio Allergie (entryRelationship/observation)-->
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:code[@code='52473-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-93| Sotto sezione Allergie: L'entry/act deve includere uno ed un solo elemento entryRelationship/observation con il 'code' uguale a '52473-6'.</assert>	
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-94| Sotto sezione Allergie: L'elemento entry/act/entryRelationship/observation/statusCode/@code deve assumere il valore costante 'completed'.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-95| Sotto sezione Allergie: I'elemento entry/act/entryRelationship/observation/effectiveTime deve avere valorizzato l'elemento 'low'.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-96| Sotto sezione Allergie: L'elemento entry/act/entryRelationship/observation/value deve avere l'attributo @xsi:type valorizzato come 'CD'.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value)=0 or 
			(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.4'])=1)"
			>ERRORE-97| Sotto sezione Allergie: L'elemento entry/act/entryRelationship/observation/value codificato, deve avere l'attributo @code valorizzato secondo il value set "ObservationIntoleranceType" (@codeSystem='2.16.840.1.113883.5.4').</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value)=0 or 
			(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=1 or 
			count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1)"
			>ERRORE-98| Sotto sezione Allergie: L'elemento entry/act/entryRelationship/observation/value non codificato, deve avere l'elemento originalText/reference valorizzato.</assert>
		</rule>
		
		<!--Descrizione Agente-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship">
			<assert test="count(hl7:observation/hl7:participant)=1"
			>ERRORE-99| Sotto sezione Allergie: L'elemento entryRelationship/observation (Descrizione Agente) deve avere almeno un elemento 'participant' che dettaglia l'agente scatenante.</assert>
			<assert test="count(hl7:observation/hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
			count(hl7:observation/hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count(hl7:observation/hl7:participant/hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2'])=1"
			>ERRORE-100| Sotto sezione Allergie: L'elemento participant/participantRole/playingEntity deve avere l'attributo code/@codeSystem valorizzato come segue:
			- '2.16.840.1.113883.6.73' codifica "WHO ATC"
			- '2.16.840.1.113883.2.9.6.1.5' codifica "AIC"
			- '2.16.840.1.113883.2.9.77.22.11.2' value set "AllergenNoDrugs" (- per le allergie non a farmaci –)
			</assert>
		</rule>
		
		<!--Descrizione Reazione-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='MFST']">	
			<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-101| Sotto sezione Allergie: L'entryRelationship/observation (Descrizione Reazioni) deve avere un elemento 'code' con gli attributi @code='75321-0' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-102| Sotto sezione Allergie: L'entryRelationship/observation (Descrizione Reazioni) deve avere un 'effectiveTime'  con un elemento 'low' valorizzato.</assert>
			<assert test="count(hl7:observation/hl7:value)=0 or	count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-103| Sotto sezione Allergie: L'elemento 'value' di entryRelationship/observation (Descrizione Reazioni) deve avere l'attributo @xsi:type='CD'.</assert>
			<assert test="count(hl7:observation/hl7:value)=0 or
			(count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1) or
			(count(hl7:observation/hl7:value/@code)=1 and (count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)&lt;=1))"
			>ERRORE-104| Sotto sezione Allergie: Nel caso di 'value' non codificato (in Descrizione Reazioni), questo deve avere l'elemento originalText/reference valorizzato.</assert>	
			<assert test="count(hl7:observation/hl7:value)=0 or count(hl7:observation/hl7:value/@code)=0 or
			(count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.4'])=1 or 
			count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3'])=1 or 
			count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1)"
			>ERRORE-105| Sotto sezione Allergie: L'entryRelationship/observation/value (in Descrizione Reazioni) deve avere l'attributo @codeSystem valorizzato come segue:
			- "2.16.840.1.113883.2.9.77.22.11.4" per le reazioni da allergia 
			- "2.16.840.1.113883.2.9.77.22.11.3" per le reazioni da intolleranza 
			- "2.16.840.1.113883.6.103" per le reazioni riportate nel sistema ICD-9-CM
			</assert>
		</rule>
		
		<!--Precedenti Esami eseguiti: controllo delle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='55114-3']]/hl7:entry">
			<assert test="count(hl7:observation)=1"
			>ERRORE-106| Sezione Precedenti Esami Eseguiti: L'elemento 'entry' della sezione deve contenere un elemento di tipo 'observation'.</assert>
				<!--Dubbio sul controllo @codeSystem-->
			<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-107| Sezione Precedenti Esami Eseguiti: l'entry/observation/code può essere valorizzato secodo i sistemi di codifica
			LOINC: @codeSystem='2.16.840.1.113883.6.1'
			ICD-9-CM: @codeSystem='2.16.840.1.113883.6.103' </assert>
		</rule>
		
		<!--Esame Eseguito: controllo delle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='55111-9']]/hl7:entry">
			<assert test="count(hl7:act)=1"
			>ERRORE-108| Sezione Esame Eseguito: La 'entry' della sezione deve contenere un elemento di tipo 'act'.</assert>
			<!--Dubbio sul controllo @codeSystem-->
			<assert test="(count(hl7:act/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:act/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1)"
			>ERRORE-109| Sezione Esame Eseguito: L'elemento entry/act/code può essere valorizzato secondo i sistemi di codifica:
			- LOINC (@codeSystem: 2.16.840.1.113883.6.1)
			- ICD-9-CM (@codeSystem: 2.16.840.1.113883.6.103).</assert>
			<assert test="count(hl7:act/hl7:statusCode[@code='active'])=1"
			>ERRORE-110| Sezione Esame Eseguito: L'elemento 'statusCode' all'interno di entry/act deve avere l'attributo @code valorizzato come "active".</assert>
			<assert test="count(hl7:act/hl7:effectiveTime)=1"
			>ERRORE-111| Sezione Esame Eseguito: entry/act della sezione deve avere l'elemento 'effectiveTime'.</assert>
		</rule>
		
		
	</pattern>
</schema>