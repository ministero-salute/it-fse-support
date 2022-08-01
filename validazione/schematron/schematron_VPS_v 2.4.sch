<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" 
		xmlns:cda="urn:hl7-org:v3"
        xmlns:iso="http://purl.oclc.org/dsdl/schematron"
        xmlns:sch="http://www.ascc.net/xml/schematron"
        queryBinding="xslt2">
	<title>Schematron Verbale di Pronto Soccorso V 1.0 </title>
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
			<assert test="count(hl7:templateId)>=1"
			>ERRORE-3| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.1'])= 1 and  count(hl7:templateId/@extension)= 1"
			>ERRORE-4| Almeno un elemento 'templateId' DEVE essere valorizzato attraverso l'attributo @root='2.16.840.1.113883.2.9.10.1.6.1' (id del template nazionale), associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>
			
			<!--Controllo code-->	
			<assert test="count(hl7:code[@code='59258-4'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-5| L'elemento <name/>/code deve essere valorizzato con l'attributo @code='59258-4' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
			
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName='Verbale di Pronto Soccorso'])=1 or
			count(hl7:code[@displayName='VERBALE DI PRONTO SOCCORSO'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Verbale di Pronto Soccorso'.--> </report>
			
			
			
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
					($versionNumber= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
			>ERRORE-8| Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del
			ClinicalDocument.id deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori di setId ed id per un documento clinico possono coincidere solo per la prima versione di un documento</assert>
			
			<assert test="(string(number($versionNumber)) ='NaN') or
						  ($versionNumber=1) or 
						  (($versionNumber &gt;1) and count(hl7:relatedDocument)=1)"
			>ERRORE-9| Se l'attributo <name/>/versionNumber/@value è maggiore di 1, l'elemento <name/>  deve contenere un elemento di tipo 'relatedDocument'</assert>
			
		
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
			
			<!--Controllo patientRole/addr-->
			<let name="num_addr" value="count(hl7:recordTarget/hl7:patientRole/hl7:addr)"/>
			
			<assert test="$num_addr=0 or (count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:country)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:city)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:streetAddressLine)=$num_addr)"
			>ERRORE-10| L'elemento <name/>/recordTarget/patientRole/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<!--Controllo patient/name-->
			<let name="patient" value="hl7:recordTarget/hl7:patientRole/hl7:patient"/>
			
			<assert test="count($patient)=1"
			>ERRORE-11| L'elemento <name/>/recordTaget/patientRole DEVE contenere l'elemento 'patient'</assert>
			<assert test="(count($patient/hl7:name/hl7:given)=1 and count($patient/hl7:name/hl7:family)=1)"
			>ERRORE-12| L'elemento <name/>/recordTaget/patientRole/patient/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			<!--Controllo patient/administrativeGenderCode-->
			<let name="genderOID" value="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@codeSystem"/>
			
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode)=1"
			>ERRORE-13| L'attributo <name/>/recordTarget/patientRole/patient DEVE contenere l'elemento administrativeGenderCode </assert>
			<assert test="$genderOID='2.16.840.1.113883.5.1'"
			>ERRORE-14| L'OID assegnato all'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@codeSystem='<value-of select="$genderOID"/>' non è corretto. L'attributo DEVE essere valorizzato con '2.16.840.1.113883.5.1' </assert>
			
			<!--Controllo author/assignedAuthor/id-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])>= 1"
			>ERRORE-15| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo author/assignedAuthor/addr-->
			<let name="num_addr_author" value="count(hl7:author/hl7:assignedAuthor/hl7:addr)"/>
			<assert test="$num_addr_author=0 or (count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:country)=$num_addr_author and 
			count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:city)=$num_addr_author and
			count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:streetAddressLine)=$num_addr_author)"
			>ERRORE-16| L'elemento <name/>/author/assignedAuthor/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>

			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:author/hl7:assignedAuthor/hl7:assignedPerson/hl7:name"/>
			<assert test="(count($name_author/hl7:given)=1 and count($name_author/hl7:family)=1)"
			>ERRORE-17| L'elemento ClinicalDocument/author/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
	
			
			<!--Controllo dataEnterer-->	
			<assert test="count(hl7:dataEnterer)=0 or count(hl7:dataEnterer/hl7:time)=1"
			>ERRORE-18| L'elemento <name/>/dataEnterer se presnete, DEVE contenere un elemento 'time'</assert>
			
			<let name="id_dataEnterer" value="hl7:dataEnterer/hl7:assignedEntity/hl7:id"/>
			<assert test="count(hl7:dataEnterer)=0 or count($id_dataEnterer[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-19| L'elemento <name/>/dataEnterer/assignedEntity DEVE avere almeno un elemento 'id' <value-of select="$id_dataEnterer"/> con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<let name="num_addr_data_ent" value="count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr)"/>
			<assert test="$num_addr_data_ent=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr/hl7:country)=$num_addr_data_ent and 
			count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr/hl7:city)=$num_addr_data_ent and
			count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr/hl7:streetAddressLine)=$num_addr_data_ent)"
			>ERRORE-20| L'elemento <name/>/dataEnterer/assignedEntity/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-21| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>	
			
			<!--Controllo custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-22| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and
			count($addr_cust/hl7:city)=$num_addr_cust and 
			count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-23| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>
			
			 <!--Controllo legalAuthenticator-->
			<assert test = "count(hl7:legalAuthenticator)=1" 
			>ERRORE-24| L'elemento <name/>/legalAuthenticator è obbligatorio</assert>
			<assert test = "count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])=1" 
			>ERRORE-25| L'elemento <name/>/legalAuthenticator/signatureCode deve essere valorizzato con il codice "S" </assert>
			<assert test = "count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-26| L'elemento <name/>/legalAuthenticator/assignedEntity DEVE contenere almeno un elemento id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			<assert test = "count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and 
			count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1"
			>ERRORE-27| L'elemento <name/>/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			<!--Participant-->
			<assert test="count(hl7:participant)=0 or count(hl7:participant/hl7:associatedEntity/hl7:id)>=1"
			>ERRORE-28| L'elemento <name/>/participant/associatedEntity deve contenere l'elemento 'id'.</assert>
			
			<!--Controllo componentOf-->
			<assert test="count(hl7:componentOf)=1"
			>ERRORE-29| L'elemento <name/>/componentOf è obbligatorio </assert>
			<assert test="count(hl7:componentOf/hl7:encompassingEncounter/hl7:effectiveTime/hl7:low)=1 and count(hl7:componentOf/hl7:encompassingEncounter/hl7:effectiveTime/hl7:high)=1"
			>ERRORE-30| L'elemento <name/>/componentOf/encompassingEncounter/effectiveTime deve contenere gli elementi 'low' e 'high' valorizzati </assert>
			
			<let name="path_name" value="hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:componentOf/hl7:encompassingEncounter/hl7:responsibleParty/hl7:assignedEntity/hl7:assignedPerson)=0 or 
			(count($path_name/hl7:given)=1 and count($path_name/hl7:family)=1)"
			>ERRORE-31| L'elemento <name/>/componentOf/encompassingEncounter/responsibleParty/assignedentity/assignedPerson/name deve contenere gli elementi 'given' e 'family' </assert>
		    <assert test="count(hl7:componentOf/hl7:encompassingEncounter/hl7:location)=1"
			>ERRORE-32| L'elemento <name/>/encompassingEncounter DEVE contenere l'elemento 'location'</assert>

			<assert test="count(hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization)=0 or 
			count (hl7:componentOf/hl7:encompassingEncounter/hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:id)=1"
			>ERRORE-33| L'elemento <name/>/componentOf/encompassingEncounter/location/healthcareFacility/serviceProviderOrganization deve contenere l'elemento 'id' </assert>
				
		</rule>

		
		<!--________________________________CONTROLLI SUI DIZIONARI_____________________________________________________________-->
			
				
				<!--Verifica che i codici LOINC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.6.1']">
			<let name="val_LOINC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.6.1.xml')//el[@code=$val_LOINC] or 
			$val_LOINC='LA16666-2' or $val_LOINC='LA18632-2' or $val_LOINC='LA28752-6' or $val_LOINC='LA18821-1'"
			>Errore 1_DIZ| Codice LOINC '<value-of select="$val_LOINC"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici AIC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.6.1.5']">
			<let name="val_AIC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.6.1.5.xml')//el[@code=$val_AIC]"
			>Errore 2_DIZ| Codice AIC '<value-of select="$val_AIC"/>' errato!
			</assert>
		</rule>
	
		<!--Verifica che i codici ATC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.6.73']">
			<let name="val_ATC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.6.73.xml')//el[@code=$val_ATC]"
			>Errore 3_DIZ| Codice ATC '<value-of select="$val_ATC"/>' errato!
			</assert>
		</rule>
		
	    <!--Verifica che i codici GE utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.6.1.51']">
			<let name="val_GE" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.6.1.51.xml')//el[@code=$val_GE]"
			>Errore 4_DIZ| Codice GE '<value-of select="$val_GE"/>' errato!
			</assert>
		</rule>
				
		<!--Verifica che i codici ActStatus utilizzati siano corretti-->
		<rule context="//hl7:statusCode">
			<let name="val_status" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.11.22.12.xml')//el[@code=$val_status]"
			>Errore 5_DIZ| Codice ActStatus '<value-of select="$val_status"/>' errato!
			</assert>
		</rule>		
				
		<!--Verifica che i codici ICD-9-CM utilizzati siano corretti-->
		<!--rule context="//*[@codeSystem='2.16.840.1.113883.6.103']">
			<let name="val_ICD9CM" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.6.103.xml')//el[@code=$val_ICD9CM]"
			>Errore 6_DIZ| Codice ICD-9-CM '<value-of select="$val_ICD9CM"/>' errato!
			</assert>
		</rule-->
		
		<!--Verifica che i codici relativi al value set "Allergeni (No Farmaci)" utilizzati siano corretti-->		
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2']">
			<let name="val_AllNoFarm" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.2.xml')//el[@code=$val_AllNoFarm]"
			>Errore 7_DIZ| Codice "Allergeni (No Farmaci)"  '<value-of select="$val_AllNoFarm"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "UnitsOfMeasureCaseSensitive" utilizzati siano corretti-->
		<rule context="//*[@unit]">
			<let name="unit" value="@unit"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.1.11.12839.xml')//el[@code=$unit]"
			>Errore 8_DIZ| Codice "UnitsOfMeasureCaseSensitive"  '<value-of select="$unit"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ReazioniIntolleranza" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3']">
			<let name="reaz_intoller" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.3.xml')//el[@code=$reaz_intoller]"
			>Errore 9_DIZ| Codice "Reazioni Intolleranza"  '<value-of select="$reaz_intoller"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ReazioniAllergiche" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.4']">
			<let name="reaz_aller" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.4.xml')//el[@code=$reaz_aller]"
			>Errore 10_DIZ| Codice "ReazioniAllergiche"  '<value-of select="$reaz_aller"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "CriticalityObservation" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.6']">
			<let name="criticality" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.6.xml')//el[@code=$criticality]"
			>Errore 11_DIZ| Codice "CriticalityObservation"  '<value-of select="$criticality"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "StatoClinicoProblema" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.7']">
			<let name="status_problem" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.7.xml')//el[@code=$status_problem]"
			>Errore 12_DIZ| Codice "StatoClinicoProblema"  '<value-of select="$status_problem"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Cronicità" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10']">
			<let name="conicita" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.10.xml')//el[@code=$conicita]"
			>Errore 13_DIZ| Codice "Cronicità"  '<value-of select="$conicita"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ActSite" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.1052']">
			<let name="sito" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.5.1052.xml')//el[@code=$sito]"
			>Errore 14_DIZ| Codice "ActSite"  '<value-of select="$sito"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ObservationIntoleranceType" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.1.11.19700']">
			<let name="intoleranceType" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.1.11.19700.xml')//el[@code=$intoleranceType]"
			>Errore 15_DIZ| Codice "ObservationIntoleranceType"  '<value-of select="$intoleranceType"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ObservationIntoleranceType" utilizzati siano corretti-->
		<!--rule context="//*[@codeSystem='2.16.840.1.113883.5.4']">
			<let name="obsIntoleranceType" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.5.4.xml')//el[@code=$obsIntoleranceType]"
			>Errore 16_DIZ| Codice "ObservationIntoleranceType"  '<value-of select="$obsIntoleranceType"/>' errato!
			</assert>
		</rule-->
		
		<!--Verifica che i codici relativi al value set "RouteOfAdministration" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.112']">
			<let name="via_somminist" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.5.112.xml')//el[@code=$via_somminist]"
			>Errore 17_DIZ| Codice "RouteOfAdministration"  '<value-of select="$via_somminist"/>' errato!
			</assert>
		</rule>		
			

		<!--Verifica che i codici relativi al value set "AdministrativeGender" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.1.11.1']">
			<let name="gender" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.1.11.1.xml')//el[@code=$gender]"
			>Errore 18_DIZ| Codice "AdministrativeGender"  '<value-of select="$gender"/>' errato!
			</assert>
		</rule>	

		<!--Verifica che i codici relativi al value set "TipoEncounterPostDimissione" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.9']">
			<let name="type_encounter" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.1.11.1.2.9.xml')//el[@code=$type_encounter]"
			>Errore 19_DIZ| Codice "TipoEncounterPostDimissione"  '<value-of select="$type_encounter"/>' errato!
			</assert>
		</rule>	

		<!--Verifica che i codici relativi al value set "EtàInsorgenza del problema" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.8']">
			<let name="età_insorgenza" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.8.xml')//el[@code=$età_insorgenza]"
			>Errore 20_DIZ| Codice "EtàInsorgenza del problema"  '<value-of select="$età_insorgenza"/>' errato!
			</assert>
		</rule>	
		
		<!--Verifica che i codici relativi al value set "ProblemObservation" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.9']">
			<let name="problem_obs" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.2.9.77.22.11.9.xml')//el[@code=$problem_obs]"
			>Errore 21_DIZ| Codice "ProblemObservation"  '<value-of select="$problem_obs"/>' errato!
			</assert>
		</rule>	

		<!--Verifica che i codici relativi al value set "RoleCode" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.111']">
			<let name="roleCode" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_V1/2.16.840.1.113883.5.111.xml')//el[@code=$roleCode]"
			>Errore 22_DIZ| Codice "RoleCode"  '<value-of select="$roleCode"/>' errato!
			</assert>
		</rule>			
				
				
				
<!--________________________________CONTROLLI GENERICI_________________________________________________________________-->
	
		<!--Controllo use Telecom-->
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>ERRORE-34| L’elemento 'telecom' DEVE contenere l'attributo @use </assert>
		</rule>	
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension, '[A-Z0-9]{16}')"
			>ERRORE-35| codice fiscale '<value-of select="$CF"/>' cittadino ed operatore: 16 cifre [A-Z0-9]{16}</assert>
		</rule>
	
		<!--Controllo sugli attributi di observation-->
		<rule context="//hl7:observation">
			<let name="moodCd" value="@moodCode"/>
			<assert test="count(@classCode)=1"
			>ERRORE-36| L'attributo "@classCode" dell'elemento "observation" deve essere presente </assert>
			<assert test="$moodCd='EVN'"
			>ERRORE-37| L'attributo "@moodCode" dell'elemento "observation" deve essere valorizzato con "EVN" </assert>
		</rule>

		
		
				
<!--________________________________BODY____________________________________________________________________________-->
		
		
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody">
		                            <!--Controllo sulle Section obbligatorie-->
			<!--1-->
			<!-- Modalità di trasporto-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='11459-5'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-38| Sezione Modalità di Trasporto: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11459-5']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.20'])=1"
			>ERRORE-39| Sezione Modalità di Trasporto: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.20'</assert>			
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11459-5']]/hl7:text)=1 and count(hl7:component/hl7:section[hl7:code[@code='11459-5']]/hl7:entry)=1"
			>ERRORE-40| Sezione Modalità di Trasporto: la sezione DEVE contenere un elemento 'text' e un solo elemento 'entry'</assert>
			
			
			<!--2-->
			<!--Motivo della Visita-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='46239-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-41| Sezione Motivo della Visita: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46239-0']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.42'])=1"
			>ERRORE-42| Sezione Motivo della Visita: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.42'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46239-0']]/hl7:text)=1"
			>ERRORE-43| Sezione Motivo della Visita: la sezione DEVE contenere l'elemento 'text'</assert>
				
				<!--Motivo della visita: controllo delle 2 entry-->
				<let name="probl_principale" value="hl7:component/hl7:section[hl7:code[@code='46239-0']]/hl7:entry[hl7:observation/hl7:code[@code='56817-0']]"/>
				<let name="causa_accesso" value="hl7:component/hl7:section[hl7:code[@code='46239-0']]/hl7:entry[hl7:observation/hl7:code[@code='29298-7']]"/>
				<assert test="count($probl_principale)=1 and (count($causa_accesso)&lt;=1)"
				>ERRORE-44| Sezione Motivo della visita: la sezione DEVE contenere almeno una 'entry' relativa al Problema Principale e può contenere una seconda 'entry' relativa alla Causa di Accesso</assert>
				
				<assert test="count($probl_principale/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.37'])=1"
				>ERRORE-45| Sezione Motivo della visita: l'elemento entry/observation relativo al "Problema Principale" DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.37'</assert>			
				<assert test="count($probl_principale/hl7:observation/hl7:code[@code='56817-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-46| Sezione Motivo della visita: l'elemento entry/observation/code relativo al "Problema Principale" deve avere l'attributo @code valorizzato con '56817-0' e l'attributo @codeSystem con '2.16.840.1.113883.6.1'</assert>
				<assert test="count($probl_principale/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-47| Sezione Motivo della visita: l'elemento entry/observation/statusCode relativo al "Problema Principale" DEVE  assumere il valore 'completed'</assert>
				<assert test="count($probl_principale/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.6.1.54.2'])=1"
				>ERRORE-48| Sezione Motivo della visita: l'elemento entry/observation/value relativo al "Problema Principale" DEVE essere valorizzato col value set ProblemaPrincipale_VPS</assert>			
				
				<assert test="count($causa_accesso)=0 or 
				count($causa_accesso/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.87'])=1"
				>ERRORE-49| Sezione Motivo della visita: l'elemento entry relativo alla "Causa di accesso" DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.87'</assert>
				<assert test="count($causa_accesso)=0 or 
				count($causa_accesso/hl7:observation/hl7:code[@code='29298-7'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-50| Sezione Motivo della visita: l'elemento entry relativo alla "Causa di accesso" DEVE contenere l'elemento code valorizzato con l'attributo @code='29298-7' e l'attributo @codeSystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count($causa_accesso)=0 or 
				count($causa_accesso/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-51| Sezione Motivo della visita: l'elemento entry relativo alla "Causa di accesso" DEVE contenere l'elemento statusCode  col valore costante 'completed'</assert>
				<assert test="count($causa_accesso)=0 or 
				count($causa_accesso/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.12'])=1"
				>ERRORE-52| Sezione Motivo della visita: l'elemento entry relativo alla "Causa di accesso" DEVE contenere l'elemento value valorizzato col value set CausaAccesso_VPS</assert>
			
			<!--3-->			
			<!--Triage-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='54094-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-53| Sezione Triage: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='54094-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.21'])=1"
			>ERRORE-54| Sezione Triage: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.21'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='54094-8']]/hl7:text)=1 and count(hl7:component/hl7:section[hl7:code[@code='54094-8']]/hl7:entry)=1"
			>ERRORE-55| Sezione Triage: la sezione DEVE contenere un elemento 'text' ed un solo elemento 'entry'</assert>
			
			<!--12-->
			<!--Dimissione-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-56| Sezione Dimissione: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.24'])=1"
			>ERRORE-57| Sezione Dimissione: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.24'</assert>
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
			count(hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:text)=1"
			>ERRORE-58| Sezione Dimissione: la sezione DEVE contenere l'elemento 'text'</assert>
			<!--12.1-->
			<!--Controllo 1° entry/act "Dimissione"-->
				<let name="act_discharge" value="hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act"/>
				<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
				count($act_discharge[@classCode='ACT'][@moodCode='EVN'])=1"
				>ERRORE-59| Sezione Dimissione: l'entry "Dimissione" DEVE contenere un elemento 'act' con gli attributi @classCode='ACT' e @moodCode='EVN'</assert>
				<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
				count($act_discharge/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.66'])=1"
				>ERRORE-60| Sezione Dimissione: l'entry/act "Dimissione" DEVE contenere un elemento 'templateId' valorizzato con l'attrivuto @root='2.16.840.1.113883.2.9.10.1.6.66'</assert>
				<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
				count($act_discharge/hl7:code[@code='dimissione'][@codeSystem='2.16.840.1.113883.2.9.5.1.4'])=1"
				>ERRORE-61| Sezione Dimissione: l'entry/act "Dimissione" DEVE contenere un elemento 'code' valorizzato con @code='dimissione' e @codeSystem='2.16.840.1.113883.2.9.5.1.4'</assert>
				<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or 
				count($act_discharge/hl7:statusCode[@code='completed'])=1"
				>ERRORE-62| Sezione Dimissione: l'entry/act "Dimissione" DEVE contenere un elemento 'statusCode' valorizzato con @code='completed'</assert>
				<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or count($act_discharge/hl7:effectiveTime)=1"
				>ERRORE-63| Sezione Dimissione: l'entry/act "Dimissione" DEVE contenere un elemento 'effectiveTime'</assert>
				<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or count($act_discharge/hl7:performer)=1"
				>ERRORE-64| Sezione Dimissione: l'entry/act "Dimissione" DEVE contenere un elemento 'performer'</assert>
				<!--Performer-->
				<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or 
				count($act_discharge/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and 
				count($act_discharge/hl7:performer/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1"
				>ERRORE-65| Sezione Dimissione: l'entry/act/performer/assignedEntity/assignedPerson/name DEVE contenere gli elementi 'family' e 'given'</assert>
				
					<!--12.1.3-->
					<!--entryRelationship/observation Diagnosi(1..N)-->
					<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
					count($act_discharge/hl7:entryRelationship[hl7:observation/hl7:code[@code='29308-4']])>=1"
					>ERRORE-66| Sezione Dimissione: l'entry/act "Dimissione" DEVE contenere almeno un elemento 'entryRelationship' relativo alla Diagnosi</assert>
					<!--12.1.4-->
					<!--entryRelationship/observation Esito(1..1)-->
					<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
					count($act_discharge/hl7:entryRelationship[hl7:observation/hl7:code[@code='11302-7']])=1"
					>ERRORE-67| Sezione Dimissione: l'entry/act "Dimissione" DEVE contenere un solo elemento 'entryRelationship' relativo all'Esito</assert>
					<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
					count($act_discharge/hl7:entryRelationship/hl7:observation[hl7:code[@code='11302-7']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.69'])=1"				
					>ERRORE-68| Sezione Dimissione: l'entry/act/entryRelationship relativo all'Esito DEVE contenere  un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.6.69'.</assert>		
					<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
					count($act_discharge/hl7:entryRelationship/hl7:observation[hl7:code[@code='11302-7']]/hl7:statusCode[@code='completed'])=1"	
					>ERRORE-69| Sezione Dimissione: l'entry/act/entryRelationship relativo all'Esito DEVE contenere  un elemento 'statusCode' valorizzato con @code='completed'</assert>
					<assert test="count(hl7:component/hl7:section/hl7:code[@code='28574-2'])=0 or
					count($act_discharge/hl7:entryRelationship/hl7:observation[hl7:code[@code='11302-7']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.6.1.54.5'])=1"
					>ERRORE-70| Sezione Dimissione: l'entry/act/entryRelationship relativo all'Esito DEVE contenere  un elemento 'value' valorizzato secondo il value set "EsitoTrattamento_VPS" - @codeSystem='2.16.840.1.113883.2.9.6.1.54.5'</assert>
			
			<!--12.2-->
			<!--Controllo 2° entry "Prognosi" (0..1)-->
				<let name="prognosi" value="hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.66']]"/>
				<assert test="(count($prognosi)&lt;=1)"
				>ERRORE-71| Sezione Dimissione: l'entry/observation "Prognosi" può essere presente una sola volta</assert>
				<assert test="count($prognosi)=0 or count($prognosi/hl7:observation/hl7:code[@code='75328-5'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-72| Sezione Dimissione: l'entry/observation "Prognosi" DEVE contenere un elemento 'code' valorizzato con @code='75328-5' @codeSystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count($prognosi)=0 or count($prognosi/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-73| Sezione Dimissione: l'entry/observation "Prognosi" DEVE contenere un elemento 'statusCode' valorizzato con @code='completed'</assert>
				<assert test="count($prognosi)=0 or count($prognosi/hl7:observation/hl7:value)=1"
				>ERRORE-74| Sezione Dimissione: l'entry/observation "Prognosi" DEVE contenere un elemento 'value'</assert>
			
			<!--12.3-->
			<!--Controllo 3° entry "Livello appropriatezza" (0..1)-->
				<let name="appropriatezza" value="hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry[hl7:observation/hl7:code[@code='11283-9']]"/>
				<assert test="(count($appropriatezza)&lt;=1)"
				>ERRORE-75| Sezione Dimissione: l'entry/observation "Livello di Appropriatezza" può essere presente una sola volta</assert>
				<assert test="count($appropriatezza)=0 or count($appropriatezza/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.72'])=1"
				>ERRORE-76| Sezione Dimissione: l'entry/observation "Livello di Appropriatezza" DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.6.72'</assert>
				<assert test="count($appropriatezza)=0 or count($appropriatezza/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-77| Sezione Dimissione: l'entry/observation "Livello di Appropriatezza" DEVE contenere un elemento 'statusCode' valorizzato con @code='completed'</assert>
				<assert test="count($appropriatezza)=0 or count($appropriatezza/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.6.1.54.4'])=1"
				>ERRORE-78| Sezione Dimissione: l'entry/observation "Livello di Appropriatezza" DEVE contenere un elemento 'value' valorizzato secondo il value set "CodiceTriage_VPS" @codeSystem='2.16.840.1.113883.2.9.6.1.54.4'</assert>
			
			<!--12.4-->
			<!--Controllo 4° entry "Data Decesso" (0..1)-->
				<let name="data_decesso" value="hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry[hl7:observation/hl7:code[@code='31211-6']]"/>
				<assert test="(count($data_decesso)&lt;=1)"
				>ERRORE-79| Sezione Dimissione: l'entry/observation "Data Decesso" può essere presente una sola volta</assert>
				<assert test="count($data_decesso)=0 or count($data_decesso/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.86'])=1"
				>ERRORE-80| Sezione Dimissione: l'entry/observation "Data Decesso" DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.6.86'</assert>
				<assert test="count($data_decesso)=0 or count($data_decesso/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-81| Sezione Dimissione: l'entry/observation "Data Decesso" DEVE contenere un elemento 'statusCode' @code='completed'</assert>
				<assert test="count($data_decesso)=0 or count($data_decesso/hl7:observation/hl7:effectiveTime)=1"
				>ERRORE-82| Sezione Dimissione: l'entry/observation "Data Decesso" DEVE contenere un elemento 'effectiveTime'</assert>
			
			<!--12.5-->
			<!--Controllo 5° entry "Richiesta Autopsia" (0..1)-->
				<let name="autopsia" value="hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry[hl7:observation/hl7:code[@code='45477-7']]"/>
				<assert test="(count($autopsia)&lt;=1)"
				>ERRORE-83| Sezione Dimissione: l'entry/observation "Richiesta Autopsia" può essere presente una sola volta</assert>
				<assert test="count($autopsia)=0 or count($autopsia/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.73'])=1"
				>ERRORE-84| Sezione Dimissione: l'entry/observation "Richiesta Autopsia" DEVE contenere un elemento 'templateId' @root='2.16.840.1.113883.2.9.10.1.6.73'</assert>
				<assert test="count($autopsia)=0 or count($autopsia/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-85| Sezione Dimissione: l'entry/observation "Richiesta Autopsia" DEVE contenere un elemento 'statusCode' @code='completed'</assert>
				<assert test="count($autopsia)=0 or count($autopsia/hl7:observation/hl7:value[@xsi:type='BL'])=1"
				>ERRORE-86| Sezione Dimissione: l'entry/observation "Richiesta Autopsia" DEVE contenere un elemento 'value' di tipo @xsi:type='BL'</assert>
			
									<!--Controllo sulle Section opzionali-->
			<!--4-->
			<!--Inquadramento Clinico Iniziale-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.56'])=1"
			>ERRORE-87| Sezione Inquadramento Clinico Iniziale: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.56'</assert>	
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']])=1 or
			count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='29545-1']])=1 or
			count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='42346-7']])=1 or
			count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']])=1 or
			count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11450-4']])=1) or
			count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:text)=1"
			>ERRORE-88| Sezione Inquadramento Clinico Iniziale: la sezione deve contenere l'elemento 'text'</assert>
			
			<!--controllo cardinalità sotto sezioni-->
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component[hl7:section/hl7:code[@code='11329-0']])&lt;=1)"
			>ERRORE-89| Sezione Inquadramento Clinico Iniziale: la sezione può contenere al massimo una sotto-sezione "Anamnesi"</assert>	
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component[hl7:section/hl7:code[@code='29545-1']])&lt;=1)"
			>ERRORE-90| Sezione Inquadramento Clinico Iniziale: la sezione può contenere al massimo una sotto-sezione "Esame Obiettivo"</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component[hl7:section/hl7:code[@code='42346-7']])&lt;=1)"
			>ERRORE-91| Sezione Inquadramento Clinico Iniziale: la sezione può contenere al massimo una sotto-sezione "Terapia Farmacologica all'ingresso"</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component[hl7:section/hl7:code[@code='48765-2']])&lt;=1)"
			>ERRORE-92| Sezione Inquadramento Clinico Iniziale: la sezione può contenere al massimo una sotto-sezione "Allergie"</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component[hl7:section/hl7:code[@code='11450-4']])&lt;=1)"
			>ERRORE-93| Sezione Inquadramento Clinico Iniziale: la sezione può contenere al massimo una sotto-sezione "Problemi aperti"</assert>
			
			<!--5-->		
			<!--Encounters-->	
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.50'])=1"
			>ERRORE-94| Sezione Encounters: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.50'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:text)=1"
			>ERRORE-95| Sezione Encounters: la sezione deve contenere l'elemento 'text'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry)>=1"
			>ERRORE-96| Sezione Encounters: la sezione deve contenere almeno un elemento 'entry'</assert>
			
			<!--6-->
			<!--Decorso Ospedaliero-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8648-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='8648-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.23'])=1"
			>ERRORE-97| Sezione Decorso Ospedaliero: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.23'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8648-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='8648-8']]/hl7:text)=1"
			>ERRORE-98| Sezione Decorso Ospedaliero: la sezione deve contenere l'elemento 'text'</assert>
			
			
			<!--7-->
			<!--Complicanze-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='55109-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='55109-3']]/hl7:text)=1"
			>ERRORE-99| Sezione Complicanze: la sezione deve contenere l'elemento 'text'</assert>
			
			<!--8-->
			<!--Interventi, Prestazioni, Consulenze e Richieste-->	
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='62387-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.26'])=1"
			>ERRORE-100| Sezione Interventi, Prestazioni, Consulenze e Richieste: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.26'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='62387-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:text)=1"
			>ERRORE-101| Sezione Interventi, Prestazioni, Consulenze e Richieste: la sezione deve contenere l'elemento 'text'</assert>
			
			<!--9-->
			<!--Accertamenti-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.27'])=1"
			>ERRORE-102| Sezione Accertamenti: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.27'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:text)=1"
			>ERRORE-103| Sezione Accertamenti: Ll sezione deve contenere l'elemento 'text'</assert>
			
			<!--10-->
			<!--Parametri Vitali-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8716-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.28'])=1"
			>ERRORE-104| Sezione Parametri Vitali: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.28'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8716-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:text)=1"
			>ERRORE-105| Sezione Parametri Vitali: la sezione deve contenere l'elemento 'text'</assert>
			
			<!--11-->
			<!--Terapia farmacologica in Pronto Soccorso-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29549-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='29549-3']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.29'])=1"
			>ERRORE-106| Sezione Terapia farmacologica in Pronto Soccorso: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.29'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29549-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='29549-3']]/hl7:text)=1"
			>ERRORE-107| Sezione Terapia farmacologica in Pronto Soccorso: la sezione deve contenere l'elemento 'text'</assert>
			
			<!--13-->
			<!--Piano di cura alla dimissione-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='18776-5']])=0 or count(hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.34'])=1"
			>ERRORE-108| Sezione Piano di cura alla dimissione: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.34'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='18776-5']])=0 or count(hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:text)=1"
			>ERRORE-109| Sezione Piano di cura alla dimissione: la sezione deve contenere l'elemento 'text'</assert>
			
			<!--14-->
			<!--Terapia farmacologica alla dimissione-->		
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='75311-1']])=0 or count(hl7:component/hl7:section[hl7:code[@code='75311-1']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.74'])=1"
			>ERRORE-110| Sezione Terapia farmacologica alla dimissione: la sezione deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.74'.</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='75311-1']])=0 or count(hl7:component/hl7:section[hl7:code[@code='75311-1']]/hl7:text)=1"
			>ERRORE-111| Sezione Terapia farmacologica alla dimissione: la sezione deve contenere l'elemento 'text'</assert>
			
		</rule>

		<!--Controllo sui codici delle Section-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section">
			<let name="codice" value="hl7:code/@code"/>
			<assert test="count(hl7:code[@code='11459-5'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='46239-0'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='54094-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 
			or count(hl7:code[@code='78337-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='46240-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='8648-8'][@codeSystem='2.16.840.1.113883.6.1'])=1 
			or count(hl7:code[@code='55109-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='62387-6'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='30954-2'][@codeSystem='2.16.840.1.113883.6.1'])=1  
			or count(hl7:code[@code='8716-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='29549-3'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='28574-2'][@codeSystem='2.16.840.1.113883.6.1'])=1
			or count(hl7:code[@code='18776-5'][@codeSystem='2.16.840.1.113883.6.1'])=1 or count(hl7:code[@code='75311-1'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-112| Il codice '<value-of select="$codice"/>' non è corretto. La sezione deve essere valorizzata con uno dei seguenti codici:
			11459-5 Sezione Motivo di trasporto
			46239-0	Sezione Motivo della visita
			54094-8	Sezione Triage
			78337-3 Sezione Inquadramentoclinico iniziale
			46240-8 Sezione Encounters
			8648-8  Sezione Decorso ospedaliero
			55109-3 Sezione Complicanze
			62387-6 Sezione Interventi, prestazioni, consulenze e richieste
			30954-2 Sezione Accertamenti
			8716-3  Sezione Parametri vitali
			29549-3 Sezione Terapia farmacologica in pronto soccorso
			18776-5 Sezione Piano di cura alla dimissione
			75311-1 Sezione Terapia farmacologica alla dimissione
			</assert>
		</rule>	
		
		<!--1-->
		<!-- Modalità di trasporto: controllo sulla entry -->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11459-5']]/hl7:entry">
			<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.40'])=1"
			>ERRORE-113| Sezione Modalità di trasporto: l'elemento entry/act DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.40'</assert>
			<assert test="count(hl7:act/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.54.6'])=1"
			>ERRORE-114| Sezione Modalità di trasporto: l'elemento entry/act/code DEVE avere l'attributo @codeSystem con '2.16.840.1.113883.2.9.6.1.54.6'</assert>
			<assert test="count(hl7:act/hl7:statusCode[@code='completed'])=1"
			>ERRORE-115| Sezione Modalità di trasporto: l'elemento entry/act/statusCode  DEVE  assumere il valore 'completed'</assert>
			<assert test="count(hl7:act/hl7:participant/hl7:participantRole/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.54.1'])=1"
			>ERRORE-116| Sezione Modalità di trasporto: l'elemento entry/act/participant/participantRole DEVE contenere l'elemento code valorizzato con l'attributo @codeSystem='2.16.840.1.113883.2.9.6.1.54.1'</assert>
		</rule>
		
		<!--3-->
		<!--Triage: controllo sull'entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='54094-8']]/hl7:entry">
			<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.39'])=1"
			>ERRORE-117| Sezione Triage: l'elemento entry/observation DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.39'</assert>
			<assert test="count(hl7:observation/hl7:code[@code='11283-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-118| Sezione Triage: l'elemento entry/observation/code deve avere l'attributo @code valorizzato con '11283-9' e l'attributo @codeSystem con '2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-119| Sezione Triage: l'elemento entry/observation/statusCode  DEVE  assumere il valore 'completed'</assert>
			<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.6.1.54.4'])=1"
			>ERRORE-120| Sezione Triage: l'elemento entry/observation/value DEVE essere valorizzato col value set CodiceTriage_VPS</assert>	
		</rule>
		
			<!--3.1-->
			<!--Triage: controllo sull'entry/observtion/performer-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='54094-8']]/hl7:entry/hl7:observation/hl7:performer">
					
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and 
				count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1"
				>ERRORE-121|Sezione Triage: entry/observation/performer/assignedEntity/assignedPerson/name deve contenere gli elementi "given" e "family" </assert>	
			</rule>
		
		<!--4-->
		<!--Sezione inquadramento clinico iniziale-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component">
		
			<!-- Anamnesi-->
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.55']])=0 or count(hl7:section/hl7:code[@code='11329-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-122| Sotto-sezione Anamnesi: deve contenere l'elemento code con attributi @code='11329-0' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.55']])=0 or 
			count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.55']]/hl7:text)=1"
			>ERRORE-123| Sotto-sezione Anamnesi: deve contenere l'elemento 'text'</assert>
			
			<!--Esame obiettivo-->
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.58']])=0 or 
			count(hl7:section/hl7:code[@code='29545-1'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-124| Sotto-sezione Esame obiettivo: deve contenere l'elemento code con attributi @code='29545-1' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.58']])=0 or 
			count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.58']]/hl7:text)=1"
			>ERRORE-125| Sotto-sezione Esame obiettivo: deve contenere l'elemento 'text'</assert>
			
			<!--Terapie in essere-->
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.57']])=0 or count(hl7:section/hl7:code[@code='42346-7'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-126| Sotto-sezione Terapie farmacologiche all'ingresso: deve contenere l'elemento code con attributi @code='42346-7' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.57']])=0 or 
			count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.57']]/hl7:text)=1"
			>ERRORE-127| Sotto-sezione Terapie farmacologiche all'ingresso: deve contenere l'elemento 'text'</assert>
			
			<!--Allergie-->
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.33']])=0 or count(hl7:section/hl7:code[@code='48765-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-128| Sotto-sezione Allergie: deve contenere l'elemento code con attributi @code='48765-2' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.33']])=0 or 
			count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.33']]/hl7:text)=1"
			>ERRORE-129| Sotto-sezione Allergie: deve contenere l'elemento 'text'</assert>
			
			<!--Problemi aperti-->
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.59']])=0 or count(hl7:section/hl7:code[@code='11450-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-130| Sotto-sezione Problemi aperti: deve contenere l'elemento code con attributi @code='11450-4' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.59']])=0 or 
			count(hl7:section[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.59']]/hl7:text)=1"
			>ERRORE-131| Sotto-sezione Problemi aperti: deve contenere l'elemento 'text'</assert>
					
		</rule>
		
		<!--Sezione inquadramento clinico iniziale: controllo sugli author-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-132| Sezione Inquadramento clinico iniziale: l'elemento section/author/assignedAuthor/assignedPerson/name deve contenere i sotto elementi 'given' e 'family'</assert>
		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or 
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-133| Sotto-sezione Anamnesi: deve contenere l'elemento author/assignedAuthor/assignedPerson/name con i sotto-elementi 'given' e 'family' </assert>
		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='29545-1']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or 
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-134| Sotto-sezione Esame obiettivo: deve contenere l'elemento author/assignedAuthor/assignedPerson/name con i sotto-elementi 'given' e 'family'</assert>
		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='42346-7']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or 
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-135| Sotto-sezione Terapie in essere: deve contenere l'elemento author/assignedAuthor/assignedPerson/name con i sotto-elementi 'given' e 'family'</assert>
		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or 
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-136| Sotto-sezione Allergie: deve contenere l'elemento author/assignedAuthor/assignedPerson/name con i sotto-elementi 'given' e 'family'</assert>	
		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or 
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-137| Sotto-sezione Problemi aperti: deve contenere l'elemento author/assignedAuthor/assignedPerson/name con i sotto-elementi 'given' e 'family'</assert>
		</rule>
		
			
			<!--4.1-->
			<!--Anamnesi: Dettaglio Anamnesi Patologica e Fisiologica(entry/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry">
				
				<!--controllo sui sotto elementi di entry-->
				<assert test="count(hl7:observation)=1 or count(hl7:organizer)=1"
				>ERRORE-138| Sotto-sezione Anamnesi: l'elemento 'entry' deve avere uno dei seguenti sotto elementi:
				- 'observation': per l'Anamnesi patologica e fisiologica;
				- 'organizer': per l'Anamnesi familiare.</assert>
				
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:code[@code='75326-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-139| Sotto-sezione Anamnesi: l'elemento entry/observation/code deve avere gli attributi @code='75326-9' e @codeSystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-140| Sotto-sezione Anamnesi: l'elemento entry/observation/statusCode deve avere l'attributo @code='completed'</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-141| Sotto-sezione Anamnesi: l'elemento entry/observation/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato</assert>
				<assert test="(count(hl7:observation)=0 or count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code[@code='33999-4']])=0) or 
				(count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@code='LA18632-2'])=1 and 
				count(hl7:observation/hl7:effectiveTime/hl7:high)=1) or count(hl7:observation/hl7:effectiveTime/hl7:high)=1"
				>ERRORE-142| Sotto-sezione Anamnesi: l'elemento entry/observation/effectiveTime deve essere presente e deve avere l'elemento 'high' valorizzato</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-143| Sotto-sezione Anamnesi: l'elemento entry/observation/value deve avere l'attributo @xsi:type="CD" </assert>
				<assert test="count(hl7:observation)=0 or (count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1)
				or (count(hl7:observation/hl7:value/@code)=1 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)&lt;=1)"
				>ERRORE-144| Sotto-sezione Anamnesi: nel caso di entry/observation/value non codificato, deve essere valorizzato l'elemento 'originalText/reference'</assert>
				<assert test="count(hl7:observation)=0 or (count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='89261-2']])&lt;=1)"
				>ERRORE-145| Sotto-sezione Anamnesi: l'entry/observation può contenere al più una entryRelationship relativa alla Cronicità</assert>
				<assert test="count(hl7:observation)=0 or (count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='33999-4']])&lt;=1)"
				>ERRORE-146| Sotto-sezione Anamnesi: l'entry/observation può contenere al più una 'entryRelationship' relativa allo Stato Clinico del problema</assert>
				
				<!--Anamnesi: dettaglio anamnesi familiare(entry/organizer)-->
				<assert test="count(hl7:organizer)=0 or count(hl7:organizer[@classCode='CLUSTER'])=1 and count(hl7:organizer/@moodCode)=1"
				>ERRORE-147| Sotto-sezione Anamnesi: l'elemento entry/organizer deve avere gli attributi @classCode='CLUSTER' e @moodCode='EVN'</assert>
				<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:code[@code='10157-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-148| Sotto-sezione Anamnesi: l'elemento entry/organizer/code deve avere gli attributi @code='10157-6' e @codeSystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:statusCode[@code='completed'])=1"
				>ERRORE-149| Sotto-sezione Anamnesi: l'elemento entry/organizer/statusCode deve avere l'attributo @code='completed'</assert>
				<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:effectiveTime)=1"
				>ERRORE-150| Sotto-sezione Anamnesi: l'elemento entry/organizer/effectiveTime deve essere presente</assert>
				<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:subject/hl7:relatedSubject[@classCode='PRS'])=1 and 
				count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:code[@codeSystem='2.16.840.1.113883.5.111'])=1"
				>ERRORE-151| Sotto-sezione Anamnesi: l'elemento entry/organizer/subject/relatedSubject deve avere l'attributo @classCode='PRS' e deve contenere l'elemento 'code'</assert>
				<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:component)>=1"
				>ERRORE-152| Sotto-sezione Anamnesi: l'elemento entry/organizer deve contenere almeno un elelemento component di tipo observation.</assert>
			</rule>
				
				<!--4.1.1-->
				<!--Anamnesi: Cronicità della patologia\stato clinico del problema (entry/observation/entryRelationship/observation)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:observation/hl7:entryRelationship">
					
					<assert test="(count(hl7:observation/hl7:code[@code='89261-2'][@codeSystem='2.16.840.1.113883.6.1'])=1 or
					count(hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1)"
					>ERRORE-153| Sotto-sezione Anamnesi: l'elemento entry/observation/entryRelationship/observation/code deve avere l'attributo @code valorizzato con:
					"89261-2" per "Cronicità patologia";
					"33999-4" per "Stato clinico patologia"
					</assert>
					<assert test="count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value)=0 or 
					(count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
					count(hl7:observation[hl7:code[@code='89261-2']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10'])=1)"
					>ERRORE-154| Sotto-sezione Anamnesi: l'elemento entry/observation/entryRelationship/observation/value relativo alla Cronicità deve essere valorizzato secondo il Value set "CronicitàProblema"</assert>
					<!--per il controllo inerente il sistema di codifica da utilizzare, c'è la possibilità di usare anche sistemi di codifica locali-->
					<assert test="count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value)=0 or 
					(count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
					count(hl7:observation[hl7:code[@code='33999-4']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.7'])=1)"
					>ERRORE-155| Sotto-sezione Anamnesi: l'elemento entry/observation/entryRelationship/observation/value relativo allo Stato Clinico della patologia deve essere valorizzato secondo il Value set "StatoClinicoProblema"</assert>
				</rule>
				
				<!--4.1.2-->
				<!--Anamnesi: dettaglio anamnesi del familiare in oggetto (entry/organizer/component/observation)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:organizer/hl7:component">
				
					<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-156| Sotto-sezione Anamnesi: l'elemento entry/organizer/component/observation/code deve avere l'attributo @codeSystem='2.16.840.1.113883.6.1'</assert>
					<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
					>ERRORE-157| Sotto-sezione Anamnesi: l'elemento entry/organizer/component/observation/statusCode deve avere l'attributo @code='completed'</assert>
					<assert test="count(hl7:observation/hl7:effectiveTime)=1"
					>ERRORE-158| Sotto-sezione Anamnesi: l'elemento entry/organizer/component/observation/effectiveTime deve essere presente </assert>
					<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
					>ERRORE-159| Sotto-sezione Anamnesi: l'elemento entry/organizer/component/observation/value deve essere presente e valorizzato secondo il @codeSystem='2.16.840.1.113883.6.103' </assert>
					<assert test="count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='35267-4']])>=1"
					>ERRORE-160| Sotto-sezione Anamnesi: l'elemento entry/organizer/component/observation deve contenere almeno una entryRelationship relativo all'Età di insorgenza. </assert>
					<assert test="count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code!='35267-4']])=1 and 
					count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='39016-1']])=1 and 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:code[@code='39016-1']]/hl7:value)=1"
					>ERRORE-161| Sotto-sezione Anamnesi: l'elemento entry/organizer/component/observation/entryRelationship/observation deve avere il code valorizzato con @code='39016-1' e deve contenere un elemento 'value'</assert>
				</rule>
			
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='11329-0']]/hl7:entry/hl7:organizer/hl7:component/hl7:observation/hl7:entryRelationship[hl7:observation/hl7:code[@code='35267-4']]">
					
					<assert test="count(hl7:observation/hl7:value)=1"
					>ERRORE-162| Sotto-sezione Anamnesi: l'elemento entry/organizer/component/observation/entryRelationship/observation deve contenere l'elemento value </assert>
				</rule>
	
			<!--Allergie (entry/act)-->	
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry">
			
				<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
				>ERRORE-163| Sezione Allergie: la sezione deve contenere un elemento entry di tipo 'act'con attributi @classCode='ACT' e @moodCode='EVN'</assert>
				<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-164| Sezione Allergie: l'elemento entry/act/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato</assert>
				<let name="status" value="hl7:act/hl7:statusCode/@code"/>
				<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
						($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
						($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
						($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
				>ERRORE-165| Sezione Allergie: l'elemento entry/act/effectiveTime/high deve essere presente nel caso in cui lo 'statusCode' sia 'completed'oppure'aborted'</assert>
				
				<!--Allergie: osservazioni allergie\intolleranze (entry/act/entryRelationship/observation)-->
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:code[@code='52473-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-166| Sezione Allergie: l'entry/act deve includere uno ed uno solo elemento entryRelationship/observation con attributo @code='52473-6'</assert>	
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:text)=0 or 
							count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:text/hl7:reference/@value)=1"
				>ERRORE-167| Sezione Allergie: l'entry/act/entryRelationship/observation/text/reference/value deve essere valorizzato con l'URI che punta alla descrizione di allarme, allergia o intolleranza nel narrative block della sezione </assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-168| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/statusCode/@code deve assumere il valore costante 'completed'</assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-169| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/effectiveTime deve essere presente e deve avere l'elemento 'low' valorizzato </assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-170| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/value deve avere l'attributo @xsi:type='CD'</assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=0 or 
							count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.4'])=1"
				>ERRORE-171| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/value codificato, deve avere l'attributo @code valorizzato secondo il value set "ObservationIntoleranceType" - @codeSystem='2.16.840.1.113883.5.4'</assert>
				<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/@code)=0 and 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1) or 
				(hl7:act/hl7:entryRelationship/count(hl7:observation/hl7:value/@code)=1 and 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:value/hl7:originalText/hl7:reference)&lt;=1)"
				>ERRORE-172| Sezione Allergie: l'elemento entry/act/entryRelationship/observation/value non codificato, deve avere l'elemento originalText/reference valorizzato, altrimenti l'elemento originalText/reference può non essere presente</assert>
				
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant)>=1"
				>ERRORE-173| Sezione Allergie: entry/act/entryRelationship/observation deve contenere almeno un elemento 'participant'</assert>				
				<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])&lt;=1)"
				>ERRORE-174| Sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/observation' relativo alla Criticità</assert>
				<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])&lt;=1)"
				>ERRORE-175| Sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/observation' relativo allo Stato dell'allergia</assert>
				<assert test="(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])&lt;=1)"
				>ERRORE-176| Sezione Allergie: entry/act/entryRelationship/observation deve contenere solo un elemento 'entryRelationship/act' relativo ai Commenti</assert>
			
			</rule>
	
				<!--Allergie: descrizione agente (entry/act/entryRelationship/observation/participant)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant">
			
					<!--Descrizione Agente Codificato-->
					<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
					count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
					count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2'])=1"
					>ERRORE-177| Sezione Allergie (descrizione agente codificato): l'elemento entry/act/entryRelationship/observation/participant/participantRole/playingEntity deve avere l'attributo code/@codeSystem valorizzato come segue:
					- '2.16.840.1.113883.6.73' codifica "WHO ATC"
					- '2.16.840.1.113883.2.9.6.1.5' codifica "AIC"
					- '2.16.840.1.113883.2.9.77.22.11.2' value set "AllergenNoDrugs" (- per le allergie non a farmaci –)
					</assert>
				</rule>
			
				<!--Allergie: descrizione reazione (entry/act/entryRelationship/observation/entryRelationship[MFST]/observation)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='MFST']">	
					<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-178| Sezione Allergie (descrizione reazione): entry/act/entryRelationship/observation/entryRelationship/observation deve avere un elemento 'code' con gli attributi @code=75321-0' e @codeSystem='2.16.840.1.113883.6.1' e @displayName='Obiettività Clinica'</assert>
					<assert test="count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
					>ERRORE-179| Sezione Allergie (descrizione reazione): entry/act/entryRelationship/observation/entryRelationship/observation deve avere un 'effectiveTime' che contiene l'elemento 'low' valorizzato </assert>
					
					<!--Descrizione Reazione Codificata-->
					<assert test="count(hl7:observation/hl7:value)=0 or	count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
					>ERRORE-180| Sezione Allergie (descrizione reazione): l'elemento entry/act/entryRelationship/observation/entryRelationship/observation/value deve avere l'attributo @xsi:type='CD'</assert>
					<assert test="count(hl7:observation/hl7:value)=0 or
								(count(hl7:observation/hl7:value/@code)=0 and count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1) or
								(count(hl7:observation/hl7:value/@code)=1 and (count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)&lt;=1))"
					>ERRORE-181| Sezione Allergie (descrizione reazione): nel caso di entry/act/entryRelationship/observation/entryRelationship/observation/value non codificato, questi deve avere l'elemento originalText/reference valorizzato</assert>
					<assert test="count(hl7:observation/hl7:value/@code)=0 or
								(count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.4'])=1 or 
								count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3'])=1 or 
								count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1)"
					>ERRORE-182| Sezione Allergie (descrizione reazione): entry/act/entryRelationship/observation/entryRelationship/observation/value deve avere l'attributo @codeSystem valorizzato come segue:
					- "2.16.840.1.113883.2.9.77.22.11.4" per le reazioni da allergia 
					- "2.16.840.1.113883.2.9.77.22.11.3" per le reazioni da intolleranza 
					- "2.16.840.1.113883.6.103" per le reazioni riportate nel sistema ICD-9-CM
					</assert>
				</rule>
			
				<!--Criticità dell'allergia o intolleranza (entry/act/entryRelationship/observation/entryRelationship[SUBJ]/observation)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation]">
					
					<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1"
					>ERRORE-183| Sezione Allergie (criticità dell'allergia o intolleranza): entry/act/entryRelationship/observation/entryRelationship/observation/code deve avere l'attributo @codesystem='2.16.840.1.113883.5.4'</assert>
					<assert test="count(hl7:observation/hl7:text)=0 or count(hl7:observation/hl7:text/hl7:reference/@value)=1"
					>ERRORE-184| Sezione Allergie (criticità dell'allergia o intolleranza): entry/act/entryRelationship/observation/entryRelationship/observation/text/reference/value deve essere valorizzato con l'URI che punta alla descrizione della severità nel narrative block della sezione </assert>	
					<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.1063'])=1"
					>ERRORE-185| Sezione Allergie (criticità dell'allergia o intolleranza): entry/act/entryRelationship/observation/entryRelationship/observation/value deve essere valorizzato secondo il value set "CriticalityObservation" @codesystem='2.16.840.1.113883.5.1063'</assert>
					
				</rule>
			
				<!--Stato dell'Allergia (entry/act/entryRelationship/observation/entryRelationship[REFR]/observation)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR']">
					
					<assert test="count(hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-186| Sezione Allergie (stato dell'allergia): entry/act/entryRelationship/observation/entryRelationship/observation/code deve avere l'attributo @code='33999-4' e @codesystem='2.16.840.1.113883.6.1'</assert>
					<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-187| Sezione Allergie (stato dell'allergia): entry/act/entryRelationship/observation/entryRelationship/observation/value deve essere valorizzato secondo il value set "StatoClinicoAllergia" (@codesystem='2.16.840.1.113883.6.1')</assert>
				</rule>
			
				<!--Allergie: commenti (entry/act/entryRelationship/observation/entryRelationship/act)-->	
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='78337-3']]/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act]">
					
					<assert test="count(hl7:act/hl7:code[@code='48767-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-188| Sezione Allergie (commenti): l'elemento entry/act/entryRelationship/observation/entryRelationship/act deve contenere l'elemento act con attributi @code='48767-8' e @codeSystem='2.16.840.1.113883.6.1'</assert>
				
				</rule>
	
		
		<!--5-->
		<!--Encounters: controllo sull'entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry">
			<assert test="count(hl7:encounter/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.51'])=1"
			>ERRORE-189| Sezione Encounters: L'elemento entry/encounters DEVE contenere l'elemento templateId valorizzato con l'atttributo @root='2.16.840.1.113883.2.9.10.1.6.51'</assert>
			<assert test="count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.4'])=1"
			>ERRORE-190| Sezione Encounters: L'elemento entry/encounters/code DEVE avere l'attributo @codeSystem valorizzato col value set TipoEncounters_VPS.</assert>
			<assert test="count(hl7:encounter/hl7:effectiveTime/hl7:low)=1 and count(hl7:encounter/hl7:effectiveTime/hl7:high)=1"
			>ERRORE-191| Sezione Encounters: L'elemento entry/encounters/effectiveTime deve essere presente e deve avere gli elementi 'low' e 'high' valorizzati.</assert>
		</rule>
		
			<!--5.1-->
			<!--Encounters: diversi participant-->		
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry/hl7:encounter/hl7:participant[@typeCode='ADM']">
				<assert test="count(hl7:participantRole/hl7:id)>=1"
				>ERRORE-192| Sezione Encounters: l'elemento entry/encounter/participant DEVE contenere almeno un participantRole</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity)=0 or 
				count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
				>ERRORE-193| Sezione Encounters: l'elemento entry/encounter/participant/participantRole/playingEntity/name DEVE contenere gli elementi 'family' e 'given'</assert>			
			</rule>
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry/hl7:encounter/hl7:participant[@typeCode='ATND']">
				<assert test="count(hl7:participantRole/hl7:id)>=1"
				>ERRORE-194| Sezione Encounters: l'elemento entry/encounter/participant DEVE contenere l'elemento patientRole caratterizzato da un id obbligatorio</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity)=0 or 
				count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
				>ERRORE-195| Sezione Encounters: l'elemento entry/encounter/participant/participantRole/playingEntity/name DEVE contenere gli elementi 'family' e 'given'</assert>
			</rule>
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry/hl7:encounter/hl7:participant[@typeCode='DIS']">
				<assert test="count(hl7:participantRole/hl7:id)>=1"
				>ERRORE-196| Sezione Encounters: l'elemento entry/encounter/participant DEVE contenere l'elemento participantRole caratterizzato da un id obbligatorio</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity)=0 or 
				count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
				>ERRORE-197| Sezione Encounters: l'elemento entry/encounter/participant/participantRole/playingEntity/name DEVE contenere gli elementi 'family' e 'given'</assert>			
			</rule>
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry/hl7:encounter/hl7:participant[@typeCode='LOC']">
				<assert test="count(hl7:participantRole/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.64'])=1"
				>ERRORE-198| Sezione Encounters: l'elemento entry/encounter/participant/participantRole DEVE contenere l'elemento templateId valorizzato dall'attributo @root='2.16.840.1.113883.2.9.10.1.6.64'</assert>						
				<assert test="count(hl7:participantRole/hl7:code)=0 or count(hl7:participantRole/hl7:code[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.10'])=1"
				>ERRORE-199| Sezione Encounters: l'elemento entry/encounter/participant/participant/participantRole/code deve essere valorizzato secondo il value set "TipoLuogo_VPS" - @codeSystem='2.16.840.1.113883.2.9.1.11.1.2.10'</assert>
			</rule>
			
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry/hl7:encounter/hl7:entryRelationship">
				<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
				>ERRORE-200| Sezione Encounters: l'elemento act DEVE essere valorizzato con gli attributi @classCode='ACT' e @moodCode='EVN'.</assert>
				<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.47'])=1"
				>ERRORE-201| Sezione Encounters: l'elemento entry/encounter/entryRelationship/act DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.47'.</assert>
				<assert test="count(hl7:act/hl7:code[@code='48767-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-202| Sezione Encounters: l'elemento entry/encounter/entryRelationship/act/code DEVE essere valorizzato con gli attributi @code='48767-8' e @codeSystem='2.16.840.1.113883.6.1'</assert>
				
			</rule>
			
		<!--6-->
		<!--Decorso Ospedaliero: controllo sull'author-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8648-8']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-203| Sezione Decorso Ospedaliero: l'elemento author/assignedAuthor/assignedPerson/name deve contenere i sotto elementi 'given' e 'family'</assert>
		
		</rule>
		
		<!--7-->
		<!--Complicanze: controllo entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='55109-3']]/hl7:entry">
			<assert test="count(hl7:observation/hl7:code[@code='75326-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-204| Sezione Complicanze: l'elemento entry/observation/code DEVE essere valorizzato con gli attributi @code='75326-9' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-205| Sezione Complicanze: l'elemento entry/observation/value DEVE essere valorizzato con l'attributo @xsi:type=CD.</assert>
		</rule>

		<!--8-->
		<!--Interventi Prestazioni Consulenze e Richieste: controllo entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:entry">
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1 or count(hl7:act[@classCode='ACT'][@moodCode='RQO'])=1"
			>ERRORE-206| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento act DEVE essere valorizzato con gli attributi @classCode='ACT' e @moodCode='EVN' o @moodCode='RQO' </assert>
			<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.62'])=1"
			>ERRORE-207| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento entry/act DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.62'.</assert>
			<assert test="count(hl7:act/hl7:code[@code='76645-1'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-208| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento entry/act/code DEVE essere valorizzato con gli attributi @code='76645-1' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:act/hl7:statusCode[@code='completed'])=1 or count(hl7:observation/hl7:statusCode[@code='aborted'])=1"
			>ERRORE-209| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento entry/act DEVE contenere un elemento statusCode valorizzato con l'attributo @code='completed' o @code='aborted'.  </assert>			
			<assert test="count(hl7:act/hl7:participant)=0 or (count(hl7:act/hl7:participant[@typeCode='REF']))>=1"
			>ERRORE-210| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento entry/act/participant se presente DEVE contenere l'attributo @typeCode='REF'.</assert>	
		</rule>
			<!--8.1-->
			<!--performer-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:entry/hl7:act/hl7:performer">
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1"
				>ERRORE-211| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento entry/act/performer/assignedEntity/assignedPerson/name se presente DEVE contenere gli elementi 'given' e 'family' .</assert>
			</rule>
			<!--8.2-->
			<!--participant-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='62387-6']]/hl7:entry/hl7:act/hl7:participant">		
				<assert test="(count(hl7:participantRole/hl7:id)&gt;=1)"
				>ERRORE-212| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento entry/act/participant DEVE contenere almeno un elemento participantRole/id.</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1"
				>ERRORE-213| Sezione Interventi Prestazioni Consulenze e Richieste: l'elemento entry/act/participant/participant/playingEntity/name DEVE contenere gli elementi 'family' e 'given' .</assert>		
			</rule>
			
		<!--9-->
		<!--Accertamenti: controllo entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry">
			<assert test="count(hl7:organizer[@classCode='BATTERY'][@moodCode='EVN'])=1"
			>ERRORE-214| Sezione Accertamenti:  l'elemento organizer DEVE essere valorizzato con gli attributi @classCode='BATTERY' e @moodCode='EVN'</assert>
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.45'])=1"
			>ERRORE-215| Sezione Accertamenti: l'elemento entry/organizer DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.45'</assert>
			<assert test="count(hl7:organizer/hl7:statusCode[@code='completed'])=1"
			>ERRORE-216| Sezione Accertamenti: l'elemento entry/organizer DEVE contenere un elemento statusCode valorizzato con l'attributo @code='completed'</assert>	
			<assert test="count(hl7:organizer/hl7:participant)=0 or (count(hl7:organizer/hl7:participant[@typeCode='REF']))>=1"
			>ERRORE-217| Sezione Accertamenti: l'elemento entry/act/participant se presente DEVE contenere l'attributo @typeCode='REF'</assert>
		</rule>
		
			<!--9.1-->
			<!--performer-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry/hl7:organizer/hl7:performer">
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1"
				>ERRORE-218| Sezione Accertamenti: l'elemento entry/organizer/performer/assignedEntity/assignedPerson/name DEVE contenere gli elementi 'given' e 'family'.</assert>
			</rule>
			<!--9.2-->
			<!--participant-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry/hl7:organizer/hl7:participant">	
				<assert test="(count(hl7:participantRole/hl7:id)&gt;=1)"
				>ERRORE-219| Sezione Accertamenti: l'elemento entry/organizer/participant se presente DEVE contenere almeno un elemento participantRole/id</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
				>ERRORE-220| Sezione Accertamenti: l'elemento entry/organizer/participant/playingEntity/name DEVE contenere gli elementi 'given' e 'family' </assert>		
			</rule>	
			<!--9.3-->	
			<!--component-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry/hl7:organizer/hl7:component">	
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.46'])=1"
				>ERRORE-221| Sezione Accertamenti: l'elemento entry/organizer/component/observation/templateId DEVE essere valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.46'</assert>
				<assert test="count(hl7:observation/hl7:code[@code='86524-6'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-222| Sezione Accertamenti: l'elemento entry/organizer/component/observation/code DEVE essere valorizzato con gli attributi @code='86524-6' e @codeSystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-223| Sezione Accertamenti: l'elemento entry/organizer/component/observation DEVE contenere un elemento statusCode valorizzato con l'attributo @code='completed'</assert>			
				<assert test="count(hl7:observation/hl7:effectiveTime)=1"
				>ERRORE-224| Sezione Accertamenti: l'elemento entry/organizer/component/observation/effectiveTime DEVE essere presente </assert>
			</rule>
		
		<!--10-->
		<!--Parametri Vitali: controllo entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry">
			<assert test="count(hl7:organizer[@classCode='CLUSTER'][@moodCode='EVN'])=1"
			>ERRORE-225| Sezione Parametri Vitali: l'elemento organizer DEVE essere valorizzato con gli attributi @classCode='CLUSTER' e @moodCode='EVN'.</assert>
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.90'])=1"
			>ERRORE-226| Sezione Parametri Vitali: l'elemento entry/organizer/templateId DEVE essere valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.90'.</assert> 
			<assert test="count(hl7:organizer/hl7:code)=0 or count(hl7:organizer/hl7:code[@code='85353-1'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-227| Sezione Parametri Vitali: l'elemento entry/organizer/code DEVE essere valorizzato con gli attributi @code='85353-1' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:organizer/hl7:statusCode[@code='completed'])=1"
			>ERRORE-228| Sezione Parametri vitali: l'elemento entry/organizer DEVE contenere un elemento statusCode valorizzato con l'attributo @code='completed'.</assert>						
			<assert test="count(hl7:organizer/hl7:component[hl7:observation])>=1"
			>ERRORE-229| Sezione Parametri vitali: l'elemento entry/organizer DEVE contenere almeno un elemento 'component' di tipo 'observation'</assert>
		</rule>	
			<!--10.1-->
			<!--component-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry/hl7:organizer/hl7:component">
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.91'])=1"
				>ERRORE-230| Sezione Parametri Vitali: l'elemento entry/organizer/component/observation/templateId DEVE essere valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.91'</assert> 
				<assert test="count(hl7:observation/hl7:code[@code='86678-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-231| Sezione Parametri Vitali: l'elemento entry/organizer/component/observation/code DEVE essere valorizzato con gli attributi @code='86678-0' e @codeSystem='2.16.840.1.113883.6.1'</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-232| Sezione Parametri Vitali: l'elemento entry/organizer/component/observation DEVE contenere un elemento statusCode valorizzato con l'attributo @code='completed'</assert>		
				<assert test="count(hl7:observation/hl7:value)=1"
				>ERRORE-233| Sezione Parametri Vitali: l'elemento entry/organizer/component/observation DEVE contenere un elemento 'value'</assert>
				<assert test="count(hl7:observation/hl7:participant)=0 or (count(hl7:observation/hl7:participant[@typeCode='REF']))>=1"
				>ERRORE-234| Sezione Parametri Vitali: l'elemento entry/organizer/component/observation/participant se presente, DEVE contenere l'attributo @typeCode='REF'</assert>
			</rule>
			<!--10.2-->
			<!--performer-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry/hl7:organizer/hl7:component/hl7:observation/hl7:performer">
				<assert test="count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1"
				>ERRORE-235| Sezione Parametri Vitali: l'elemento  entry/organizer/component/observation/performer/assignedEntity/assignedPerson/name DEVE contenere gli elementi 'given' e 'family' .</assert>
			</rule>
			<!--10.3-->
				<!--participant-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry/hl7:organizer/hl7:component/hl7:observation/hl7:participant">
				<assert test="(count(hl7:participantRole/hl7:id)&gt;=1)"
				>ERRORE-236| Sezione Parametri Vitali: l'elemento  entry/organizer/component/observation/participant DEVE contenere almeno un elemento participantRole/id</assert>
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1"
				>ERRORE-237| Sezione Parametri Vitali: l'elemento  entry/organizer/component/observation/participant/playingEntity/name DEVE contenere gli elementi 'given' e 'family' </assert>		
			</rule>
		
	
			<!--11-->
			<!--Terapia Farmacologica in Pronto Soccorso: controllo sulle entry-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29549-3']]/hl7:entry">
				
				<assert test="count(hl7:substanceAdministration[@classCode='SBADM'][@moodCode='EVN'])=1"
				>ERRORE-238| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration DEVE avere valorizzati gli attributi @classCode='SBADM' e @moodCode='EVN'</assert>
				<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.52'])=1"
				>ERRORE-239| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration DEVE contenere l'elemento 'templateId' con attributo @root='2.16.840.1.113883.2.9.10.1.6.52'</assert>
				<assert test="count(hl7:substanceAdministration/hl7:statusCode[@code='completed'])=1"
				>ERRORE-240| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration deve contenere un elemento 'statusCode' con attributo @code='completed'</assert>
				<assert test="count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1 and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1"
				>ERRORE-241| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration/effectiveTime deve avere l'elemento 'low' valorizzato</assert>
				<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.53'])=1"
				>ERRORE-242| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration/consumable/manufacturedProduct deve contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.6.53'</assert>
				<let name="farma" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
				<assert test="count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or count($farma/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1"
				>ERRORE-243| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial deve contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
				- @codeSystem='2.16.840.1.113883.2.9.6.1.5' (AIC)
				- @codeSystem='2.16.840.1.113883.6.73' (ATC)
				</assert>
				
				<!--Controllo incrociato tra code e translation-->
				<assert test="(count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation)=0 or 
				count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1) and
				(count($farma/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation)=0 or
				count($farma/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1)"
				>ERRORE-244| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation deve essere valorizzato secondo i seguenti sistemi di codifica:
				- @codeSystem='2.16.840.1.113883.2.9.6.1.5' (AIC)
				- @codeSystem='2.16.840.1.113883.6.73' (ATC)</assert>
				<assert test="count(hl7:substanceAdministration/hl7:participant)=0 or (count(hl7:substanceAdministration/hl7:participant[@typeCode='REF']))>=1"
				>ERRORE-245| Sezione Terapia Farmacologica in Pronto Soccorso: l'elementoentry/substanceAdministration/participant se presente, DEVE contenere l'attributo @typeCode='REF'</assert>
			</rule>
				
				<!--Terapia Farmacologica in Pronto Soccorso: performer (entry/substanceAdministration/performer)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29549-3']]/hl7:entry/hl7:substanceAdministration/hl7:performer">
					
					<assert test="(count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and count(hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
					>ERRORE-246| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration/performer/assignedEntity/assignedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
				</rule>
				
				<!--Terapia Farmacologica in Pronto Soccorso: participant (entry/substanceAdministration/participant)-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29549-3']]/hl7:entry/hl7:substanceAdministration/hl7:participant">
					
					<assert test="count(hl7:participantRole/hl7:id)>=1"
					>ERRORE-247| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration/participant/participantRole deve contenere almeno un elemento 'id'</assert>
					<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1 and 
					count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1"
					>ERRORE-248| Sezione Terapia Farmacologica in Pronto Soccorso: l'elemento entry/substanceAdministration/participant/participantRole/name deve contenere gli elementi 'given' e 'family'</assert>
				</rule>
				
				<!--Terapia farmacologica in Pronto Soccorso: controllo sotto-elementi di entryRelationship-->
				<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29549-3']]/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship">
					
					<assert test="count(hl7:observation)=1 or count(hl7:supply)=1"
					>ERRORE-249| Sezione Terapia farmacologica in Pronto Soccorso: entry/substanceAdministration/entryRelationship  deve contenere un elemento di tipo "observation" o "supply" </assert>
				</rule>
				
				
		<!--12.1.1-->
		<!--Dimissione: controlli sulle entryRelationship "Encounter Post Dimissione" (entry/act/entryRelationship/encounter)-->			
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act[hl7:code[@code='dimissione']]/hl7:entryRelationship[hl7:encounter]">
			
			<assert test="count(hl7:encounter/@classCode)=1"				
			>ERRORE-250| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter deve avere l'attributo '@classCode' </assert>
			<assert test="count(hl7:encounter/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.67'])=1"				
			>ERRORE-251| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter deve contenere l'elemento 'templateId' con attributo @root='2.16.840.1.113883.2.9.10.1.6.67' </assert>
			<assert test="count(hl7:encounter/hl7:id)=1"				
			>ERRORE-252| Sezione Dimissione - "Encounter Post Dimissione":l'elemento entry/act/entryRelationship/encounter deve contenere l'elemento 'id'</assert>			
			<assert test="count(hl7:encounter/hl7:code)=0 or count(hl7:encounter/hl7:code[@code='IMP'][@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.9'])=1"	
			>ERRORE-253| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/code se presente, deve contenere gli attributi @code='IMP' e @codeSystem='2.16.840.1.113883.2.9.1.11.1.2.9' </assert>
			<assert test="count(hl7:encounter/hl7:effectiveTime)=1"
			>ERRORE-254| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter deve contenere l'elemento 'effectiveTime' </assert>
			<!--participant "Collocazione paziente post dimissione" -->
			<assert test="count(hl7:encounter/hl7:participant)=0 or count(hl7:encounter/hl7:participant[@typeCode='LOC'])>=1"
			>ERRORE-255| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/participant se presente, deve essere avere attributo @typeCode='LOC' </assert>
			<!--entryRelationship "Ragione" -->
			<assert test="count(hl7:encounter/hl7:entryRelationship)=0 or count(hl7:encounter/hl7:entryRelationship[@typeCode='RSON'])>=1"
			>ERRORE-256| Sezione Dimissione - "Encounter Post Dimissione":  l'elemento entry/act/entryRelationship/encounter/entryRelationship se presente, deve avere attributo @typeCode='RSON' </assert>
		</rule>
			
			<!--Dimissione-EncounterPostDimissione: controlli sui participant "Collocazione paziente post dimissione" (entry/act/entryRelationship/encounter/participant)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act[hl7:code[@code='dimissione']]/hl7:entryRelationship/hl7:encounter/hl7:participant">			
				
				<assert test="count(hl7:participantRole/@classCode)=0 or count(hl7:participantRole[@classCode='SDLOC'])=1"
				>ERRORE-257| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/participant/participantRole, se presenta l'attibuto @classCode deve essere valorizzato con 'SDLOC'</assert>
				<assert test="count(hl7:participantRole/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.64'])=1"
				>ERRORE-258| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/participant/participantRole deve contenere l'elemento templateId con attributo @root='2.16.840.1.113883.2.9.10.1.6.64' </assert>
				<assert test="count(hl7:participantRole/hl7:code)=0 or count(hl7:participantRole/hl7:code[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.11'])=1"
				>ERRORE-259| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/participant/participantRole/code se presente, deve essere valorizzato con l'attributo @codeSystem='2.16.840.1.113883.2.9.1.11.1.2.11' </assert>
			</rule>
			
			<!--Dimissione-EncounterPostDimissione: controlli sugli entryRelationship "Ragione" (entry/act/entryRelationship/encounter/entryRelationship) -->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act[hl7:code[@code='dimissione']]/hl7:entryRelationship/hl7:encounter/hl7:entryRelationship">			
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.68'])=1"
				>ERRORE-260| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/entryRelationship/observation deve contenere l'elemento 'templateId' con attributo @root='2.16.840.1.113883.2.9.10.1.6.68' </assert>
				<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.13'])=1"
				>ERRORE-261| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/entryRelationship/observation deve contenere l'elemento 'code' con attributo @codeSystem='2.16.840.1.113883.2.9.1.11.1.2.13'</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-262| Sezione Dimissione - "Encounter Post Dimissione": l'elemento entry/act/entryRelationship/encounter/entryRelationship/observation deve contenere l'elemento 'statusCode' con attributo @code='completed' </assert>
			</rule>
			
		<!--12.1.2-->	
		<!--Dimissione: controlli sulle entryRelationship "Trasferimento post Dimissione" (entry/act/entryRelationship/act)-->			
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act[hl7:code[@code='dimissione']]/hl7:entryRelationship[hl7:act]">
			
			<assert test="count(hl7:act[@classCode='TRNS'])=1"				
			>ERRORE-263| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act deve avere l'attributo @classCode='TRNS'</assert>
			<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.92'])=1"				
			>ERRORE-264| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act deve contenere l'elemento templateId con attributo @root='2.16.840.1.113883.2.9.10.1.6.92'  </assert>			
			<assert test="count(hl7:act/hl7:effectiveTime)=1"	
			>ERRORE-265| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act deve contenere l'elemento 'effectiveTime'</assert>
			<!--participant "Collocazione paziente post dimissione" -->
			<assert test="count(hl7:act/hl7:participant)=0 or count(hl7:act/hl7:participant[@typeCode='LOC'])>=1"
			>ERRORE-266| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act/participant se presente, deve avere l'attributo @typeCode='LOC'</assert>
			<!--entryRelationship "Ragione" -->
			<assert test="count(hl7:act/hl7:entryRelationship)=0 or count(hl7:act/hl7:entryRelationship[@typeCode='RSON'])>=1"
			>ERRORE-267| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act/entryRelationship se presente, deve avere l'attributo @typeCode='RSON'</assert>
		</rule>
		
			<!--Dimissione- TrasferimentoPostDimissione: controlli sui 'participant' "Collocazione paziente post dimissione" (entry/act/entryRelationship/act/participant)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act[hl7:code[@code='dimissione']]/hl7:entryRelationship/hl7:act/hl7:participant">			
				<assert test="count(hl7:participantRole/@classCode)=0 or count(hl7:participantRole[@classCode='SDLOC'])=1"
				>ERRORE-268| Sezione Dimissione - "Trasferimento post dimissione": l'attributo @classCode di entry/act/entryRelationship/act/participant/participantRole se presente, deve essere valorizzato con 'SDLOC'</assert>
				<assert test="count(hl7:participantRole/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.64'])=1"
				>ERRORE-269| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act/participant/participantRole deve contenere l'elemento 'templateId' con attributo @root='2.16.840.1.113883.2.9.10.1.6.64'</assert>
				<assert test="count(hl7:participantRole/hl7:code)=0 or count(hl7:participantRole/hl7:code[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.11'])=1"
				>ERRORE-270| Sezione Dimissione - "Trasferimento post dimissione":  l'elemento entry/act/entryRelationship/act/participant/participantRole/code se presente, deve avere l'attributo @codeSystem='2.16.840.1.113883.2.9.1.11.1.2.11'</assert>
			</rule>
		
			<!--Dimissione- TrasferimentoPostDimissione: controlli sugli 'entryRelationship' "Ragione" (entry/act/entryRelationship/act/entryRelationship/observation) -->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act[hl7:code[@code='dimissione']]/hl7:entryRelationship/hl7:act/hl7:entryRelationship">			
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.68'])=1"
				>ERRORE-271| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act/entryRelationship/observation deve contenere l'elemento 'templateId' con attributo @root='2.16.840.1.113883.2.9.10.1.6.68'</assert>
				<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.2.9.1.11.1.2.13'])=1"
				>ERRORE-272| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act/entryRelationship/observation deve contenere l'elemento 'code' con attributo @codeSystem='2.16.840.1.113883.2.9.1.11.1.2.13'</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-273| Sezione Dimissione - "Trasferimento post dimissione": l'elemento entry/act/entryRelationship/act/entryRelationship/observation deve contenere l'elemento 'statusCode' con attributo @code='completed'</assert>
			</rule>
		
		<!--12.1.3-->
		<!--Dimissione: controlli sulle entryRelationship "Diagnosi di Dimissione" (entry/act/entryRelationship/observation)-->			
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='28574-2']]/hl7:entry/hl7:act[hl7:code[@code='dimissione']]/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.70']]">
			<assert test="count(hl7:observation/hl7:code[@code='29308-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"	
			>ERRORE-274| Sezione Dimissione - "Diagnosi di Dimissione": l'elemento entry/act/entryRelationship/observation deve contenere l'elemento 'code' con attributi @code='29308-4' e @codeSystem='2.16.840.1.113883.6.1'</assert>
			<!--participant "Collocazione paziente post dimissione"-->
			<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
			>ERRORE-275| Sezione Dimissione - "Diagnosi di Dimissione": l'elemento entry/act/entryRelationship/observation deve contenere l'elemento 'statusCode' con attributo @code='completed'</assert>
			<!--entryRelationship "Ragione"-->
			<assert test="count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.6.103'])=1"
			>ERRORE-276| Sezione Dimissione - "Diagnosi di Dimissione": l'elemento entry/act/entryRelationship/observation deve contenere l'elemento 'value' con attributo @codeSystem='2.16.840.1.113883.6.103'</assert>
		</rule>
		
		
		
		<!--Sezione Piano di cura alla dimissione: controllo entry-->
					
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:entry">
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='INT'])=1"
			>ERRORE-277| Sezione Piano di cura alla dimissione: l'elemento entry/act deve avere attributi @classCode='ACT' e @moodCode='INT'</assert>
			<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.62'])=1"
			>ERRORE-278| Sezione Piano di cura alla dimissione: l'elemento entry/act deve contenere un elemento templateId con attributo @root='2.16.840.1.113883.2.9.10.1.6.62'</assert>
			<assert test="count(hl7:act/hl7:statusCode[@code='active'])=1"
			>ERRORE-279| Sezione Piano di cura alla dimissione: l'elemento entry/act deve contenere un elemento statusCode con attributo @code='active'</assert>
			<assert test="count(hl7:act/hl7:reference)=0 or (count(hl7:act/hl7:reference/hl7:externalAct/@moodCode)=1 and 
			count(hl7:act/hl7:reference/hl7:externalAct/@classCode)=1)"
			>ERRORE-280| Sezione Piano di cura alla dimissione: l'elemento entry/act/reference se presente deve contenere un elemento 'externalAct' con attributi @classCode='ACT' e @moodCode='EVN'</assert>
			<assert test="count(hl7:act/hl7:reference)=0 or (count(hl7:act/hl7:reference/hl7:externalAct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.89'])=1)"
			>ERRORE-281| Sezione Piano di cura alla dimissione: l'elemento entry/act/reference/externalAct deve contenere un elemento 'templateId' con attributo @root='2.16.840.1.113883.2.9.10.1.6.89'</assert>
			<assert test="count(hl7:act/hl7:reference)=0 or (count(hl7:act/hl7:reference/hl7:externalAct/hl7:id[@root='2.16.840.1.113883.2.9.4.3.9'])=1)"
			>ERRORE-282| Sezione Piano di cura alla dimissione: l'elemento entry/act/reference/externalAct deve contenere un elemento 'id' con attributo @root='2.16.840.1.113883.2.9.4.3.9'</assert>

		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or 
			(count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1)"
			>ERRORE-283| Sezione Piano di cura alla dimissione: l'elemento author/assignedAuthor/assignedPerson/name deve contenere i sotto-elementi 'given' e 'family' </assert>		
				
		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:entry/hl7:act/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1"
			>ERRORE-284| Sezione Piano di cura alla dimissione: l'elemento entry/act/author/assignedAuthor/assignedPerson deve contenere l'elemento name con i sotto-elementi 'given' e 'family'</assert>		
		</rule>	
	

	
		
		<!--Terapia farmacologica alla dimissione-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='75311-1']]/hl7:author">
			<assert test="count(hl7:assignedAuthor/hl7:assignedPerson)=0 or 
			count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:family)=1 and count(hl7:assignedAuthor/hl7:assignedPerson/hl7:name/hl7:given)=1"
			>ERRORE-285| Sezione Terapia Farmacologica alla dimissione: l'elemento author/assignedAuthor/assignedPerson/name DEVE contenere gli elementi family e given</assert>
		</rule>		
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='75311-1']]/hl7:entry">
			
			<assert test="count(hl7:substanceAdministration/@classCode)=1 and count(hl7:substanceAdministration[@moodCode='INT'])=1"
			>ERRORE-286| Sezione Terapia Farmacologica alla dimissione: se presente entry deve avere l'elemento "substanceAdministration" con gli attributi "classCode=SBADM"e "moodCode=INT"</assert>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.52'])=1"
			>ERRORE-287| Sezione Terapia Farmacologica alla dimissione: entry/substanceAdministration deve contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.52'</assert>
			<assert test="count(hl7:substanceAdministration/hl7:statusCode[@code='active'])=1"
			>ERRORE-288| Sezione Terapia Farmacologica alla dimissione: entry/substanceAdministration deve contenere un elemento statusCode valorizzato con l'attributo @code='active'</assert>	
			<assert test="count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1"
			>ERRORE-289|Sezione Terapia farmacologica alla dimissione: entry/substanceAdministration/effectiveTime deve avere l'elemento 'low' valorizzato </assert>
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.53'])=1"
			>ERRORE-290| Sezione Terapia farmacologica alla dimissione: entry/substanceAdministration/consumable/manufacturedProduct DEVE contenere l'elemento templateId valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.6.53'</assert>
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or 
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1"
			>ERRORE-291|Sezione Terapia farmacologica alla dimissione: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code DEVE avere l'attributo "@codeSystem" valorizzato come segue:
			- '2.16.840.1.113883.2.9.6.1.5' codifica "AIC"
			- '2.16.840.1.113883.6.73' codifica "WHO ATC" 
			- '2.16.840.1.113883.2.9.6.1.51' codifica "GE"
			</assert>
			<let name="farma" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code"/>
			<assert test="count($farma/hl7:translation)=0 or count($farma/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or count($farma/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1 or
			count($farma/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1"
			>ERRORE-292| Sezione Terapia farmacologica alla dimissione: l'elemento entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation DEVE avere l'attributo "@codeSystem" valorizzato come segue: 
			- '2.16.840.1.113883.2.9.6.1.5'  codifica "AIC"
			- '2.16.840.1.113883.6.73'  codifica "WHO ATC" 
			- '2.16.840.1.113883.2.9.6.1.51'  codifica "GE"		
			</assert>			
			<assert test="count(hl7:substanceAdministration/hl7:participant)=0 or count(hl7:substanceAdministration/hl7:participant[@typeCode='REF'])=1"
			>ERRORE-293| Sezione Terapia Farmacologica alla dimissione: se presente entry/substanceAdministration deve contenere l'elemento "participant" con attributo @typeCode='REF'</assert>
						
					
			<assert test="count(hl7:substanceAdministration/hl7:reference)=0 or count(hl7:substanceAdministration/hl7:reference[@typeCode='REFR'])=1"
			>ERRORE-294| Sezione Terapia farmacologica alla dimissione: se presente entry/substanceAdministration/reference, DEVE contenere attributo @typeCode='REFR'</assert>	
		
		</rule>	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='75311-1']]/hl7:entry/hl7:substanceAdministration/hl7:participant">
			<assert test="count(hl7:participantRole/hl7:id)&gt;=1"
			>ERRORE-295| Sezione Terapia Farmacologica alla dimissione: se presente entry/substanceAdministration/participant, DEVE contenere almeno un elemento participantRole/id </assert>
			<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:given)=1 and count(hl7:participantRole/hl7:playingEntity/hl7:name/hl7:family)=1"
			>ERRORE-296| Sezione Terapia Farmacologica alla dimissione: se presente entry/substanceAdministration/participant, DEVE contenere l'elemento participant/playingEntity/name</assert>
		</rule>
		
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='75311-1']]/hl7:entry/hl7:substanceAdministration/hl7:reference">
			<assert test="count(hl7:externalAct/@classCode)=1"
			>ERRORE-297| Sezione Terapia farmacologica alla dimissione: entry/substanceAdministration/reference/externalAct deve avere l'attributo @classCode</assert>
			<assert test="count(hl7:externalAct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.6.89'])=1"
			>ERRORE-298| Sezione Terapia farmacologica alla dimissione: l'elemento entry/substanceAdministration/reference/externalAct/templateId DEVE avere l'attributo @root='2.16.840.1.113883.2.9.10.1.6.89' </assert>
			<assert test="count(hl7:externalAct/hl7:id[@root='2.16.840.1.113883.2.9.4.3.9'])=1"
			>ERRORE-299| Sezione Terapia farmacologica alla dimissione. l'elemento entry/substanceAdministration/reference/externalAct/id DEVE esssere valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.9'.</assert>
		
		</rule>
		
	</pattern>
</schema>