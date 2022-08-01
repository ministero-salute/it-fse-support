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
			<assert test="count(hl7:realmCode)>=1 and count(hl7:realmCode[@code='IT'])= 1"
			>ERRORE-1| L'elemento <name/> DEVE avere almeno un elemento 'realmCode', il cui attributo @code deve essere valorizzato con 'IT'</assert>
			
			<!--Controllo templateId-->
			<assert test="count(hl7:templateId)>=1"
			>ERRORE-2| L'elemento <name/> DEVE avere almeno un elemento di tipo 'templateId'</assert>
			<assert test="count(hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.1.1'])= 1 and  count(hl7:templateId/@extension)= 1"
			>ERRORE-3| Almeno un elemento <name/>/templateId DEVE essere valorizzato attraverso l'attributo @root='2.16.840.1.113883.2.9.10.1.4.1.1', associato all'attributo @extension che  indica la versione a cui il templateId fa riferimento</assert>
			
			<!--Controllo code-->	
			<assert test="count(hl7:code[@code='60591-5'][@codeSystem='2.16.840.1.113883.6.1']) = 1"
			>ERRORE-4| L'elemento <name/>/code DEVE essere valorizzato con l'attributo @code='60591-5' e il @codeSystem='2.16.840.1.113883.6.1'</assert>
			
			<report test="not(count(hl7:code[@codeSystemName='LOINC'])=1) or not(count(hl7:code[@displayName='Profilo Sanitario Sintetico'])=1 or
			count(hl7:code[@displayName='PROFILO SANITARIO SINTETICO'])=1 or count(hl7:code[@displayName='Profilo sanitario sintetico'])=1)"
			>W001| Si raccomanda di valorizzare gli attributi dell'elemento <name/>/code nel seguente modo: @codeSystemName ='LOINC' e @displayName ='Profilo Sanitario Sintetico'.--> </report>
			
			<!--Controllo confidentialityCode-->
			<assert test="(count(hl7:confidentialityCode[@code='N'][@codeSystem='2.16.840.1.113883.5.25'])= 1) or 
			(count(hl7:confidentialityCode[@code='V'][@codeSystem='2.16.840.1.113883.5.25'])= 1)"
			>ERRORE-5| L'elemento <name/>/confidentialityCode DEVE avere l'attributo @code valorizzato con 'N' o 'V', e il @codeSystem='2.16.840.1.113883.5.25'</assert>
			
			<!--Controllo languageCode-->	
			<assert test="count(hl7:languageCode)=1"
			>ERRORE-6| L'elemento <name/> DEVE contenere un elemento 'languageCode' </assert>
			
			<!--Controllo incrociato tra setId-versionNumber e relatedDocument-->
			<let name="versionNumber" value="hl7:versionNumber/@value"/>
			<assert test="(string(number($versionNumber)) = 'NaN') or
					($versionNumber= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension = hl7:setId/@extension) or
					($versionNumber!= '1' and hl7:id/@root = hl7:setId/@root and hl7:id/@extension != hl7:setId/@extension) or
					(hl7:id/@root != hl7:setId/@root)"
			>ERRORE-7| Se ClinicalDocument.id e ClinicalDocument.setId usano lo stesso dominio di identificazione (@root identico) allora l’attributo @extension del ClinicalDocument.id 
			deve essere diverso da quello del ClinicalDocument.setId a meno che ClinicalDocument.versionNumber non sia uguale ad 1; cioè i valori di setId ed id per un documento clinico possono coincidere solo per la prima versione di un documento</assert>
			
			<assert test="(string(number($versionNumber)) ='NaN') or
						  ($versionNumber=1) or 
						  (($versionNumber &gt;1) and count(hl7:relatedDocument)=1)"
			>ERRORE-8| Se l'attributo <name/>/versionNumber/@value è maggiore di 1, l'elemento <name/> DEVE contenere un elemento di tipo 'relatedDocument'</assert>
			
			<!--Controllo recordTarget-->
			<assert test="count(hl7:recordTarget)=1"
			>ERRORE-9| L'elemento <name/> DEVE contenere un solo elemento 'recordTarget' </assert>
			
			<!--report test="not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1) and
			not(count(hl7:recordTarget/hl7:patientRole/hl7:id[@root='2.16.840.1.113883.2.9.4.3.15'])=1)"
			>W002| Si consiglia di valorizzare l'elemento <name/>recordTarget/patientRole/id  con una  delle seguenti informazioni:
			CF:2.16.840.1.113883.2.9.4.3.2
			ANA: 2.16.840.1.113883.2.9.4.3.15 .>
			</report-->
			
			<!--Controllo recordTarget/patientRole/addr-->
			<let name="num_addr" value="count(hl7:recordTarget/hl7:patientRole/hl7:addr)"/>
			
			<assert test="$num_addr=0 or (count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:country)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:city)=$num_addr and 
			count(hl7:recordTarget/hl7:patientRole/hl7:addr/hl7:streetAddressLine)=$num_addr)"
			>ERRORE-10| L'elemento <name/>/recordTarget/patientRole/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<!--Controllo recordTarget/patientRole/patient-->
			<let name="patient" value="hl7:recordTarget/hl7:patientRole/hl7:patient"/>
			
			<assert test="count($patient)=1"
			>ERRORE-11| L'elemento <name/>/recordTaget/patientRole DEVE contenere l'elemento 'patient'</assert>
			<assert test="(count($patient/hl7:name/hl7:given)=1 and count($patient/hl7:name/hl7:family)=1)"
			>ERRORE-12| L'elemento <name/>/recordTaget/patientRole/patient/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			<!--Controllo recordTarget/patientRole/patient/administrativeGenderCode-->
			<let name="genderOID" value="hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode/@codeSystem"/>
			
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:administrativeGenderCode)=1"
			>ERRORE-13| L'attributo <name/>/recordTarget/patientRole/patient DEVE contenere l'elemento administrativeGenderCode </assert>
			<assert test="$genderOID='2.16.840.1.113883.5.1'"
			>ERRORE-14| L'OID assegnato all'attributo <name/>/recordTarget/patientRole/patient/administrativeGenderCode/@codeSystem='<value-of select="$genderOID"/>' non è corretto. L'attributo DEVE essere valorizzato con '2.16.840.1.113883.5.1' </assert>
			
			<!--Controllo recordTarget/patientRole/patient/birthTime-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthTime)=1"
			>ERRORE-15| L'elemento <name/>/recordTarget/patientRole/patient DEVE contenere l'elemento birthTime </assert>	
			
			<!--Controllo recordTarget/patientRole/patient/birthplace/place/addr-->
			<assert test="count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace)=0 or 
			count(hl7:recordTarget/hl7:patientRole/hl7:patient/hl7:birthplace/hl7:place/hl7:addr)=1"
			>ERRORE-16| L'elemento <name/>/recordTarget/patientRole/patient/birthplace DEVE contenere un elemento place/addr </assert>	
			
			<!--Controllo author/assignedAuthor/id-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-17| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'id' con il relativo attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<!--Controllo author/assignedAuthor/code-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:code)=0 or 
			count(hl7:author/hl7:assignedAuthor/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.13'])=1"
			>ERRORE-18| L'elemento <name/>/author/assignedAuthor/code DEVE essere valorizzato secondo il value set "assignedAuthorCode_PSSIT" - @codeSystem='2.16.840.1.113883.2.9.77.22.11.13'</assert>
						
			<!--Controllo author/assignedAuthor/addr-->
			<let name="num_addr_author" value="count(hl7:author/hl7:assignedAuthor/hl7:addr)"/>
			
			<assert test="$num_addr_author=0 or (count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:country)=$num_addr_author and 
			count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:city)=$num_addr_author and
			count(hl7:author/hl7:assignedAuthor/hl7:addr/hl7:streetAddressLine)=$num_addr_author)"
			>ERRORE-19| L'elemento <name/>/author/assignedAuthor/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<!--Controllo author/assignedAuthor/telecom-->
			<assert test="count(hl7:author/hl7:assignedAuthor/hl7:telecom)>=1"
			>ERRORE-20| L'elemento <name/>/author/assignedAuthor DEVE contenere almeno un elemento 'telecom'</assert>
			
			<!--Controllo author/assignedAuthor/assignedPerson/name-->
			<let name="name_author" value="hl7:author/hl7:assignedAuthor/hl7:assignedPerson/hl7:name"/>
		
			<assert test="(count($name_author/hl7:given)>=1 and count($name_author/hl7:family)>=1)"
			>ERRORE-21| L'elemento <name/>/author/assignedAuthor/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
		
		
			<!--Controllo dataEnterer-->	
						
			<let name="id_dataEnterer" value="hl7:dataEnterer/hl7:assignedEntity/hl7:id"/>
			
			<assert test="count(hl7:dataEnterer)=0 or count($id_dataEnterer[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-22| L'elemento <name/>/dataEnterer/assignedEntity DEVE avere almeno un elemento 'id' <value-of select="$id_dataEnterer"/> con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			
			<let name="num_addr_data_ent" value="count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr)"/>
			
			<assert test="$num_addr_data_ent=0 or (count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr/hl7:country)=$num_addr_data_ent and 
			count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr/hl7:city)=$num_addr_data_ent and
			count(hl7:dataEnterer/hl7:assignedEntity/hl7:addr/hl7:streetAddressLine)=$num_addr_data_ent)"
			>ERRORE-23| L'elemento <name/>/dataEnterer/assignedEntity/addr DEVE riportare i sotto-elementi 'country', 'city' e 'streetAddressLine' </assert>
			
			<let name="nome" value="hl7:dataEnterer/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			
			<assert test="count(hl7:dataEnterer)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-24| L'elemento <name/>/dataEnterer/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
			
			<!--Controllo Informant-->
			<assert test="count(hl7:informant/hl7:relatedEntity)=0 or 
			(count(hl7:informant/hl7:relatedEntity[@classCode='CON' or @classCode='PROV' or @classCode='PRS'])=1)"
			>ERRORE-25| L'elemento <name/>/informant/relatedEntity deve essere valorizzato con l'attributo @classCode='CON' o @classCode='PROV' o @classCode='PRS'.</assert>
			
			<let name="nome" value="hl7:informant/hl7:relatedEntity/hl7:relatedPerson/hl7:name"/>
			<assert test="count(hl7:informant/hl7:relatedEntity)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-26| L'elemento <name/>/informant/relatedEntity/relatedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
			
			<assert test="count(hl7:informant/hl7:assignedEntity/hl7:id)=0 or 
			count(hl7:informant/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-27| L'elemento <name/>/informant se presente, DEVE contenere l'elemento relatedEntity/id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'.</assert>
			
			<let name="nome" value="hl7:informant/hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
			<assert test="count(hl7:informant/hl7:assignedEntity)=0 or (count($nome/hl7:family)=1 and count($nome/hl7:given)=1)"
			>ERRORE-28| L'elemento <name/>/informant/assignedEntity/assignedPerson/name DEVE avere gli elementi 'given' e 'family'</assert>
						
						
			<!--Controllo custodian/assignedCustodian/representedCustodianOrganization-->
			<assert test="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name)=1"
			>ERRORE-29| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization deve contenere un elemento 'name'</assert>
			
			<let name="num_addr_cust" value="count(hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr)"/>
			<let name="addr_cust" value="hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr"/>
			<assert test="$num_addr_cust=0 or (count($addr_cust/hl7:country)=$num_addr_cust and
			count($addr_cust/hl7:city)=$num_addr_cust and 
			count($addr_cust/hl7:streetAddressLine)=$num_addr_cust)"
			>ERRORE-30| L'elemento <name/>/custodian/assignedCustodian/representedCustodianOrganization/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>
			
			
			 <!--Controllo legalAuthenticator-->
			<assert test = "(count(hl7:legalAuthenticator)&lt;=1)" 
			>ERRORE-31| L'elemento <name/>/legalAuthenticator può essere presente una sola volta </assert>
			<assert test = "count(hl7:legalAuthenticator)=0 or count(hl7:legalAuthenticator/hl7:signatureCode[@code='S'])=1" 
			>ERRORE-32| L'elemento <name/>/legalAuthenticator/signatureCode deve essere valorizzato con il codice "S" </assert>
			<assert test = "count(hl7:legalAuthenticator)=0 or count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-33| L'elemento <name/>/legalAuthenticator/assignedEntity DEVE contenere almeno un elemento 'id' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'</assert>
			<let name="num_addr_legauth" value="count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:addr)"/>
			<let name="addr_legauth" value="hl7:legalAuthenticator/hl7:assignedEntity/hl7:addr"/>
			<assert test="$num_addr_legauth=0 or (count($addr_legauth/hl7:country)=$num_addr_legauth and
			count($addr_legauth/hl7:city)=$num_addr_legauth and 
			count($addr_legauth/hl7:streetAddressLine)=$num_addr_legauth)"
			>ERRORE-34| L'elemento <name/>/legalAuthenticator/assignedEntity/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>	
			<assert test = "count(hl7:legalAuthenticator)=0 or 
			(count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:family)=1 and 
			count(hl7:legalAuthenticator/hl7:assignedEntity/hl7:assignedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-35| L'elemento <name/>/legalAuthenticator/assignedEntity/assignedPerson/name DEVE riportare gli elementi 'given' e 'family'</assert>
			
			
			<!--Controllo authenticator-->
			<assert test="count(hl7:authenticator)=0 or count(hl7:authenticator/hl7:signatureCode[@code='S'])=1"
			>ERRORE-36| L'elemento <name/>/authenticator se presente, DEVE contenere l'elemento signatureCode valorizzato con l'attributo @code='S'.</assert>		
			<assert test="count(hl7:authenticator)=0 or count(hl7:authenticator/hl7:assignedEntity/hl7:id[@root='2.16.840.1.113883.2.9.4.3.2'])=1"
			>ERRORE-37| L'elemento <name/>/authenticator DEVE contenere almeno un elemento assignedEntity/id valorizzato con l'attributo @root='2.16.840.1.113883.2.9.4.3.2'.</assert>
			<let name="num_addr_auth" value="count(hl7:authenticator/hl7:assignedEntity/hl7:addr)"/>
			<let name="addr_auth" value="hl7:authenticator/hl7:assignedEntity/hl7:addr"/>
			<assert test="$num_addr_auth=0 or (count($addr_auth/hl7:country)=$num_addr_auth and
			count($addr_auth/hl7:city)=$num_addr_auth and 
			count($addr_auth/hl7:streetAddressLine)=$num_addr_auth)"
			>ERRORE-38| L'elemento <name/>/authenticator/assignedEntity/addr DEVE riportare i sotto-elementi 'country','city' e 'streetAddressLine'</assert>		
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
			(count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:family)=1 and count(hl7:participant/hl7:associatedEntity/hl7:associatedPerson/hl7:name/hl7:given)=1)"
			>ERRORE-42| L'elemento <name/>/participant/associatedEntity/associatedPerson/name deve contenere gli elementi 'given' e 'family'</assert>
			
		
		</rule>	


<!--_______________________________________________________CONTROLLI SUI DIZIONARI_____________________________________________________________-->


		<!--Verifica che i codici LOINC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.6.1']">
			<let name="val_LOINC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.6.1.xml')//el[@code=$val_LOINC] or
			$val_LOINC='LA16666-2' or $val_LOINC='LA18632-2' or $val_LOINC='LA28752-6' or $val_LOINC='LA18821-1' or
			$val_LOINC='LA4270-0' or $val_LOINC='LA21285-4' or $val_LOINC='LA21286-5' or $val_LOINC='LA6743-4'"
			>Errore 1-DIZ| Codice LOINC '<value-of select="$val_LOINC"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici AIC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.6.1.5']">
			<let name="val_AIC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.6.1.5.xml')//el[@code=$val_AIC]"
			>Errore 2-DIZ| Codice AIC '<value-of select="$val_AIC"/>' errato!
			</assert>
		</rule>
	
		<!--Verifica che i codici ATC utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.6.73']">
			<let name="val_ATC" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.6.73.xml')//el[@code=$val_ATC]"
			>Errore 3-DIZ| Codice ATC '<value-of select="$val_ATC"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici GE utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.6.1.51']">
			<let name="val_GE" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.6.1.51.xml')//el[@code=$val_GE]"
			>Errore 4-DIZ| Codice GE '<value-of select="$val_GE"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici ICD-9-CM utilizzati siano corretti-->
		<!--rule context="//*[@codeSystem='2.16.840.1.113883.6.103']">
			<let name="val_ICD9CM" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.6.103.xml')//el[@code=$val_ICD9CM]"
			>Errore 5-DIZ| Codice ICD-9-CM '<value-of select="$val_ICD9CM"/>' errato!
			</assert>
		</rule-->
		
		<!--Verifica che i codici relativi al value set "Allergeni (No Farmaci)" utilizzati siano corretti-->		
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2']">
			<let name="val_AllNoFarm" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.2.xml')//el[@code=$val_AllNoFarm]"
			>Errore 6-DIZ| Codice "Allergeni (No Farmaci)"  '<value-of select="$val_AllNoFarm"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ReazioniAllergiche" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.4']">
			<let name="reaz_aller" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.4.xml')//el[@code=$reaz_aller]"
			>Errore 7-DIZ| Codice "ReazioniAllergiche"  '<value-of select="$reaz_aller"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "RouteOfAdministration" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.112']">
			<let name="via_somminist" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.112.xml')//el[@code=$via_somminist]"
			>Errore 8-DIZ| Codice "RouteOfAdministration"  '<value-of select="$via_somminist"/>' errato!
			</assert>
		</rule>		
		
		<!--Verifica che i codici "ActStatus" utilizzati siano corretti-->
		<rule context="//hl7:statusCode">
			<let name="val_status" value="@code"/>
			<assert test="count(@code)=0 or doc('DIZ/XML_FSE_v1/2.16.840.1.113883.11.22.12.xml')//el[@code=$val_status]"
			>Errore 9-DIZ| Codice "ActStatus" '<value-of select="$val_status"/>' errato!
			</assert>
		</rule>	

		<!--Verifica che i codici "AssistenzaDomiciliare_PSSIT "utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.5.2.8']">
			<let name="val_assdom" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.5.2.8.xml')//el[@code=$val_assdom]"
			>Errore 10-DIZ| Codice "AssistenzaDomiciliare_PSSIT" '<value-of select="$val_assdom"/>' errato!
			</assert>
		</rule>
				
		<!--Verifica che i codici "ActSite" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.1052']">
			<let name="val_actsite" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.1052.xml')//el[@code=$val_actsite]"
			>Errore 11-DIZ| Codice "ActSite" '<value-of select="$val_actsite"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ObservationIntoleranceType" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.1.11.19700']">
			<let name="obsIntoleranceType1" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.1.11.19700.xml')//el[@code=$obsIntoleranceType1]"
			>Errore 12-DIZ| Codice "ObservationIntoleranceType" '<value-of select="$obsIntoleranceType1"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ObservationIntoleranceType" utilizzati siano corretti-->
		<!--rule context="//*[@codeSystem='2.16.840.1.113883.5.4']">
			<let name="obsIntoleranceType" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.4.xml')//el[@code=$obsIntoleranceType]"
			>Errore 13-DIZ| Codice "ObservationIntoleranceType" '<value-of select="$obsIntoleranceType"/>' errato!
			</assert>
		</rule-->
		
		<!--Verifica che i codici relativi al value set "ReazioniIntolleranze" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3']">
			<let name="reaz_int" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.3.xml')//el[@code=$reaz_int]"
			>Errore 14-DIZ| Codice "ReazioniIntolleranza"  '<value-of select="$reaz_int"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "CriticalityObservation" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.6']">
			<let name="cri_obs" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.6.xml')//el[@code=$cri_obs]"
			>Errore 15-DIZ| Codice "CriticalityObservation"  '<value-of select="$cri_obs"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Stato clinico del problema" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.7']">
			<let name="problem_status" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.7.xml')//el[@code=$problem_status]"
			>Errore 16-DIZ| Codice "Stato clinico del problema"  '<value-of select="$problem_status"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Età insorgenza" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.8']">
			<let name="age" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.8.xml')//el[@code=$age]"
			>Errore 17-DIZ| Codice "Età insorgenza"  '<value-of select="$age"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici "Absent or Unknown Allergies" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.11.22.9']">
			<let name="val_allergies" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.11.22.9.xml')//el[@code=$val_allergies]"
			>Errore 18-DIZ| Codice "Absent or Unknown Allergies" '<value-of select="$val_allergies"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ProblemObservation" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.9']">
			<let name="prob_obs" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.9.xml')//el[@code=$prob_obs]"
			>Errore 19-DIZ| Codice "ProblemObservation"  '<value-of select="$prob_obs"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "CronicitàProblema" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10']">
			<let name="prob_cron" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.10.xml')//el[@code=$prob_cron]"
			>Errore 20-DIZ| Codice "CronicitàProblema"  '<value-of select="$prob_cron"/>' errato!
			</assert>
		</rule>
				
		<!--Verifica che i codici relativi al value set "StatoClinicoAllergia" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.11']">
			<let name="status_aller" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.11.xml')//el[@code=$status_aller]"
			>Errore 21-DIZ| Codice "StatoClinicoAllergia"  '<value-of select="$status_aller"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "ProcedureTrapianti_PSSIT" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.12']">
			<let name="proc_trap" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.12.xml')//el[@code=$proc_trap]"
			>Errore 22-DIZ| Codice "ProcedureTrapianti_PSSIT"  '<value-of select="$proc_trap"/>' errato!
			</assert>
		</rule>
				
		<!--Verifica che i codici relativi al value set "assignedAuthorCode_PSSIT" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.13']">
			<let name="author_code" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.13.xml')//el[@code=$author_code]"
			>Errore 23-DIZ| Codice "assignedAuthorCode_PSSIT"  '<value-of select="$author_code"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Encounter Code" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.14']">
			<let name="enc_code" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.14.xml')//el[@code=$enc_code]"
			>Errore 24-DIZ| Codice "Encounter Code"  '<value-of select="$enc_code"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Capacità Motoria" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.15']">
			<let name="cap_mot" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.15.xml')//el[@code=$cap_mot]"
			>Errore 25-DIZ| Codice "Capacità Motoria"  '<value-of select="$cap_mot"/>' errato!
			</assert>
		</rule>
				
		<!--Verifica che i codici relativi al value set "OrganiMancanti_ICD9_PSSIT" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.16']">
			<let name="organi_manc9" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.16.xml')//el[@code=$organi_manc9]"
			>Errore 26-DIZ| Codice "OrganiMancanti_ICD9_PSSIT"  '<value-of select="$organi_manc9"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "OrganiMancanti_ICD10_PSSIT" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.17']">
			<let name="organi_manc10" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.17.xml')//el[@code=$organi_manc10]"
			>Errore 27-DIZ| Codice "OrganiMancanti_ICD10_PSSIT"  '<value-of select="$organi_manc10"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Trapianti_PSSIT" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.2.9.77.22.11.18']">
			<let name="trapianti" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.2.9.77.22.11.18.xml')//el[@code=$trapianti]"
			>Errore 28-DIZ| Codice "Trapianti_PSSIT"  '<value-of select="$trapianti"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Absent or Unknown Medication" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.11.22.15']">
			<let name="medication" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.11.22.15.xml')//el[@code=$medication]"
			>Errore 29-DIZ| Codice "Absent or Unknown Medication"  '<value-of select="$medication"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Absent or Unknown Problems" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.11.22.17']">
			<let name="prob" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.11.22.17.xml')//el[@code=$prob]"
			>Errore 30-DIZ| Codice "Absent or Unknown Problems"  '<value-of select="$prob"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Absent or Unknown Procedures" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.11.22.36']">
			<let name="procedures" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.11.22.36.xml')//el[@code=$procedures]"
			>Errore 31-DIZ| Codice "Absent or Unknown Procedures"  '<value-of select="$procedures"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "Absent or Unknown Devices" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.11.22.61']">
			<let name="devices" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.11.22.61.xml')//el[@code=$devices]"
			>Errore 32-DIZ| Codice "Absent or Unknown Devices"  '<value-of select="$devices"/>' errato!
			</assert>
		</rule>
				
		<!--Verifica che i codici relativi al value set "UnitsOfMeasureCaseSensitive" utilizzati siano corretti-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody//hl7:component/hl7:section[hl7:code[@code!='29762-2']]//hl7:value[@unit]">
			<let name="unit" value="@unit"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.1.11.12839.xml')//el[@code=$unit]"
			>Errore 33_DIZ| Codice "UnitsOfMeasureCaseSensitive"  '<value-of select="$unit"/>' errato!
			</assert>
		</rule>

		<!--Verifica che i codici ICD-10-CM utilizzati siano corretti-->
		<!--rule context="//*[@codeSystem='2.16.840.1.113883.6.104']">
			<let name="val_ICD10CM" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.6.104.xml')//el[@code=$val_ICD10CM]"
			>Errore 34_DIZ| Codice ICD-10-CM '<value-of select="$val_ICD10CM"/>' errato!
			</assert>
		</rule-->
		
		
		<!--Verifica che i codici relativi al value set "AdministrativeGender" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.1.11.1']">
			<let name="gender" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.1.11.1.xml')//el[@code=$gender]"
			>Errore 35_DIZ| Codice "AdministrativeGender" '<value-of select="$gender"/>' errato!
			</assert>
		</rule>
		
		<!--Verifica che i codici relativi al value set "AdministrativeGender" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.1']">
			<let name="gender1" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.1.xml')//el[@code=$gender1]"
			>Errore 36_DIZ| Codice "AdministrativeGender" '<value-of select="$gender1"/>' errato!
			</assert>
		</rule>
		
		
		<!--Verifica che i codici relativi al value set "RoleCode" utilizzati siano corretti-->
		<rule context="//*[@codeSystem='2.16.840.1.113883.5.111']">
			<let name="roleCode" value="@code"/>
			<assert test="doc('DIZ/XML_FSE_v1/2.16.840.1.113883.5.111.xml')//el[@code=$roleCode]"
			>Errore 37_DIZ| Codice "RoleCode"  '<value-of select="$roleCode"/>' errato!
			</assert>
		</rule>
		

<!--__________________________________________________________CONTROLLI GENERICI________________________________________________________________-->


		<!--Controllo use Telecom-->
		<rule context="//hl7:telecom">
			<assert test="(count(@use)=1)"
			>ERRORE-43| L’elemento 'telecom' DEVE contenere l'attributo @use </assert>
		</rule>	
		
		<!-- Controllo formato: -->
		<!--campi Codice Fiscale: 16 cifre [A-Z0-9]{16} -->
		<rule context="//hl7:id[@root='2.16.840.1.113883.2.9.4.3.2']">
			<let name="CF" value="@extension"/>
			<assert test="matches(@extension,'[A-Z0-9]{16}')"
			>ERRORE-44| Il codice fiscale '<value-of select="$CF"/>' cittadino ed operatore deve essere costituito da 16 cifre [A-Z0-9]{16}</assert>
			
		</rule>
	
		<!--Controllo sugli attributi di observation-->
		<rule context="//hl7:observation">
			<let name="moodCd" value="@moodCode"/>
			<assert test="count(@classCode)=1"
			>ERRORE-45| L'attributo "@classCode" dell'elemento "observation" deve essere presente </assert>
		</rule>
		
		
		
<!--___________________________________________________________________BODY__________________________________________________________________________-->
	
	
	
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody">
			
		<!--Controllo sulle Section obbligatorie-->
		
			<!--1-->
			<!--Allergie e intolleranze-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='48765-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-46| Sezione Allergie e intolleranze: la sezione DEVE essere presente.</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.1'])=1"
			>ERRORE-47| Sezione Allergie e intolleranze: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.1'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:title)=1"
			>ERRORE-48| Sezione Allergie e intolleranze: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Allergie e Intolleranze'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry)&gt;=1"
			>ERRORE-49| Sezione Allergie e intolleranze: la sezione DEVE contenere almeno un elemento 'entry'</assert>			
		
			<!--2-->
			<!--Sezione Terapie farmacologiche-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='10160-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-50| Sezione Terapie farmacologiche: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.2'])=1"
			>ERRORE-51| Sezione Terapie farmacologiche: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.2'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:title)=1"
			>ERRORE-52| Sezione Terapie farmacologiche: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Terapie farmacologiche'</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']])=0 and
			count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3']])=1) or 
			(count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']])>=1 and
			count(hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry[hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3']])=0)"
			>ERRORE-53| Sezione Terapie farmacologiche: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
			<!--4-->
			<!--Sezione Lista dei problemi-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='11450-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-54| Sezione Lista dei problemi: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.4'])=1"
			>ERRORE-55| Sezione Lista dei problemi: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.4'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:title)=1"
			>ERRORE-56| Sezione Lista dei problemi: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Lista dei problemi'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:entry)&gt;=1"
			>ERRORE-57| Sezione Lista dei problemi: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
			<!--9-->
			<!--Protesi, Impianti e Ausili -->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='46264-8'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-58| Sezione Protesi, impianti e ausili: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.9'])=1"
			>ERRORE-59| Sezione Protesi, impianti e ausili: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.9'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:title)=1"
			>ERRORE-60| Sezione Protesi, impianti e ausili: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Protesi, impianti e ausili'</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])=0 and 
			count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2']])=1) or 
			(count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])>=1 and 
			count(hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry[hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2']])=0)"
			>ERRORE-61| Sezione Protesi, impianti e ausili: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--11-->
			<!--Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='47519-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-62| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.11'])=1"
			>ERRORE-63| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.11'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:title)=1"
			>ERRORE-64| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche'</assert>
			<assert test="(count(hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:entry)&gt;=1)"
			>ERRORE-65| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: la sezione DEVE contenere un elemento 'entry'</assert>
			
			<!--13-->
			<!--Sezione Stato funzionale del paziente-->
			<assert test="count(hl7:component/hl7:section/hl7:code[@code='47420-5'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-66| Sezione Stato funzionale del paziente: la sezione DEVE essere presente</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.13'])=1"
			>ERRORE-67| Sezione Stato funzionale del paziente: la sezione deve contenere l'elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.13'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:title)=1"
			>ERRORE-68| Sezione Stato funzionale del paziente: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Stato funzionale del paziente'</assert>
			
		
		<!--Controllo sulle Section opzionali-->
		
			<!--3-->
			<!--Sezione Vaccinazioni-->	
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11369-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.3'])=1"
			>ERRORE-69| Sezione Vaccinazioni: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.3'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11369-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:title)=1"
			>ERRORE-70| Sezione Vaccinazioni: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Vaccinazioni'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='11369-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:entry)&gt;=1"
			>ERRORE-71| Sezione Vaccinazioni: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--5-->
			<!--Anamnesi familiare-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10157-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.16'])=1"
			>ERRORE-72| Sezione Anamnesi familiare: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.16”'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10157-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:title)=1"
			>ERRORE-73| Sezione Anamnesi familiare: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Vaccinazioni'</assert>
		
			
			<!--6-->
			<!--Stile di vita-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29762-2']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='29762-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.6'])=1"
			>ERRORE-74| Sezione Stile di vita: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.6'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='29762-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='29762-2']]/hl7:title)=1"
			>ERRORE-75| Sezione Stile di vita: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Stile di vita'</assert>
		

			<!--7-->
			<!--Gravidanze e parto-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10162-6']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.7'])=1"
			>ERRORE-76| Sezione Gravidanze e parto: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.7'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10162-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:title)=1"
			>ERRORE-77| Sezione Gravidanze e parto: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Gravidanze, parti, stato mestruale'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='10162-6']])=0 or count(hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:entry)&gt;=1"
			>ERRORE-78| Sezione Gravidanze e parto: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
			<!--8-->
			<!--Parametri vitali-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8716-3']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.8'])=1"
			>ERRORE-79| Sezione Parametri vitali: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.8'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='8716-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:title)=1"
			>ERRORE-80| Sezione Parametri vitali: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Parametri vitali'</assert>
		
		
			<!--10-->
			<!--Piani di cura-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='18776-5']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.10'])=1"
			>ERRORE-81| Sezione Piani di cura: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.10'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='18776-5']])=0 or count(hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:title)=1"
			>ERRORE-82| Sezione Piani di cura: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Piani di cura'</assert>
			
			<!--12-->
			<!--Visite o ricoveri-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.12'])=1"
			>ERRORE-83| Sezione Visite o ricoveri: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.12'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:title)=1"
			>ERRORE-84| Sezione Visite o ricoveri: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Visite e ricoveri'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='46240-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry)&gt;=1"
			>ERRORE-85| Sezione Visite o ricoveri: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--14-->
			<!--Indagini diagnostiche e esami di laboratorio-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.14'])=1"
			>ERRORE-86| Sezione Indagini diagnostiche e esami di laboratorio: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.14'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='30954-2']])=0 or count(hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:title)=1"
			>ERRORE-87| Sezione Indagini diagnostiche e esami di laboratorio: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Indagini diagnostiche e esami di laboratorio'</assert>
		
			<!--15-->
			<!--Assenso/dissenso donazione organi-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='42348-3']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='42348-3']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.15'])=1"
			>ERRORE-88| Sezione Assenso/dissenso donazione organi: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.15'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='42348-3']])=0 or count(hl7:component/hl7:section[hl7:code[@code='42348-3']]/hl7:title)=1"
			>ERRORE-89| Sezione Assenso/dissenso donazione organi: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Assenso/dissenso donazione organi'</assert>
			
			<!--16-->
			<!--Esenzioni-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='57827-8']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.17'])=1"
			>ERRORE-90| Sezione Esenzioni: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.17'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='57827-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:title)=1"
			>ERRORE-91| Sezione Esenzioni: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Esenzioni'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='57827-8']])=0 or count(hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:entry)&gt;=1"
			>ERRORE-92| Sezione Esenzioni: la sezione DEVE contenere almeno un elemento 'entry'</assert>
			
			<!--17-->
			<!--Reti di patologia-->
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:code[@codeSystem='2.16.840.1.113883.2.9.5.2.8'])=1"
			>ERRORE-93| Sezione Reti di patologia: la sezione DEVE contenere un elemento 'code' valorizzato con l'attributo @codeSystem='2.16.840.1.113883.2.9.5.2.8'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or 
			count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.2.18'])=1"
			>ERRORE-94| Sezione Reti di patologia: la sezione DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.2.18'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:title)=1"
			>ERRORE-95| Sezione Reti di patologia: la sezione DEVE contenere un elemento 'title' possibilmente valorizzato con 'Reti di patologia'</assert>
			<assert test="count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']])=0 or count(hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:entry)&gt;=1"
			>ERRORE-96| Sezione Reti di patologia: la sezione DEVE contenere almeno un elemento 'entry'</assert>
		
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
			>ERRORE-97| Il codice '<value-of select="$codice"/>' non è corretto. La sezione deve essere valorizzata con uno dei seguenti codici:
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
			>ERRORE-98| Sezione Allergie e Intolleranze: entry/act DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.1'.</assert>
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-99| Sezione Allergie e Intolleranze: entry/act DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
					($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
					($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
					($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-100| Sezione Allergie e Intolleranze: entry/act/effectiveTime deve contenere l'elemento 'high' valorizzato nel caso in cui lo 'statusCode' è "completed"|"aborted".</assert>
			<assert test="(count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']])=0 and 
			count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']])=1) or
			(count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']])=0 and 
			count(hl7:act/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']])=1)"
			>ERRORE-101| Sezione Allergie e Intolleranze: entry/act DEVE contenere una sola entryRelationship/observation conenente l'elemento 'templateId' valorizzato nei seguenti modi:
			- @root='2.16.840.1.113883.2.9.10.1.4.3.1.4' per "Assenza allergie note" 
			- @root='2.16.840.1.113883.2.9.10.1.4.3.1.3' per "Presenza allergie e/o intolleranze".</assert>
			
			<!--Presenza  di allergie-->
			<report test="not(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3'])=0) and 
			not(count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:code[@code='52473-6'][@codeSystem='2.16.840.1.113883.6.1'])=1)"
			>W003| Sezione Allergie e Intolleranze: si consiglia di valorizzare l'elemento entry/act/entryRelationship/observation/code con @code='52473-6' derivato da LOINC.--></report>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3'])=0 or
			count(hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-102| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3'])=0 or
			count(hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:value[@xsi:type='CD'])=1"
			>ERRORE-103| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE contenere un elemento 'value' con l'attributo @xsi:type="CD".</assert>			
			
			<let name="temp" value="hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]"/>
			<assert test="count($temp)=0 or 
			(count($temp/hl7:value/@code)=1 and count($temp/hl7:value/hl7:originalText/hl7:reference/@value)&lt;=1 and 
			count($temp/hl7:value[@codeSystem='2.16.840.1.113883.5.4' or @codeSystem='2.16.840.1.113883.1.11.19700'])=1) or 
			(count($temp/hl7:value/@code)=0 and count($temp/hl7:value/hl7:originalText/hl7:reference/@value)=1)"
			>ERRORE-104| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/value può essere valorizzato nei modi seguenti:
			- nel caso di 'value' non codificato DEVE avere l'elemento originalText/reference/@value valorizzato;
			- nel caso di 'value' codificato DEVE essere valorizzato con l'attributo @codeSystem='2.16.840.1.113883.5.4' o @codeSystem='2.16.840.1.113883.1.11.19700'</assert>
				
				<!--Descrizione Agente-->
				<assert test="count($temp)=0 or count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:participant)>=1"
				>ERRORE-105| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE contenere almeno un 'participant' - "Descrizione Agente".</assert>
				
				<!--Criticità allergia-->
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.3'])=1"
				>ERRORE-106| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Criticità di un'allergia o intolleranza) DEVE includere l'identificativo 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.3' </assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation]/hl7:observation/hl7:value[@xsi:type='CD'])=1"
				>ERRORE-107| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Criticità di un'allergia o intolleranza) DEVE avere un elemento 'value' con l'attributo @xsi:type='CD'.</assert>
				
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:observation])=0 or 
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.5.1063'])=1"
				>ERRORE-108| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation/value (Criticità di un'allergia o intolleranza) DEVE essere derivato dal value set "CriticalityObservation" - @codeSystem='2.16.840.1.113883.5.1063'.</assert>
				<!--Stato allergia-->
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6'])=1"
				>ERRORE-109| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Stato di un'allergia) DEVE includere l'identificativo 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.6'.</assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-110| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Stato di un'allergia) DEVE contenere un elemento 'code' valorizzato con gli attributi @code='33999-4' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='REFR'])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.11' or @codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-111| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Stato di un'allergia) DEVE avere un elemento 'value' valorizzato secondo il value set "Stato clinico allergia" - @codeSystem='2.16.840.1.113883.6.1'. </assert>
				<!--Note e commenti-->
				<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])=0 or
				count(hl7:act/hl7:entryRelationship/hl7:observation/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
				>ERRORE-112| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Note e commenti) DEVE contenere un 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'.</assert>
			
			
						
			<!--Assenza allergia-->
			<let name="temp_abs" value="hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']]"/>
			<assert test="count($temp_abs)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.4']]/hl7:code[@code='OINT'][@codeSystem='2.16.840.1.113883.5.4' or @codeSystem='2.16.840.1.113883.1.11.19700'])=1"
			>ERRORE-113| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation DEVE avere un elemento 'code' valorizzato con @code='OINT' e @codeSystem='2.16.840.1.113883.5.4' o @codeSystem='2.16.840.1.113883.1.11.19700'.</assert>
			
			<assert test="count($temp_abs)=0 or 
			(count($temp_abs/hl7:value/@code)=1 and	
			count($temp_abs/hl7:value[@codeSystem='2.16.840.1.113883.5.1150.1' or @codeSystem='2.16.840.1.113883.11.22.9'])=1
			and count($temp_abs/hl7:value/hl7:originalText/hl7:reference/@value)&lt;=1)"
			>ERRORE-114| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/value DEVE deve essere valorizzato secondo il value set "Absent or Unknown allergies" @codeSystem='2.16.840.1.113883.5.1150.1' or @codeSystem='2.16.840.1.113883.11.22.9'  
			</assert>
				
			
		</rule>
			
			<!--Descrizione Agente-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:participant">	
				
				
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:code/@code)=0 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.2'])=1"
				>ERRORE-115| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/participant/participantRole/playingEntity/code deve avere l'attributo @codeSystem valorizzato come segue:
				- 2.16.840.1.113883.6.73		codifica "WHO ATC"
				- 2.16.840.1.113883.2.9.6.1.5 		codifica "AIC"
				- 2.16.840.1.113883.11.22.9 		value set "AbsentorUnknownAllergies" (- per le allergie non a farmaci –)
				</assert>		
				
				<assert test="count(hl7:participantRole/hl7:playingEntity/hl7:code/@nullFlavor)=0 or 
				count(hl7:participantRole/hl7:playingEntity/hl7:code[@nullFlavor='NI'])=1"
				>ERRORE-116| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/participant/participantRole/playingEntity DEVE contenere l'elemento code valorizzato con l'attributo @nullFlavor='NI'.</assert>
				
				<assert test="(count(hl7:participantRole/hl7:playingEntity/hl7:code/@nullFlavor)=0 or
				count(hl7:participantRole/hl7:playingEntity/hl7:code/hl7:originalText/hl7:reference)=1) "
				>ERRORE-117| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/participant/participantRole/playingEntity DEVE contenere l'elemento originalText/reference.</assert>
				
			</rule>
			<!--Descrizione Reazioni-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='48765-2']]/hl7:entry/hl7:act/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.3']]/hl7:entryRelationship[@typeCode='MFST']">	
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' or @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=1"
				>ERRORE-118| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Descrizione reazioni) DEVE contenere il 'templateId' valorizzato come segue:
				- @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' nel caso di Descrizione Reazione codificato
				- @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2' nel caso di Descrizione reazione non codificato.</assert>			
				<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-119| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation (Descrizione reazioni) DEVE contenere l'elemento 'code' valorizzato con i seguenti attributi @code='75321-0' e @codeSystem='2.16.840.1.113883.6.1'. </assert>
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1'])=0 or
				count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.4' or @codeSystem='2.16.840.1.113883.6.103'])=1"
				>ERRORE-120| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation/code (Descrizione reazioni) DEVE essere valorizzato secondo i seguenti dizionari:
				- 2.16.840.1.113883.2.9.77.22.11.3		Value Set Reazioni Intolleranza
				- 2.16.840.1.113883.2.9.77.22.11.4 		Value Set Reazioni Allergiche
				- 2.16.840.1.113883.6.103			ICD-9-CM
				</assert>				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=0 or
				count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1"
				>ERRORE-121| Sezione Allergie e Intolleranze: entry/act/entryRelationship/observation/entryRelationship/observation/value (Descrizione reazioni) DEVE contenere l'elemento originalText/reference.</assert>
				
			</rule>

		
		
		<!--2-->
		<!--Sezione Terapie farmacologiche: controllo sulle entry-->			
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10160-0']]/hl7:entry">
			<assert test="count(hl7:substanceAdministration[@moodCode='INT' or @moodCode='EVN'])=1"
			>ERRORE-122| Sezione Terapia Farmacologica: entry DEVE contenere un elemento di tipo 'substanceAdministration' con attributo @moodCode valrizzato con 'INT' o 'EVN'. </assert>
			<assert test="(count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=1 or
						  count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3'])=1)"
			>ERRORE-123| Sezione Terapia Farmacologica: entry/substanceAdministration DEVE contenere un elemento 'templateId' valorizato come segue:
			- @root='2.16.840.1.113883.2.9.10.1.4.3.2.1' per Terapia o 
			- @root='2.16.840.1.113883.2.9.10.1.4.3.2.3' per Assenza di terapia</assert>
		<!--Terapia-->
			<assert test="count(hl7:substanceAdministration/hl7:text)=0 or count(hl7:substanceAdministration/hl7:text/hl7:reference/@value)=1"
			>ERRORE-124| Sezione Terapia Farmacologica: entry/substanceAdministration/text DEVE contenere l'elemento reference/@value valorizzato con l’URI che punta alla descrizione della terapia nel narrative block della sezione.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=0 or
			count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1"
			>ERRORE-125| Sezione Terapia Farmacologica: entry/substanceAdministration/effectiveTime DEVE essere presente e deve avere l'elemento 'low' valorizzato  </assert>				
			<let name="status" value="hl7:substanceAdministration/hl7:statusCode/@code"/>
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=0 or
			($status='completed' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or
			($status='aborted' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=1) or 
			($status='suspended' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0) or 
			($status='active' and count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:high)=0)"
			>ERRORE-126| Sezione Terapia Farmacologica: entry/substanceAdministration/effectiveTime/high DEVE essere presente nel caso in cui lo 'statusCode' sia 'completed'oppure'aborted'
			</assert>	
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1'])=0 or
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.2'])=1"
			>ERRORE-127| Sezione Terapia Farmacologica: entry/substanceAdministration/consumable/manufacturedProduct DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.2.2'.</assert>
			<let name="farma" value="hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']]/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count(hl7:substanceAdministration[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.1']])=0 or 
			(count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or 
			count($farma/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1 or
			count($farma/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.51'])=1)"
			>ERRORE-128| Sezione Terapia Farmacologica: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial deve contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
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
			>ERRORE-129| Sezione Terapia farmacologica: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation DEVE essere valorizzato secondo i seguenti sistemi di codifica:
			@codeSystem='2.16.840.1.113883.6.73' (ATC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.5' (AIC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.51' (GE)</assert>
			
			<!--Indicazione assenza terapie note-->
			<assert test="count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.2.3'])=0 or 
			count(hl7:substanceAdministration/hl7:code[@codeSystem='2.16.840.1.113883.11.22.15' or @codeSystem='2.16.840.1.113883.5.1150.1'])"
			>ERRORE-130| Sezione Terapia farmacologica: entry/substanceAdministration/code DEVE essere valorizzato secondo il value set @codeSystem='2.16.840.1.113883.11.22.15' o @codeSystem='2.16.840.1.113883.5.1150.1' (Absent or Unknown Medication)</assert>
			
		</rule>


		
		<!--3-->
		<!--Vaccinazioni-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:entry">
	   
			<assert test="count(hl7:substanceAdministration)=1 and count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.1'])=1"
			>ERRORE-131| Sezione Vaccinazioni: entry/substanceAdministration DEVE essere conforme al 'templateId' valorizzato con  @root='2.16.840.1.113883.2.9.10.1.4.3.3.1'
			</assert>
			<assert test="count(hl7:substanceAdministration/hl7:code[@code='IMMUNIZ'][@codeSystem='2.16.840.1.113883.5.4'])=1 "
			>ERRORE-132| Sezione Vaccinazioni: entry/substanceAdministration DEVE contenere un 'code' valorizzato con il gli attributi @code='IMMUNIZ' e @codeSystem='2.16.840.1.113883.5.4' </assert>		   
			<assert test="count(hl7:substanceAdministration/hl7:text)=0 or count(hl7:substanceAdministration/hl7:text/hl7:reference/@value)=1"
			>ERRORE-133| Sezione Vaccinazioni: entry/substanceAdministration/text/reference DEVE contenere l'attributo @value valorizzato con l’URI che punta alla descrizione della terapia nel narrative block della sezione.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:statusCode[@code='completed'])=1 "
			>ERRORE-134| Sezione Vaccinazioni: entry/substanceAdministration DEVE contenere uno statusCode valorizzato @code='completed' </assert>   
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.2'])=1"
			>ERRORE-135| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct DEVE contenere l'elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.3.2'</assert>			   		
			<let name="farma_vacc" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($farma_vacc/hl7:code/@code)=0 or 
			count($farma_vacc/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or 
			count($farma_vacc/hl7:code[@codeSystem='2.16.840.1.113883.6.73'])=1"
			>ERRORE-136| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial DEVE contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
			- @codeSystem='2.16.840.1.113883.2.9.6.1.5' 	(AIC)
			- @codeSystem='2.16.840.1.113883.6.73'			(ATC)
			</assert>			
			<let name="trans_vacc" value="hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial"/>
			<assert test="count($trans_vacc/hl7:code/hl7:translation)=0 or
			(count($trans_vacc/hl7:code[@codeSystem='2.16.840.1.113883.6.73']/hl7:translation[@codeSystem='2.16.840.1.113883.2.9.6.1.5'])=1 or
			count($trans_vacc/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.5']/hl7:translation[@codeSystem='2.16.840.1.113883.6.73'])=1)"
			>ERRORE-137| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation DEVE essere valorizzato secondo i seguenti sistemi di codifica:
			@codeSystem='2.16.840.1.113883.6.73' (ATC)
			@codeSystem='2.16.840.1.113883.2.9.6.1.5' (AIC)</assert>	
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:lotNumberText)=1"
			>ERRORE-138| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial DEVE contenere un elemento 'lotNumberText'. </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/@nullFlavor)=0 or 
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code[@nullFlavor='OTH'])=1 and 
			count(hl7:substanceAdministration/hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial/hl7:code/hl7:originalText/hl7:reference)=1"
			>ERRORE-139| Sezione Vaccinazioni: entry/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code non codificato deve avere l'attributo @nullFlavor='OTH' e deve contenere l'elemento originalText/reference valorizzato.</assert> 
			
			<!--periodo di copertura-->
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']) &lt;=1"
			>ERRORE-140| Sezione Vaccinazioni: entry/substanceAdministration può contenere  al più un entryRelationship/obersavation che descrive il "Periodo di copertura" conforme al 'templateId' @root='2.16.840.1.113883.2.9.10.1.4.3.3.3' </assert> 	  
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']]/hl7:code[@code='59781-5'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-141| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Periodo di copertura) DEVE avere un elemento 'code' valorizzato con @code='59781-5' e @codeSystem='2.16.840.1.113883.6.1' </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']]/hl7:statusCode[@code='completed'])=1"
			>ERRORE-142| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Periodo di copertura) DEVE contenere un elemento 'statusCode' valorizzato con 'completed'</assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.3']]/hl7:value/hl7:high)=1"
			>ERRORE-143| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Periodo di copertura) DEVE deve contenere un elemento 'value' il quale deve avere l'elemento 'high' valorizzato. </assert> 
	 
			<!--numero di dose-->
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']) &lt;=1"
			>ERRORE-144| Sezione Vaccinazioni: entry/substanceAdministration può contenere al più un entryRelationship/obersavation che descrive il "Numero delle dosi" conforme al 'templateId' @root='2.16.840.1.113883.2.9.10.1.4.3.3.4'.</assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:code[@code='30973-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-145| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Numero delle dosi) DEVE contenere un elemento 'code' valorizzato con @code='30973-2' e @codeSystem='2.16.840.1.113883.6.1' </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:statusCode[@code='completed'])=1"
			>ERRORE-146| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Numero delle dosi) DEVE deve contenere un elemento 'statusCode' valorizzato con @code='completed' </assert> 
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:value[@xsi:type='INT'])=1"
			>ERRORE-147| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation (Numero delle dosi) DEVE contenere un elemento 'value' il cui attributo @xsi:type='INT' </assert> 
		 	<assert test="count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4'])=0 or
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.3.4']]/hl7:value/@value)=1"
			>ERRORE-148| Sezione Vaccinazioni: entry/substanceAdministration/entryReletionship/observation/value DEVE avere l'attributo @value valorizzato</assert> 
		 	
			<!--annotazioni e commenti-->
			<assert test="count(hl7:substanceAdministration/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])=0 or 
			count(hl7:substanceAdministration/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
			>ERRORE-149| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/act relativo a "Annotazioni e commenti" deve contenere l'elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7' </assert> 	  
			
			
			
	   </rule>	
		
			<!--Vaccinazioni: descrizione reazioni-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11369-6']]/hl7:entry/hl7:substanceAdministration/hl7:entryRelationship[@typeCode='CAUS']">
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' or @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=1"
				>ERRORE-150| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation (Descrizione reazione) DEVE essere conforme al 'templateId' @root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1' (Descrizione reazione codificata) o '2.16.840.1.113883.2.9.10.1.4.3.1.5.2' (Descrizione reazione non codificata)</assert> 
				<assert test="count(hl7:observation/hl7:code[@code='75321-0'][@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-151| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation (Descrizione reazione) DEVE contenere l'elemento 'code' valorizzato con @code='75321-0' e @codeSystem='2.16.840.1.113883.6.1'. </assert>
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.1'])=0 or
				count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.3' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.4' or @codeSystem='2.16.840.1.113883.6.103'])=1"
				>ERRORE-152| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation (Descrizione reazione) DEVE contenere l'elemento 'value' valorizzato secondo i seguenti sistemi di codifica:
				- 2.16.840.1.113883.2.9.77.22.11.3		Value Set Reazioni Intolleranza
				- 2.16.840.1.113883.2.9.77.22.11.4 		Value Set Reazioni Allergiche
				-2.16.840.1.113883.6.103				ICD-9-CM
				</assert>				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.5.2'])=0 or
				count(hl7:observation/hl7:value/hl7:originalText/hl7:reference)=1"
				>ERRORE-153| Sezione Vaccinazioni: entry/substanceAdministration/entryRelationship/observation/value (Descrizione reazione) DEVE contenere l'elemento originalText/reference.</assert>
					
			</rule>
		
		
		<!--4-->
		<!--Sezione Lista dei problemi: problema (entry/act)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:entry">
			
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
			>ERRORE-154| Sezione Lista dei problemi: la 'entry' DEVE essere di tipo 'act' valorizzato con gli attributi @classCode='ACT' e @moodCode='EVN'</assert>
			<assert test="count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.1'])=1"
			>ERRORE-155| Sezione Lista dei problemi: entry/act DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.4.1'.</assert>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-156| Sezione Lista dei problemi: entry/act DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<assert test="count(hl7:act/hl7:statusCode)=1"
			>ERRORE-157| Sezione Lista dei problemi: entry/act DEVE contenere l'elemento 'statusCode'.</assert>
			<let name="stats" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="count(hl7:act/hl7:statusCode/@nullFlavor)=1 or 
			($stats='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
			($stats='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
			($stats='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
			($stats='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-158| Sezione Lista dei problemi: entry/act/effectiveTime/high DEVE essere presente nel caso in cui lo 'statusCode' sia 'completed' oppure 'aborted'</assert>
			
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:observation)&gt;=1"
			>ERRORE-159| Sezione Lista dei problemi: entry/act DEVE contenere almeno una entryRelationship/observation relativa ai "Dettagli del problema" </assert>
			
			
		</rule>
		
			<!--Sezione Lista dei problemi: dettagli problema (entry/act/entryRelationship/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='11450-4']]/hl7:entry/hl7:act/hl7:entryRelationship">
			
				<assert test="count(hl7:observation)=1 or count(hl7:act)=1"
				>ERRORE-160| Sezione Lista dei problemi: l'elemento entry/act/entryRelationship deve avere uno dei seguenti sotto elementi:
				- 'observation': per i dettagli del problema;
				- 'act': per i riferimenti interni al problema;</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.2'])=1"
				>ERRORE-161| Sezione Lista dei problemi: entry/act/entryRelationship/observation deve avere un elemento templateId con attributo @root='2.16.840.1.113883.2.9.10.1.4.3.4.2'</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:id)=1"
				>ERRORE-162| Sezione Lista dei problemi: entry/act/entryRelationship/observation deve contenere l'elemento id </assert>				
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:effectiveTime/hl7:low)=1"
				>ERRORE-163| Sezione Lista dei problemi: entry/act/entryRelationship/observation/effectiveTime deve contenere l'elemento low e deve essere valorizzato</assert>
				<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:value)=1"
				>ERRORE-164| Sezione Lista dei problemi: entry/act/entryRelationship/observation deve contenere l'elemento 'value'.</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@nullFlavor='NA'])=0 or 
				count(hl7:observation/hl7:value[@codeSystem='2.16.840.1.113883.11.22.17'])=1"
				>ERRORE-165| Sezione Lista dei problemi: entry/act/entryRelationship/observation/value deve essere valorizzato secondo il value set  "Absent or Unknown Problems" - @codeSystem='2.16.840.1.113883.11.22.17' .</assert>
			
				
					<!--Gravità del Problema-->
					<assert test="count(hl7:observation)=0 or 
					count(hl7:observation/hl7:entryRelationship[hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.4']])&lt;=1"
					>ERRORE-166| Sezione Lista dei problemi: entry/act/entryRelationship/observation può contenere una ed una sola 'entryRelationship/observation' relativa alla "Gravità del problema" </assert>

					<!--Stato del Problema-->
					<assert test="count(hl7:observation)=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']])&lt;=1"
					>ERRORE-167| Sezione Lista dei problemi: entry/act/entryRelationship/observation può contenere una ed una sola 'entryRelationship/observation' relativa allo "Stato clinico del problema"</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']])=0 or
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']]/hl7:code[@code='33999-4'][@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-168| Sezione Lista dei problemi: entry/act/entryRelationship/observation/entryRelationship/observation/code (Stato problema) DEVE essere valorizzato con @code='33999-4' e @codeSystem='2.16.840.1.113883.6.1'.</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']])=0 or
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.6']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.11' or @codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-169| Sezione Lista dei problemi: entry/act/entryRelationship/observation/entryRelationship/observation/value/@code DEVE essere selezionato dal value set "Stato clinico del Problema" - @codeSystem='2.16.840.1.113883.2.9.77.22.11.11' oppure LOINC - @codeSystem='2.16.840.1.113883.6.1'. </assert>
				
					<!--Cronicità del Problema-->
					<assert test="count(hl7:observation)=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']])&lt;=1"
					>ERRORE-170| Sezione Lista dei problemi: entry/act/entryRelationship/observation può contenere una ed una sola 'entryRelationship/observation' relativa alla "Cronicità del problema"</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']])=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']]/hl7:code[@code='89261-2'][@codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-171| Sezione Lista dei problemi: entry/entryRelationship/observation/entryRelationship/observation (Cronicità del Problema) DEVE contenere un elemento 'code' valorizzato con @code='89261-2' e @codeSystem='2.16.840.1.113883.6.1'</assert>
					<assert test="count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']])=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:observation[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.5']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.77.22.11.10' or @codeSystem='2.16.840.1.113883.6.1'])=1"
					>ERRORE-172| Sezione Lista dei problemi: entry/entryRelationship/observation/entryRelationship/observation (Cronicità del Problema) DEVE contenere un elemento 'value' valorizzato secondo @codeSystem='2.16.840.1.113883.2.9.77.22.11.10' (CronicitàProblema_PSS) or @codeSystem='2.16.840.1.113883.6.1'</assert>
					<!--Note e commenti-->
					<assert test="count(hl7:observation/hl7:entryRelationship[@typeCode='SUBJ'][hl7:act])=0 or 
					count(hl7:observation/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
					>ERRORE-173| Sezione Lista dei problemi: entry/act/entryRelationship/observation/entryRelationship/act (Note e Commenti) DEVE avere un templateId valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'</assert> 	  
					
				<!--Riferimenti Interni-->		
				<assert test="count(hl7:act)=0 or count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.4.3'])>=1"
				>ERRORE-174| Sezione Lista dei problemi: entry/act/entryRelationship/act (Riferimenti interni) DEVE avere un elemento 'templateId' valorizzato con  @root='2.16.840.1.113883.2.9.10.1.4.3.4.3'</assert>
			
			</rule>
			
		<!--5-->
		<!--Sezione Anamnesi Familiare: (entry/organizer)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:entry">
			<assert test="count(hl7:organizer[@classCode='CLUSTER'][@moodCode='EVN'])=1"
			>ERRORE-175| Sezione Anamnesi Familiare: la sezione DEVE contenere un elemento entry/organizer valorizzato con attributi @classCode='CLUSTER' e @moodCode='EVN'</assert>
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.16.1'])=1"
			>ERRORE-176| Sezione Anamnesi Familiare: entry/organizer DEVE contenere un elemento 'templateId' dvalorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.16.1'</assert>
			<assert test="count(hl7:organizer/hl7:subject)=1"
			>ERRORE-177| Sezione Anamnesi Familiare: entry/organizer DEVE contenere un elemento 'subject'</assert>
			<assert test="count(hl7:organizer/hl7:subject/hl7:relatedSubject[@classCode='PRS'])=1"
			>ERRORE-178| Sezione Anamnesi Familiare: entry/organizer/subject/relatedSubject DEVE essere valorizzato con l'attributo @classCode='PRS'</assert>
			<assert test="count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:code[@codeSystem='2.16.840.1.113883.5.111'])=1"
			>ERRORE-179| Sezione Anamnesi Familiare: entry/organizer/subject/relatedSubject/code deve essere valorizzato secondo la tabella "PersonalRelationshipRoleCodeType" relativo al code system "RoleCode" - @codeSystem='2.16.840.1.113883.5.111' </assert>
			<assert test="count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode)=0 or
			count(hl7:organizer/hl7:subject/hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode[@codeSystem='2.16.840.1.113883.5.1' or @codeSystem='2.16.840.1.113883.1.11.1'])=1"
			>ERRORE-180| Sezione Anamnesi Familiare: entry/organizer/subject/relatedSubject/subject/administrativeGenderCode DEVE essere valorizzato secondo il code system "HL7 AdministrativeGender" - @codeSystem='2.16.840.1.113883.1.11.1'</assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation])>=1"
			>ERRORE-181| Sezione Anamnesi Familiare: entry/organizer DEVE contenere almeno un elemento 'component' di tipo 'observation'</assert>
			
		</rule>
		
			<!--Sezione Anamnesi Familiare: Dettaglio Anamnesi Familiare(entry/organizer/component/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:entry/hl7:organizer/hl7:component">
			
				<assert test="count(hl7:observation)=1"
				>ERRORE-182| Sezione Anamnesi Familiare: entry/organizer/component DEVE contenere un elemento di tipo 'observation'</assert>
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.16.2'])=1"
				>ERRORE-183| Sezione Anamnesi Familiare: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.16.2'</assert>
				<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.9'])=1"
				>ERRORE-184| Sezione Anamnesi Familiare: entry/organizer/component/observation DEVE contenere un elemento 'code' valorizzato secondo @codeSystem='2.16.840.1.113883.6.1' oppure @codeSystem='2.16.840.1.113883.2.9.77.22.11.9'</assert>
				<assert test="(count(hl7:observation/hl7:entryRelationship[hl7:observation])&lt;=2)"
				>ERRORE-185| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship di tipo 'observation' DEVE essere presente al più 2 volte:
				- età di insorgenza
				- età di decesso</assert>
			</rule>
			<!--Sezione Anamnesi Familiare: Età insorgenza e di decesso(entry/organizer/component/observation/entryRelationship/observation)-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10157-6']]/hl7:entry/hl7:organizer/hl7:component/hl7:observation/hl7:entryRelationship">
			
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.16.3'])=1"
				>ERRORE-186| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.16.3'</assert>
				
				<assert test="count(hl7:observation/hl7:code[@code='35267-4' or @code='39016-1'])=1"
				>ERRORE-187| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation/code DEVE essere valorizzato secondo il value set "EtàInsorgenza" derivato da @codeSystem='2.16.840.1.113883.6.1':
				- @code='35267-4': età di insorgenza
				- @code='39016-1': età di decesso</assert>
				<assert test="count(hl7:observation/hl7:statusCode[@code='completed'])=1"
				>ERRORE-188| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation DEVE contenere un elemento 'statusCode' valorizzato con @code='completed'</assert>
				<assert test="count(hl7:observation/hl7:value)=1"
				>ERRORE-189| Sezione Anamnesi Familiare: entry/organizer/component/observation/entryRelationship/observation DEVE contenere un elemento 'value'</assert>
			
			</rule>
		

		
		<!--6-->
		<!--Sezione Stile di vita: osservazione (entry/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='29762-2']]/hl7:entry">
			
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.6.1'])=1"
			>ERRORE-190| Sezione stile di vita: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.6.1'</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:id)=1"
			>ERRORE-191| Sezione stile di vita: entry/observation DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-192| Sezione stile di vita: entry/observation/code DEVE essere selezionato dal value set "SocialHistoryEntryElement_PSSIT DYNAMIC" derivato da @codeSystem='2.16.840.1.113883.6.1'</assert>
			<assert test="count(hl7:observation/hl7:text)=0 or count(hl7:observation/hl7:text/hl7:reference/@value)=1"
			>ERRORE-193| Sezione stile di vita: entry/observation/text DEVE contenere l'elemento 'reference/@value' valorizzato con l'URI che punta alla descrizione del problema nel narrative block</assert>
			<assert test="count(hl7:observation/hl7:value/hl7:originalText)=0 or count(hl7:observation/hl7:value/hl7:originalText/hl7:reference/@value)=1"
			>ERRORE-194| Sezione stile di vita: entry/observation/value/originalText DEVE contenere l'elemento 'reference/@value' valorizzato con l'URI che punta alla descrizione dell'informazione nel narrative block</assert>
		
		</rule> 
		
		
		
		<!--7-->
		<!--Sezione Gravidanze e parto: dettaglio (entry/observation)-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='10162-6']]/hl7:entry">
			
			<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.7.1'])=1"
			>ERRORE-195| Sezione gravidanze e parto: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.7.1'</assert>
			<assert test="count(hl7:observation/hl7:id)=1"
			>ERRORE-196| Sezione gravidanze e parto: entry/observation DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-197| Sezione gravidanze e parto: entry/observation/code DEVE essere selezionato dal value set "PregnancyObservation_PSSIT" derivato da @codeSystem='2.16.840.1.113883.6.1' </assert>
		</rule>



		<!--8-->
		<!--Parametri Vitali: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry">
			
			<assert test="count(hl7:organizer)=1 or count(hl7:observation)=1"
			>ERRORE-198| Sezione Parametri Vitali: l'entry DEVE contenere o un elemento di tipo 'organizer' oppure di tipo 'observation'.</assert>
			
			<!--organizer-->
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.8.1'])=1"
			>ERRORE-199| Sezione Parametri Vitali: entry/organizer DEVE contenere un 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.8.1' </assert>
			<assert test="count(hl7:organizer)=0 or count(hl7:organizer/hl7:component[hl7:observation])>=1"
			>ERRORE-200| Sezione Parametri Vitali: entry/organizer DEVE contenere almeno un elemento 'component' di tipo 'observation'</assert>
			
			<!--observation-->
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.8.2'])=1"
			>ERRORE-201| Sezione Parametri Vitali: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.8.2'.</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-202| Sezione Parametri Vitali: entry/observation/code DEVE essere valorizzato con @codeSystem='2.16.840.1.113883.6.1'.</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:value[@xsi:type='PQ'])=1"
			>ERRORE-203| Sezione Parametri Vitali: entry/observation/value DEVE avere valorizzato l'attributo @xsi:type='PQ'.</assert>
			
		</rule>
			
			<!--Parametri Vitali: controllo entry/organizer/component/observation-->
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='8716-3']]/hl7:entry/hl7:organizer/hl7:component">
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.8.2'])=1"
				>ERRORE-204| Sezione Parametri Vitali: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.8.2'.</assert>
				<assert test="count(hl7:observation/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1"
				>ERRORE-205| Sezione Parametri Vitali: entry/organizer/component/observation/code DEVE essere valorizzato secondo il @codeSystem='2.16.840.1.113883.6.1'.</assert>
				<assert test="count(hl7:observation/hl7:value[@xsi:type='PQ'])=1"
				>ERRORE-206| Sezione Parametri Vitali: entry/organizer/component/observation/value DEVE avere valorizzato l'attributo @xsi:type='PQ'.</assert>
			
			</rule>



		<!--9-->
		<!--Protesi, Impianti e Ausili: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46264-8']]/hl7:entry">
			
			<assert test="(count(hl7:supply)=1) and
			(count(hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1'])=1 or
			count(hl7:supply/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2'])=1)"
			>ERRORE-207| Sezione Protesi, impianti, ausili: l'entry DEVE essere di tipo 'supply' e DEVE contenere un elemento 'templateId' valorizzato a seconda dei due seguenti casi:
			- Indicazione presenza: @root='2.16.840.1.113883.2.9.10.1.4.3.9.1'
			- Indiczione assenza: @root='2.16.840.1.113883.2.9.10.1.4.3.9.2'</assert>
			
			<!--dettaglio presenza protesi impianti ausili-->
			<assert test="count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])=0 or 
			count(hl7:supply/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.48'])=1"
			>ERRORE-208| Sezione Protesi, impianti, ausili: entry/supply DEVE contenere un elemento 'code'valorizzato secondo il code system "Classificazione Nazionale dei Dispositivi medici" - @codeSystem='2.16.840.1.113883.2.9.6.1.48'.</assert>
			<assert test="count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']])=0 or 
			count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.1']]/hl7:effectiveTime)=1"
			>ERRORE-209| Sezione Protesi, impianti, ausili: entry/supply DEVE contenere un elemento 'effectiveTime'. </assert>
		
			<!--assenza protesi impianti ausili-->
			<assert test="count(hl7:supply[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.9.2']])=0 or 
			count(hl7:supply/hl7:code[@codeSystem='2.16.840.1.113883.11.22.36'])=1"
			>ERRORE-210| Sezione Protesi, impianti, ausili: entry/supply DEVE contenere un elemento 'code' valorizzato secondo il value set "IPSNoProceduresInfos" - @codeSystem='2.16.840.1.113883.11.22.36'.</assert>	
		</rule>

		
		<!--10-->
		<!--Sezione Piani di cura: controllo sulle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='18776-5']]/hl7:entry">
			
			<assert test="count(hl7:observation)=1 or count(hl7:substanceAdministration)=1 or count(hl7:procedure)=1 or count(hl7:encounter)=1 or count(hl7:act)=1"
			>ERRORE-211| Sezione Piani di cura: l'entry può contenere uno dei seguenti sotto statement:
			- 'observation':	 per le prestazioni del piano di cura;
			- 'substanceAdministration': 	per le terapie o le vaccinazioni del piano di cura;
			- 'procedure': 	per le procedure chirurgiche previste dal piano di cura;
			- 'encounter': 	per le visite o i ricoveri previsti da piano di cura;
			- 'act': 	per altre attività del piano di cura.</assert>
		
		<!--Sezione Piani di cura: observation-->
			<assert test="count(hl7:observation)=0 or count(hl7:observation[@moodCode='INT' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO' or @moodCode='GOL'])=1"
			>ERRORE-212|Sezione Piani di cura: entry/observation DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'PRMS' or 'PRP' or 'RQO' or 'GOL' </assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.1'])=1"
			>ERRORE-213|Sezione Piani di cura: entry/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.1'</assert>
			<assert test="count(hl7:observation)=0 or count(hl7:observation/hl7:id)=1"
			>ERRORE-214|Sezione Piani di cura: entry/observation DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:observation/hl7:effectiveTime)=0 or (count(hl7:observation/hl7:effectiveTime[@value])=1 or count(hl7:observation/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-215|Sezione Piani di cura: entry/observation/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale.</assert>
		
		<!--Sezione Piani di cura: substanceAdministration-->
			<assert test="count(hl7:substanceAdministration)=0 or count(hl7:substanceAdministration[@moodCode='INT' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-216|Sezione Piani di cura: entry/substanceAdministration DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:substanceAdministration)=0 or count(hl7:substanceAdministration/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.2'])=1"
			>ERRORE-217|Sezione Piani di cura: entry/substanceAdministration DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.2'</assert>
			<assert test="count(hl7:substanceAdministration)=0 or count(hl7:substanceAdministration/hl7:id)=1"
			>ERRORE-218|Sezione Piani di cura: entry/substanceAdministration DEVE contenere un solo elemento 'id'.</assert>
			<assert test="count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS'])=0 or 
			(count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/@value)=1 or count(hl7:substanceAdministration/hl7:effectiveTime[@xsi:type='IVL_TS']/hl7:low)=1)"
			>ERRORE-219|Sezione Piani di cura: entry/substanceAdministration/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale. </assert>
		
		<!--Sezione Piani di cura: procedure-->
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure[@moodCode='INT' or @moodCode='ARQ' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-220|Sezione Piani di cura: entry/procedure DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'ARQ' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.3'])=1"
			>ERRORE-221|Sezione Piani di cura: entry/procedure DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.3'</assert>
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure/hl7:id)=1"
			>ERRORE-222|Sezione Piani di cura: entry/procedure DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:procedure)=0 or count(hl7:procedure/hl7:code)=1"
			>ERRORE-223|Sezione Piani di cura: entry/procedure DEVE contenere un solo elemento code </assert>
			<assert test="count(hl7:procedure/hl7:effectiveTime)=0 or (count(hl7:procedure/hl7:effectiveTime[@value])=1 or count(hl7:procedure/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-224|Sezione Piani di cura: entry/procedure/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale.</assert>
		
		<!--Sezione Piani di cura: encounter-->
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter[@moodCode='INT' or @moodCode='ARQ' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-225|Sezione Piani di cura: entry/encounter DEVE avere l'attributo @moodCode valorizzato con uno dei seguenti valori: 'INT' or 'ARQ' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.4'])=1"
			>ERRORE-226|Sezione Piani di cura: entry/encounter DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.4'</assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:id)=1"
			>ERRORE-227|Sezione Piani di cura: entry/encounter DEVE contenere un solo elemento 'id'.</assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:code)=1"
			>ERRORE-228|Sezione Piani di cura: entry/encounter DEVE contenere un solo elemento 'code' </assert>
			<assert test="count(hl7:encounter)=0 or count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.14' or @codeSystem='2.16.840.1.113883.5.4'])=1"
			>ERRORE-229|Sezione Piani di cura: entry/encounter/code DEVE essere valorizzato secondo il value set "EncounterCode" - @codeSystem='2.16.840.1.113883.2.9.77.22.11.14' </assert>
			<assert test="count(hl7:encounter/hl7:effectiveTime)=0 or (count(hl7:encounter/hl7:effectiveTime/@value)=1 or count(hl7:encounter/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-230|Sezione Piani di cura: entry/encounter/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale. </assert>
		
		<!--Sezione Piani di cura: act-->
			<assert test="count(hl7:act)=0 or count(hl7:act[@moodCode='INT' or @moodCode='ARQ' or @moodCode='PRMS' or @moodCode='PRP' or @moodCode='RQO'])=1"
			>ERRORE-231|Sezione Piani di cura: entry/act DEVE acere l'attributo @moodCode valorizzato secondo i seguenti valori: 'INT' or 'ARQ' or 'PRMS' or 'PRP' or 'RQO'</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.10.5'])=1"
			>ERRORE-232|Sezione Piani di cura: entry/act DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.10.5'</assert>
			<assert test="count(hl7:act)=0 or count(hl7:act/hl7:id)=1"
			>ERRORE-233|Sezione Piani di cura: entry/act DEVE contenere un solo elemento 'id' </assert>
			<assert test="count(hl7:act/hl7:effectiveTime)=0 or (count(hl7:act/hl7:effectiveTime[@value])=1 or count(hl7:act/hl7:effectiveTime/hl7:low)=1)"
			>ERRORE-234|Sezione Piani di cura: entry/act/effectiveTime DEVE avere l'attributo @value valorizzato nel caso si voglia descrivere un preciso istante (point in time)
			oppure DEVE avere l'elemento 'low' valorizzato nel caso si voglia indicare un intervallo temporale. </assert>
			
		</rule>
		
		
		
		<!--11-->
		<!--Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: controllo delle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47519-4']]/hl7:entry">
			
			<assert test="count(hl7:procedure/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.11.1'])=1"
			>ERRORE-235| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: entry/procedure DEVE contenere un elemento 'templateId' valorizzato con l'attributo @root='2.16.840.1.113883.2.9.10.1.4.3.11.1'. </assert>
			<assert test="(count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.6.103'])=1 or
			count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.12'])=1 or
			count(hl7:procedure/hl7:code[@codeSystem='2.16.840.1.113883.11.22.36'])=1)"
			>ERRORE-236| Sezione Trattamenti e procedure terapeutiche, chirurgiche e diagnostiche: entry/procedure DEVE contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
			- LOINC (@codeSystem: 2.16.840.1.113883.6.1)
			- ICD-9-CM (@codeSystem: 2.16.840.1.113883.6.103)
			- ProcedureTrapianti_PSSIT (2.16.840.1.113883.2.9.77.22.11.12)
			- IPSNoProceduresInfos  (@codeSystem='2.16.840.1.113883.11.22.36').</assert>
			
		</rule>	
	

	
		<!--12-->
		<!--Visite o ricoveri-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='46240-8']]/hl7:entry">
			
			<assert test="count(hl7:encounter[@moodCode='EVN'])=1"
			>ERRORE-237| Sezione Visite o ricoveri: entry/encounter DEVE avere l'attributo @moodCode valorizzato con 'EVN'.</assert>
			<assert test="count(hl7:encounter/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.12.1'])=1"
			>ERRORE-238| Sezione Visite o ricoveri: entry/encounter DEVE contenere un elemento 'templateId valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.12.1'.</assert>
			<assert test="count(hl7:encounter/hl7:id)=1"
			>ERRORE-239| Sezione Visite o ricoveri: entry/encounter DEVE contenere un 'id'.</assert>
			
			<assert test="(count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.6.1'])=1 or 
			count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.2.9.77.22.11.14'])=1 or 
			count(hl7:encounter/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1)"
			>ERRORE-240| Sezione Visite o ricoveri: entry/encounter DEVE contenere un elemento 'code' valorizzato secondo i seguenti sistemi di codifica:
			- LOINC (@codeSystem: 2.16.840.1.113883.6.1)
			- EncounterCode (@codeSystem=2.16.840.1.113883.2.9.77.22.11.14) (derivato da ActCode)
			- ActCode  (@codeSystem=2.16.840.1.113883.5.4).</assert>
			
			<assert test="count(hl7:encounter/hl7:text)=0 or count(hl7:encounter/hl7:text/hl7:reference/@value)=1"
			>ERRORE-241| Sezione Visite o ricoveri: entry/encounter/text DEVE contenere un elemento reference/@value valorizzato con l’URI che punta alla descrizione estesa della visita o ricovero nel narrative block della sezione.</assert>
		
			<report test="not(count(hl7:encounter/hl7:performer)=1)"
			>W004| Sezione Visite o ricoveri: si consiglia di valorizzare, all'interno di entry/encounter, almeno un elemento 'performer'.--> </report>
		
		</rule>


	
		<!--13-->
		<!--Sezione Stato funzionale del paziente: controllo delle entry-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:entry">
			
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.1'])=1"
			>ERRORE-242| Sezione Stato funzionale del paziente: entry/organizer DEVE contenere un 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.1'. </assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation/hl7:code[@code='75246-9']])=1"
			>ERRORE-243| Sezione Stato funzionale del paziente: entry/organizer DEVE contenere  una ed una sola component/observation relativa alla "Capacità motoria". </assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation/hl7:code[@code!='75246-9']])=0 or
			(count(hl7:organizer/hl7:component[hl7:observation/hl7:code[@code!='75246-9']])&lt;=1)"
			>ERRORE-244| Sezione Stato funzionale del paziente: entry/organizer può contenere una ed una sola component/observation relativa al "Regime di assistenza" </assert>			
			
			<!--capacità motoria-->
			<assert test="count(hl7:organizer/hl7:component/hl7:observation/hl7:code[@code='75246-9'][@codeSystem='2.16.840.1.113883.6.1'])=1"
			>ERRORE-245| Sezione Stato funzionale del paziente: entry/organizer/component/observation (Capacità motoria) DEVE contenere un elemento 'code' valorizzato con @code='75246-9' e @codeSystem='2.16.840.1.113883.6.1'</assert>			
			<assert test="count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code='75246-9']]/hl7:value[@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.2.9.77.22.11.15'])=1"
			>ERRORE-246| Sezione Stato funzionale del paziente: entry/organizer/component/observation (Capacità motoria) DEVE contenere un elemento 'value' valorizzato secondo i seguenti code system:
			- LOINC (@codeSystem: 2.16.840.1.113883.6.1)
			- CapacitàMotoria_PSSIT  (@codeSystem=2.16.840.1.113883.2.9.77.22.11.15). </assert>
			
			<!--regime di assistenza-->
			<assert test="count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']])=0 or 
			count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']]/hl7:code[@codeSystem='2.16.840.1.113883.5.4'])=1"
			>ERRORE-247| Sezione Stato funzionale del paziente: entry/organizer/component/observation (Regime di assistenza) DEVE contenere un elemento 'code' valorizzato secondo il code system "ActCode" - @codeSystem='2.16.840.1.113883.5.4' </assert>
			<assert test="count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']]/hl7:value)=0 or
			count(hl7:organizer/hl7:component/hl7:observation[hl7:code[@code!='75246-9']]/hl7:value[@codeSystem='2.16.840.1.113883.2.9.5.2.8'])=1"
			>ERRORE-248| Sezione Stato funzionale del paziente: entry/organizer/component/observation/value (Regime di assistenza) DEVE essere valorizzato secondo il value set "AssistenzaDomiciliare_PSSIT" - @codeSystem='2.16.840.1.113883.2.9.5.2.8' </assert>
								
		</rule>
		
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='47420-5']]/hl7:entry/hl7:organizer/hl7:component">
			
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.2'])=1"
				>ERRORE-249| Sezione Stato funzionale del paziente: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.2'. </assert>
						
			</rule>
			
		
		
		
		<!--14-->
		<!--Indagini diagnostiche ed esami di laboratorio-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry">
			
			<assert test="count(hl7:organizer/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.1'])=1"
			>ERRORE-250| Sezione Indagini diagnostiche ed esami di laboratorio:  entry/organizer DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.1'. </assert>
			<assert test="count(hl7:organizer/hl7:component[hl7:observation])>=1"
			>ERRORE-251| Sezione Indagini diagnostiche ed esami di laboratorio:  entry/organizer DEVE contenere almeno un elemento 'component' di tipo 'observation'</assert>
			
		</rule>
			
			<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='30954-2']]/hl7:entry/hl7:organizer/hl7:component">
				
				<assert test="count(hl7:observation/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.14.2'])=1"
				>ERRORE-252| Sezione Indagini diagnostiche ed esami di laboratorio: entry/organizer/component/observation DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.14.2'.</assert>
				<assert test="count(hl7:observation/hl7:id)=1"
				>ERRORE-253| Sezione Indagini diagnostiche ed esami di laboratorio: entry/organizer/component/observation DEVE contenere un solo elemento 'id'.</assert>
				
			</rule>


		<!--16-->
		<!--Esenzioni-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='57827-8']]/hl7:entry">
			
			<assert test="count(hl7:act[@classCode='ACT'][@moodCode='EVN'])=1"
			>ERRORE-254| Sezione Esenzioni: entry/act DEVE avere valorizzati gli attributi nel seguente modo @classCode='ACT' e @moodCode='EVN'.</assert>		
			<assert test="count(hl7:act[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.17.1']])=1"
			>ERRORE-255| Sezione Esenzioni: entry/act DEVE contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.17.1'. </assert>
			
			<assert test="count(hl7:act/hl7:code[@codeSystem='2.16.840.1.113883.2.9.6.1.22' or @codeSystem='2.16.840.1.113883.2.9.5.2.2'])=1 or 
			matches(hl7:act/hl7:code/@codeSystem,'2.16.840.1.113883.2.9.2.[0-9]{3}.6.22')"
			>ERRORE-256| Sezione Esenzioni: entry/act/code DEVE essere valorizzato secondo i seguenti sistemi di codifica:
			- Catalogo Nazionale Esenzioni (2.16.840.1.113883.2.9.6.1.22)
			- Catalogo Regionale (2.16.840.1.113883.2.9.2.[REGIONE].6.22)
			- Catalogo Nazionale Nessuna Esenzione (2.16.840.1.113883.2.9.5.2.2)</assert>
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-257| Sezione Esenzioni: entry/act DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
						($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
						($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
						($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-258| Sezione Esenzioni: entry/act/effectiveTime DEVE avere un elemento 'high' nel caso in cui lo 'statusCode' è 'completed'|'aborted'.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:act)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
			>ERRORE-259| Sezione Esenzioni: entry/act/entryRelationship/act relativo a Note e Commenti deve contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'</assert>
		</rule>


		
		<!--17-->
		<!--Reti di patologia-->
		<rule context="hl7:ClinicalDocument/hl7:component/hl7:structuredBody/hl7:component/hl7:section[hl7:code[@code='PSSIT99']]/hl7:entry">
			
			<assert test="count(hl7:act[@classCode='PCPR'][@moodCode='EVN'])=1"
			>ERRORE-260| Sezione Reti di Patologia: entry/act DEVE avere gli attributi valorizzati nel seguente modo @classCode='PCPR' e @moodCode='EVN'.</assert>		
			<assert test="count(hl7:act[hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.18.1']])=1"
			>ERRORE-261| Sezione Reti di Patologia: entry/act DEVE avere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.18.1'. </assert>
			<assert test="count(hl7:act/hl7:id)=1"
			>ERRORE-262| Sezione Reti di Patologia: entry/act DEVE contenere un elemento 'id'.</assert>			
			<assert test="count(hl7:act/hl7:effectiveTime/hl7:low)=1"
			>ERRORE-263| Sezione Reti di Patologia: entry/act DEVE contenere un elemento 'effectiveTime' il quale deve avere l'elemento 'low' valorizzato.</assert>
			<let name="status" value="hl7:act/hl7:statusCode/@code"/>
			<assert test="($status='completed' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or
						($status='aborted' and count(hl7:act/hl7:effectiveTime/hl7:high)=1) or 
						($status='suspended' and count(hl7:act/hl7:effectiveTime/hl7:high)=0) or 
						($status='active' and count(hl7:act/hl7:effectiveTime/hl7:high)=0)"
			>ERRORE-264| Sezione Reti di Patologia: entry/act/effectiveTime DEVE contenere un elemento 'high' nel caso in cui lo 'statusCode' è 'completed'|'aborted'.</assert>
			<assert test="count(hl7:act/hl7:entryRelationship/hl7:act)=0 or 
			count(hl7:act/hl7:entryRelationship/hl7:act/hl7:templateId[@root='2.16.840.1.113883.2.9.10.1.4.3.1.7'])>=1"
			>ERRORE-265| Sezione Reti di Patologia: entry/act/entryRelationship/act relativo a Note e Commenti deve contenere un elemento 'templateId' valorizzato con @root='2.16.840.1.113883.2.9.10.1.4.3.1.7'</assert>
		
		</rule>
		
	</pattern>
</schema>