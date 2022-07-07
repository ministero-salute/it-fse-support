<!-- Copy and paste the converted output. -->

<!-----

You have some errors, warnings, or alerts. If you are using reckless mode, turn it off to see inline alerts.
* ERRORs: 0
* WARNINGs: 0
* ALERTS: 1

Conversion time: 8.022 seconds.


Using this Markdown file:

1. Paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β33
* Thu Jul 07 2022 07:08:06 GMT-0700 (PDT)
* Source doc: Copia di API_GTW_FSE2_DRAFT_Specifiche_swagger_1.5_rev
* Tables are currently converted to HTML tables.
* This document has images: check for >>>>>  gd2md-html alert:  inline image link in generated source and store images to your server. NOTE: Images in exported zip file from Google Docs may not appear in  the same order as they do in your doc. Please check the images!

----->


<p style="color: red; font-weight: bold">>>>>>  gd2md-html alert:  ERRORs: 0; WARNINGs: 0; ALERTS: 1.</p>
<ul style="color: red; font-weight: bold"><li>See top comment block for details on ERRORs and WARNINGs. <li>In the converted Markdown or HTML, search for inline alerts that start with >>>>>  gd2md-html alert:  for specific instances that need correction.</ul>

<p style="color: red; font-weight: bold">Links to alert messages:</p><a href="#gdcalert1">alert1</a>

<p style="color: red; font-weight: bold">>>>>> PLEASE check and correct alert issues and delete this message and the inline alerts.<hr></p>


**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST Gateway **


<table>
  <tr>
   <td>Versione
   </td>
   <td>:
   </td>
   <td>ver 1.5
   </td>
  </tr>
  <tr>
   <td>Classificazione
   </td>
   <td>:
   </td>
   <td>Diffusione limitata
   </td>
  </tr>
  <tr>
   <td>Distribuito a
   </td>
   <td>:
   </td>
   <td>
   </td>
  </tr>
</table>




**INDICE**


[TOC]






1. **Introduzione**
    1. **Riferimenti**

<table>
  <tr>
   <td>
<strong>RIF.</strong>
   </td>
   <td><strong>DOCUMENTO</strong>
   </td>
   <td><strong>DESCRIZIONE</strong>
   </td>
  </tr>
  <tr>
   <td>1
   </td>
   <td>http://www.hl7italia.it/hl7italia_D7/hl7it_publications
   </td>
   <td>Implementation Guide CDA R2
   </td>
  </tr>
  <tr>
   <td>2
   </td>
   <td>Affinity Domain 2.2
   </td>
   <td>Documento Affinity Domain
   </td>
  </tr>
  <tr>
   <td>3
   </td>
   <td>Linee Guida FSE
   </td>
   <td>Linee guida FSE
   </td>
  </tr>
</table>


_Tabella 1: Riferimenti Esterni_



    2. **Acronimi e Definizioni**

<table>
  <tr>
   <td>
<strong>ACRONIMO</strong>
   </td>
   <td><strong>DEFINIZIONE</strong>
   </td>
  </tr>
  <tr>
   <td>API
   </td>
   <td>Application Programming Interface
   </td>
  </tr>
  <tr>
   <td>REST
   </td>
   <td>REpresentational State Transfer
   </td>
  </tr>
  <tr>
   <td>FHIR
   </td>
   <td>Fast Healthcare Interoperability Resources
   </td>
  </tr>
  <tr>
   <td>CDA
   </td>
   <td>Clinical Document Architecture
   </td>
  </tr>
  <tr>
   <td>URI
   </td>
   <td>Uniform Resource Identifier
   </td>
  </tr>
  <tr>
   <td>JWT
   </td>
   <td>JSON Web Token
   </td>
  </tr>
  <tr>
   <td>INI
   </td>
   <td>Infrastruttura Nazionale per l’Interoperabilità
   </td>
  </tr>
  <tr>
   <td>FSE
   </td>
   <td>Fascicolo Sanitario Elettronico
   </td>
  </tr>
  <tr>
   <td>HL7
   </td>
   <td>Health Level 7
   </td>
  </tr>
  <tr>
   <td>GTW
   </td>
   <td>Gateway
   </td>
  </tr>
  <tr>
   <td>EDS
   </td>
   <td>Ecosistema Dati Sanitari
   </td>
  </tr>
  <tr>
   <td>N.A.
   </td>
   <td>Non Applicabile
   </td>
  </tr>
</table>


_Tabella 2: Acronimi e Definizioni_


<table>
  <tr>
   <td><strong>VERSIONE</strong>
   </td>
   <td><strong>DATA</strong>
   </td>
   <td><strong>MODIFICHE</strong>
   </td>
  </tr>
  <tr>
   <td>1.1
   </td>
   <td>20/05/22
   </td>
   <td>Paragrafi modificati
<p>
Tutti: prima stesura a seguito rivisitazione
   </td>
  </tr>
  <tr>
   <td>1.2
   </td>
   <td>07/06/22
   </td>
   <td>Paragrafi modificati
<p>
Tutti: stesura a seguito rivisitazione
   </td>
  </tr>
  <tr>
   <td>1.3
   </td>
   <td>13/06/22
   </td>
   <td>Paragrafi modificati
<p>
2.2: scenario integrazione gateway;
<p>
3.2: aggiornamento status code; esempio workflowInstancdID; esempio response con warning;
<p>
4.2: aggiornamento status code;
<p>
5.1: obbligatorietà campo patient_consent 
   </td>
  </tr>
  <tr>
   <td>1.4
   </td>
   <td>28/06/2022
   </td>
   <td>Paragrafi modificati
<p>
2: Contesto di riferimento con overview casi d’uso di validazione e pubblicazione CDA2;
<p>
3: aggiornamento paragrafo introduttivo per il servizio di validazione;
<p>
3.1: aggiornamento parametri della request del servizio di validazione e aggiunta colonna AFFINITY DOMAIN/ITI TF;
<p>
4: aggiornamento paragrafo introduttivo per il servizio di pubblicazione;
<p>
4.1: aggiornamento parametri della request del servizio di pubblicazione creazione e aggiunta colonna AFFINITY DOMAIN/ITI TF;
<p>
5.1: eliminata valorizzazione nella descrizione Tipo Attività;
<p>
5.3: stesura paragrafo introduttivo per le tabelle di riferimento;
<p>
5.3.1: aggiornamento tabella Attività Clinica secondo Affinity Domain versione 2.2;
<p>
5.3.5: aggiornamento tabella con eliminazione dei ruoli non pertinenti alla validazione e pubblicazione CDA2, eliminazione colonna Tipologie di Interazioni;
<p>
5.3.6: aggiornamento tabella con eliminazione dei valori non pertinenti alla validazione e pubblicazione CDA2, eliminazione colonna Tipologie di Interazioni;
<p>
5.3.12: eliminazione dei valori per il tipo di attività non pertinenti alla validazione e pubblicazione CDA2.
   </td>
  </tr>
  <tr>
   <td>1.5
   </td>
   <td>05/07/2022
   </td>
   <td>Correzioni su tutte le sezioni
   </td>
  </tr>
</table>


_Tabella 3: Registro Modifiche_



2. **Contesto di Riferimento**

        La nuova architettura del FSE prevede la presenza di un componente, denominato Gateway, adibito all’acquisizione, alla validazione, e alla traduzione di dati e documenti clinici secondo i formati definiti dalle Linee Guida FSE. Tali dati e documenti sono prodotti dai Sistemi in uso presso le Strutture Sanitarie (Sistemi Produttori). 


        In questo documento verranno indicate le modalità per usufruire dei servizi esposti dal gateway: il      documento sarà redatto in modo incrementale e di volta in volta ulteriori API saranno integrate e illustrate. 


        In questa prima fase, saranno trattati i servizi principali del Gateway ossia i due servizi che consentono rispettivamente di invocare le funzionalità di Validazione Documento CDA2 e di Pubblicazione Documento CDA2, descritte di seguito negli scenari applicativi di alto livello.


<table>
  <tr>
   <td>
<strong>Endpoint URL</strong>
   </td>
   <td><strong>Funzionalità</strong>
   </td>
  </tr>
  <tr>
   <td>/v<major>/validate-creation
   </td>
   <td>VALIDAZIONE DOCUMENTO CDA2 
   </td>
  </tr>
  <tr>
   <td>/v<major>/publish-creation
   </td>
   <td>PUBBLICAZIONE DOCUMENTO CDA2
   </td>
  </tr>
</table>


_Tabella 4: Endpoint/Funzionalità_


        La Pubblicazione di un documento CDA2 deve essere sempre preceduta da una Validazione Documento CDA2. Una Validazione Documento CDA2 può non essere seguita dalla Pubblicazione CDA2. Questo avverrà soprattutto nella fase iniziale in cui si utilizzerà il solo servizio di validazione per i vari test.  Per distinguere questi due casi è stato introdotto il campo “Activity” specificato nelle successive sezioni.


        I due servizi sono correlati da un identificativo di transazione referenziato nel documento come “workflowInstanceId” secondo standard IHE (Data Type  CXi)


        **Validazione Documento CDA2**


        Nello scenario di questa funzionalità il Sistema Produttore invia un documento           secondo il formato standard HL7 CDA2, ed iniettato      in un PDF. 


        Il servizio è sincrono, e implementa le validazioni ed i controlli sintattici e semantici. In caso di un esito con errore, verranno restituiti i dettagli di questo indicati nell’apposita sezione in “Response”.


        In caso di validazione eseguita con successo, l’esito tornato è positivo e la Validazione può ritenersi conclusa correttamente. L’hash del documento CDA2 verrà salvato in cache con chiave “workflowInstanceId”. In risposta verrà ritornato l’identificativo “workflowInstanceId”.


        **Pubblicazione Documento CDA2**


        Nello scenario di questa funzionalità il Repository Documentale locale invia il documento      secondo il formato standard HL7 CDA2 ed iniettato      in PDF firmato      digitalmente in modalità PADES, corredato di alcuni metadati come di seguito indicato. Il documento CDA2 innestato nel documento dovrà corrispondere a quello      precedentemente validato     secondo il servizio di Validazione Documenti CDA2.


        La verifica della corrispondenza verrà fatta calcolando l’hash del CDA2 estrapolato dal PDF. Il processo di Pubblicazione procederà soltanto se l’hash coincide con quello calcolato nel flusso di validazione (recuperato dalla cache tramite il “workflowInstanceId”).


        Il servizio ha lo scopo di effettuare la conversione del dato in ingresso in formato FHIR per l’invio verso EDS, e preparare i metadati del documento per la comunicazione verso INI ai fini della indicizzazione.


        Il servizio è sincrono e fornisce un acknowledgment di presa in carico.



    1. **Pattern di Interazione**

        Le API sono esposte secondo i pattern definiti nelle Linee Guida Modello di Interoperabilità[^1] definite da Agid.


        Come scenario di interazione per i servizi esposti dal Gateway viene utilizzato il pattern [BLOCK_REST] Blocking REST[^2]<sup>.</sup>



    2. **Processo di Autenticazione**[^3]

        Il processo di autenticazione rispetta i seguenti pattern delle suddette Linee Guida:



* ID_AUTH_CHANNEL_02 [^4]


* ID_AUTH_REST_01[^5]

        Di seguito un diagramma che descrive un esempio di interazione per i due servizi descritti di seguito:



![sequence_diagram](img/sequence.png "sequence diagram")




1. **Servizio di Validazione**

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 5 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Validazione Documento CDA2 si compone come segue:

**Errore. Riferimento a collegamento ipertestuale non valido.**

Lo scopo di questa API è validare da un punto di vista sintattico e semantico i dati forniti dal Sistema Produttore.



    3. **Request**

<table>
  <tr>
   <td>
METHOD
   </td>
   <td>POST
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/validate-creation
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>multipart/form-data
   </td>
  </tr>
</table>


_Tabella 5: Method, Url, Type_


<table>
  <tr>
   <td colspan="6" >     <strong>PARAMETER</strong>
   </td>
  </tr>
  <tr>
   <td><strong>SECTION</strong>
   </td>
   <td><strong>KEY</strong>
   </td>
   <td><strong>VALUE</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>REQUIRED</strong>
   </td>
   <td><strong>AFFINITY DOMAIN/ IHE</strong>
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>N.D.
   </td>
   <td>Authorization
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td rowspan="4" >Request
<p>
Body
   </td>
   <td>file
   </td>
   <td>file
   </td>
   <td>MultipartFile
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td rowspan="3" >requestBody
   </td>
   <td>healthDataFormat
   </td>
   <td>HealthDataFormatEnum
   </td>
   <td>false
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>mode
   </td>
   <td>InjectionModeEnum
   </td>
   <td>false
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>activity
   </td>
   <td>ActivityEnum
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
</table>


_Tabella 6: Parametri Richiesta di Validazione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “mode” comporta la restituzione di un errore di tipo warning, mentre la non compilazione del parameter facoltativo “healthDataFormat” non comporta errori di tipo warning. 

Il Request Body è di tipo **multipart/form-data**, al suo interno sono previsti due parametri:



* **file **che dovrà contenere un file PDF con iniettato un Clinical Document in formato XML in linea con quanto riportato nelle «Implementation Guide CDA R2» al link [1]
* **requestBody **che dovrà contenere l’oggetto json con i parameter di input
        1. **_Messaggio di richiesta, esempio “Validation con Attachment”_**

Messaggio di richiesta con activity “VALIDATION” (validazione ai fini della successiva pubblicazione), pdf con CDA innestato in modalità ATTACHMENT e tipo documento CDA



        2. **_Messaggio di richiesta, esempio “Verifica con Attachment”_**

Messaggio di richiesta con activity “VERIFICA” (validazione che non sarà seguita da pubblicazione), pdf con CDA innestato in modalità ATTACHMENT ma senza specificarlo nella request, tipo documento CDA



        3. **_Messaggio di richiesta, esempio “Verifica con resource”_**

Messaggio di richiesta con activity “VERIFICA” (validazione che non sarà seguita da pubblicazione), pdf con CDA innestato in modalità  RESOURCE, tipo documento CDA



    4. **Response**

<table>
  <tr>
   <td>
TIPO IN CASO DI SUCCESSO
   </td>
   <td colspan="2" >application/json
   </td>
  </tr>
  <tr>
   <td>TIPO IN CASO DI ERRORE
   </td>
   <td colspan="2" >application/problem+json
   </td>
  </tr>
  <tr>
   <td rowspan="10" >STATUS CODE
   </td>
   <td>200
   </td>
   <td>Validazione positiva a seguito di activity verifica*
   </td>
  </tr>
  <tr>
   <td>201
   </td>
   <td>Validazione positiva a seguito di activity validation*
   </td>
  </tr>
  <tr>
   <td>400
   </td>
   <td>Bad request
   </td>
  </tr>
  <tr>
   <td>401
   </td>
   <td>Unauthorized
   </td>
  </tr>
  <tr>
   <td>403
   </td>
   <td>Token jwt mancante
   </td>
  </tr>
  <tr>
   <td>415
   </td>
   <td>Unsupported media type
   </td>
  </tr>
  <tr>
   <td>422
   </td>
   <td>Richiesta semanticamente non processabile
   </td>
  </tr>
  <tr>
   <td>429
   </td>
   <td>Too Many Requests
   </td>
  </tr>
  <tr>
   <td>500
   </td>
   <td>Internal server error
   </td>
  </tr>
  <tr>
   <td>502
   </td>
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
</table>


_Tabella 7: Response Servizio di Validazione_

* il code 200 sarà restituito in caso di Success e a seguito dell’invocazione del servizio di validazione con l’indicazione del parameter “activity” impostato a VERIFICA (vedere spiegazioni successive). * il code 201 invece sarà restituito in caso di Success e a seguito dell’invocazione del servizio di validazione con l’indicazione del parameter “activity” impostato a VALIDATION.

**Campi sempre valorizzati**


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>traceID
   </td>
   <td>String
   </td>
   <td>Identificativo univoco assegnato alla richiesta dell'utente. È sempre presente a differenza del workflowInstanceId poiché il valore di quest’ultimo dipende dal CDA preso in input
   </td>
  </tr>
  <tr>
   <td>spanID
   </td>
   <td>String
   </td>
   <td>Identificativo univoco assegnato alla  singola operazione nell’ambito della richiesta dell'utente. In caso di richiesta avente operazioni multiple (su più microservizi), ognuna di esse avrà un differente spanId (ma stesso traceId). \
traceId e spanId coincidono nella prima operazione.
   </td>
  </tr>
  <tr>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>Identificativo univoco della transazione
   </td>
  </tr>
</table>


_Tabella 8: Campi Response sempre valorizzati_

**Campi valorizzati solo in caso d’errore applicativo**


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>type
   </td>
   <td>String
   </td>
   <td>URI da utilizzare come identificativo del problema che si è verificato
   </td>
  </tr>
  <tr>
   <td>title
   </td>
   <td>String
   </td>
   <td>Descrizione sintetica della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>status
   </td>
   <td>Integer
   </td>
   <td>Stato http
   </td>
  </tr>
  <tr>
   <td>detail
   </td>
   <td>String
   </td>
   <td>Dettaglio della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>instance
   </td>
   <td>String
   </td>
   <td>URI opzionale che identifica la specifica occorrenza del problema.  \
Può differire dal type in caso sia necessario specificare il problema con maggiore dettaglio
   </td>
  </tr>
</table>


_Tabella 9: Campi Response valorizzati in caso di errore_

**Campi valorizzati in caso d’errore proveniente da apparati di frontiera**

Gli errori provenienti dagli apparati di frontiera sono errori infrastrutturali o di sicurezza (ad esempio token mancante o scaduto, request non conforme alle specifiche) che vengono intercettati e notificati prima che la richiesta raggiunga i microservizi.


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>type
   </td>
   <td>String
   </td>
   <td>URI da utilizzare come identificativo del problema che si è verificato
   </td>
  </tr>
  <tr>
   <td>Title
   </td>
   <td>String
   </td>
   <td>Descrizione sintetica della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>status
   </td>
   <td>Integer
   </td>
   <td>Stato http
   </td>
  </tr>
  <tr>
   <td>detail
   </td>
   <td>String
   </td>
   <td>Dettaglio della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>govway_id
   </td>
   <td>String
   </td>
   <td>Identificativo di transazione che permette di individuare la transazione tramite la Console di Monitoraggio GovWay
   </td>
  </tr>
</table>


_Tabella 17: Campi Response valorizzati in caso di errore govWay_

**Campi valorizzati solo in caso di warning:**


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>warning
   </td>
   <td>String
   </td>
   <td>Dettaglio del warning
   </td>
  </tr>
</table>


_Tabella 10: Campi Response valorizzati in caso di warning_



        4. **_Messaggio di risposta, esempio “Validation con Attachment” con esito Success 201 _**
        5. **_Messaggio di risposta, esempio “Validation con Attachment” con esito KO 400_**
        1. **_Messaggio di risposta, esempio “Verifica con Attachment” con esito OK 200 con warning_**
1. **Servizio di Pubblicazione Creazione**

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 5 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Documento CDA2 si compone come segue:

**Errore. Riferimento a collegamento ipertestuale non valido.**

Lo scopo di questa API è indicizzare un nuovo documento clinico sul FSE regionale, tradurre i dati clinici nel formato HL7 FHIR ed inviarli al Data Repository Centrale.



    1. **Request**

<table>
  <tr>
   <td>
METHOD
   </td>
   <td>POST
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/publish-creation
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>multipart/form-data
   </td>
  </tr>
</table>


_Tabella 11: Method, URL, Type_


<table>
  <tr>
   <td colspan="6" >     <strong>PARAMETER</strong>
   </td>
  </tr>
  <tr>
   <td><strong>SECTION</strong>
   </td>
   <td><strong>KEY</strong>
   </td>
   <td><strong>NAME</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>REQUIRED</strong>
   </td>
   <td><strong>AFFINITY DOMAIN/IHE</strong>
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>N.D.
   </td>
   <td>Authorization
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td rowspan="16" >Request Body
   </td>
   <td>file
   </td>
   <td>file
   </td>
   <td>MultipartFile
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td rowspan="15" >requestBody
   </td>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>True
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>healthDataFormat
   </td>
   <td>HealthDataFormatEnum
   </td>
   <td>false
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>mode
   </td>
   <td>InjectionModeEnum
   </td>
   <td>false
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>tipologiaStruttura
   </td>
   <td>HealthcareFacilityEnum
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.healthcareFacilityTypeCode
   </td>
  </tr>
  <tr>
   <td> attiCliniciRegoleAccesso
   </td>
   <td>List<EventCodeEnum>
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.eventCodeList
   </td>
  </tr>
  <tr>
   <td>identificativoDoc
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.uniqueId
   </td>
  </tr>
  <tr>
   <td>identificativoRep
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.repositoryUniqueId
   </td>
  </tr>
  <tr>
   <td>tipoDocumentoLivAlto
   </td>
   <td>TipoDocAltoLivEnum
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.classCode
   </td>
  </tr>
  <tr>
   <td>assettoOrganizzativo
   </td>
   <td>PracticeSettingCodeEnum
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.practiceSettingCode
   </td>
  </tr>
  <tr>
   <td>dataInizioPrestazione
   </td>
   <td>String
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry. serviceStartTime (ITI TF 3: 4.2.3.2.19)
   </td>
  </tr>
  <tr>
   <td>dataFinePrestazione
   </td>
   <td>String
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.serviceStopTime (ITI TF 3: 4.2.3.2.20)
   </td>
  </tr>
  <tr>
   <td>conservazioneANorma
   </td>
   <td>String
   </td>
   <td>false
   </td>
   <td>urn:ita:2017:repository-type
   </td>
  </tr>
  <tr>
   <td>tipoAttivitaClinica
   </td>
   <td>AttivitaClinicaEnum
   </td>
   <td>true
   </td>
   <td>XDSSubmissionSet.contentTypeCode
   </td>
  </tr>
  <tr>
   <td>identificativoSottomissione
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>XDSSubmissionSet.uniqueId (ITI TF:3 4.2.3.3.12)
   </td>
  </tr>
  <tr>
   <td>priorita
   </td>
   <td>boolean
   </td>
   <td>false
   </td>
   <td>N.A.
   </td>
  </tr>
</table>


_Tabella 12: Parametri Richiesta di Pubblicazione Creazione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “mode” comporta la resituzione di un errore di tipo warning. 

Il Request Body è di tipo **multipart/form-data**, al suo interno sono previsti due parametri:



* **file **che dovrà contenere un file PDF con iniettato un Clinical Document in formato XML in linea con quanto riportato nelle «Implementation Guide CDA R2» al link [1]
* **requestBody **che dovrà contenere l’oggetto json con i parameter di input
        2. **_Messaggio di Richiesta, esempio “Pubblicazione con Attachment”_**

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti, senza indicazione della priorità. 

Il workflowInstanceId è corretto e presente nel gateway.



        3. **_Messaggio di Richiesta, esempio “Pubblicazione con Resource”_**

Messaggio di richiesta con pdf con CDA innestato in modalità RESOURCE, tipo documento CDA e metadati formalmente corretti, con indicazione della priorità.

In questo caso, il workflowInstanceId non esiste nel gateway.





    2. **Response**

<table>
  <tr>
   <td>
TIPO IN CASO DI SUCCESSO
   </td>
   <td colspan="2" >application/json
   </td>
  </tr>
  <tr>
   <td>TIPO IN CASO DI ERRORE*
   </td>
   <td colspan="2" >application/problem+json
   </td>
  </tr>
  <tr>
   <td rowspan="7" >STATUS CODE
   </td>
   <td>     201
   </td>
   <td>Presa in carico eseguita con successo
   </td>
  </tr>
  <tr>
   <td>400
   </td>
   <td>Bad request** (input non valido o validazione/ pubblicazione non corretta)
   </td>
  </tr>
  <tr>
   <td>401
   </td>
   <td>Unauthorized
   </td>
  </tr>
  <tr>
   <td>415
   </td>
   <td>Unsupported media type
   </td>
  </tr>
  <tr>
   <td>429
   </td>
   <td>Too Many Requests
   </td>
  </tr>
  <tr>
   <td>500
   </td>
   <td>Internal server error
   </td>
  </tr>
  <tr>
   <td>502
   </td>
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
</table>


_Tabella 13: Response Servizio di Pubblicazione_

* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807

** La pubblicazione verifica l’avvenuta validazione. In caso di assenza, risponderà con codice di errore 400

**Campi sempre valorizzati**


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>traceID
   </td>
   <td>String
   </td>
   <td>Identificativo univoco assegnato alla richiesta dell'utente. È sempre presente a differenza del workflowInstanceId poiché il valore di quest’ultimo dipende dal CDA preso in input
   </td>
  </tr>
  <tr>
   <td>spanID
   </td>
   <td>String
   </td>
   <td>Identificativo univoco assegnato ad un singolo operazione della richiesta dell'utente. In caso di richiesta avente operazioni multiple (su più microservizi), ognuna di esse avrà un differente spanId (ma stesso traceId). \
traceId e spanId coincidono nella prima operazione.
   </td>
  </tr>
</table>


_Tabella 14: Campi Response sempre valorizzati_

**Campi valorizzati solo in caso d’errore applicativo**


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>type
   </td>
   <td>String
   </td>
   <td>URI da utilizzare come identificativo del problema che si è verificato
   </td>
  </tr>
  <tr>
   <td>title
   </td>
   <td>String
   </td>
   <td>Descrizione sintetica della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>status
   </td>
   <td>Integer
   </td>
   <td>Stato http
   </td>
  </tr>
  <tr>
   <td>detail
   </td>
   <td>String
   </td>
   <td>Dettaglio della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>instance
   </td>
   <td>String
   </td>
   <td>URI opzionale che identifica la specifica occorrenza del problema.  \
Può differire dal type in caso sia necessario specificare il problema con maggiore dettaglio
   </td>
  </tr>
</table>


_Tabella 15: Campi Response valorizzati in caso di errore applicativo_

Campi valorizzati solo in caso di warning:


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>warning
   </td>
   <td>String
   </td>
   <td>Dettaglio del warning
   </td>
  </tr>
</table>


_Tabella 16: Campi Response valorizzati in caso di warning_

**Campi valorizzati in caso d’errore proveniente da apparati di frontiera**

Gli errori provenienti dagli apparati di frontiera sono errori infrastrutturali o di sicurezza (ad esempio token mancante o scaduto, request non conforme alle specifiche)


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td>type
   </td>
   <td>String
   </td>
   <td>URI da utilizzare come identificativo del problema che si è verificato
   </td>
  </tr>
  <tr>
   <td>Title
   </td>
   <td>String
   </td>
   <td>Descrizione sintetica della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>status
   </td>
   <td>Integer
   </td>
   <td>Stato http
   </td>
  </tr>
  <tr>
   <td>detail
   </td>
   <td>String
   </td>
   <td>Dettaglio della tipologia d’errore
   </td>
  </tr>
  <tr>
   <td>govway_id
   </td>
   <td>String
   </td>
   <td>Identificativo di transazione che permette di individuare la transazione tramite la Console di Monitoraggio GovWay
   </td>
  </tr>
</table>


_Tabella 17: Campi Response valorizzati in caso di errore govWay_



        4. **_Messaggio di Risposta, esempio “Pubblicazione con Attachment”  Success 200_**
        1. **_Messaggio di Risposta, esempio “Pubblicazione con Resource” con esito KO 400_**

{

  "traceID": "61d8123fb20e2afc",

  "spanID": "61d8123fb20e2afc",

  "type": "/msg/cda-element",

  "title": "Errore in fase di recupero dell'esito della verifica.",

  "detail": "Il CDA non risulta validato",

  "status": 400,

  "instance": "/msg/cda-element"

}



1. **Drilldown Parametri di Input**

        Come riportato nel documento "Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Framework e dataset dei servizi base - Versione 2.2” l’interoperabilità fra i differenti sistemi di FSE a livello nazionale è assicurata tramite INI. 


        INI rappresenta un mediatore per le comunicazioni tra i diversi sistemi regionali che appartengono allo stesso Affinity Domain, in grado di garantire ad un sistema di FSE di una regione diversa da quella di assistenza l’accesso ai documenti.


        Per individuare i parametri di input dei servizi di pubblicazione relativi alla creazione è necessario quindi fare riferimento al dataset del servizio base di comunicazione metadati presentato al paragrafo 3.3 del documento citato in precedenza.


        I campi dei messaggi di richiesta comunicazione metadati riportati nella tabella 9 sono suddivisi per tipologia, in particolare possiamo individuare:

* I campi “asserzione attributo”

            Campi aventi una natura tale da richiedere una certificazione da parte di Sistemi preposti; proprio per rispettare tale vincolo, i campi in questione dovranno essere inviati al Gateway attraverso il JWT fornito nell’header della chiamata.

* I campi “specifici per messaggio”

            Campi che possono essere forniti al Gateway direttamente tramite la request body.


        Nella parte restante di questo paragrafo saranno descritti puntualmente i campi recuperati dal JWT (che coincidono con i campi “asserzione attributo”) e quelli recuperati dalla request body (che nascono dall’unione dei campi “specifici per messaggio” che non possono essere dedotti dal contesto di invocazione, con dei campi aggiuntivi utili a rendere l’azione del Gateway efficace ed efficiente).

    1. **Campi Contenuti nel JWT**

<table>
  <tr>
   <td colspan="2" >
        <strong>HEADER: ALGORITHM & TOKEN TYPE</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2" >
<strong>ALG</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Algoritmo utilizzato per la firma del token. Valori ammessi: RS256, RS383, RS512
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>RS256
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>alg
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>TYPE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Tipologia di token. DEVE essere valorizzato con il valore 'JWT'.
   </td>
  </tr>
  <tr>
   <td><strong>VALORE</strong>
   </td>
   <td>JWT
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>typ
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>KID</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Un riferimento opzionale alla chiave usata per la firma del token. Anche se valorizzato non viene utilizzato nella fase di verifica.
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>Client11
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Opzionale
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>kid
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>XC5</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>certificato X.509 utilizzato per la firma del token. \
Valore in formato DER, codificato in base64.
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>x5c
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>RESERVED CLAIMS</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>ISSUER</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td> Stringa che contiene il nome identificativo dell’entità che ha generato il token. Valorizzato con “Common Name del certificato di firma”
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>190201123456XX
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>iss
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>ISSUED AT</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Numero intero (timestamp in secondi) che indica il momento in cui il token è stato generato, serve per conoscere l’età di un token
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>1540890704
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>iat
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>EXPIRATION</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Numero intero (timestamp in secondi) che indica fino a quando il token sarà valido
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>1540918800
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>exp
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>JWT ID</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identificativo univoco del token, serve per prevenire la generazione accidentale di token uguali
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>1540918800
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>Jti
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>AUDIENCE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Indica il destinatario per cui è stato creato il token, da valorizzare con la base URL del servizio, comprensivo della versione, per esempio https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1
   </td>
  </tr>
  <tr>
   <td><strong>VALORE</strong>
   </td>
   <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>aud
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>SUBJECT</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Codice Fiscale dell’utente che fa richiesta del servizio di interoperabilità
<p>
Formato codifica conforme alle specifiche IHE (ITI TF-3)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>VRDMRC67T20I257E^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>sub
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>CUSTOM CLAIMS</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>IDENTIFICATIVO ORGANIZZAZIONE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identificativo del dominio dell’utente (vedi TABELLA ORGANIZZAZIONE)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>120
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>subject_organization_id
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="2" ><strong>DESCRIZIONE ORGANIZZAZIONE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Descrizione del dominio dell’utente (vedi TABELLA ORGANIZZAZIONE)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>Regione Lazio
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>subject_organization
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>STRUTTURA UTENTE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identificativo della struttura utente.
<p>
Codifica ISTAT della Azienda (ASL) concatenato alla codifica HSP.11 - HSP.11bis - STS.11 - RIA.11. \
     Nel caso di ruolo APR assume il valore del codice ISTAT dell’Azienda (ASL)
<p>
Le codifiche saranno ampliate per coprire tutte le casistiche mancanti.
<p>
Riferimento: urn:oasis:names:tc:xspa:1.0:environment:locality
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>201123456 (caso struttura) – 201 (caso ruolo APR)
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>locality
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>RUOLO UTENTE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Ruolo dell’utente che effettua la richiesta, vedi TABELLA RUOLO
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>AAS
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>subject_role
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>IDENTIFICATIVO ASSISTITO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Codice identificativo dell’assistito cui si riferisce la richiesta o del  \
genitore/tutore che ha richiesto l’operazione \
Codice identificativo dell’assistito, del genitore o del tutore, codificato secondo il tipo di dato CX HL7 V2.5 (per come indicato alle specifiche IHE TF-3)
<p>
Saranno trattati tutti i soggetti presenti in ANA
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>RSSMRA75C03F839K^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>person_id
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>PRESA IN CARICO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Indica la presa in carico del paziente. \
Valore booleano
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>true
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>patient_consent
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="2" ><strong>CONTESTO OPERATIVO RICHIESTA</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Contesto operativo della richiesta \
Vedi TABELLA CONTESTO OPERATIVO
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>TREATMENT
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO_JWT</strong>
   </td>
   <td>purpose_of_use
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="2" ><strong>TIPO DOCUMENTO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Tipo di documento da registrare \
Codifica LOINC nel formato ('code1^^coding-scheme1')
<p>
Riferimento: urn:oasis:names:tc:xspa:1.0:resource:hl7:type
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>('11502-2^^2.16.840.1.113883.6.1')
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Non Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>resource_hl7_type
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>TIPO ATTIVITA’</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Descrive il tipo di attività     
<p>
Vedi TABELLA TIPO ATTIVITA’
<p>
Riferimento: urn:oasis:names:tc:xacml:1.0:action:action-id
   </td>
  </tr>
  <tr>
   <td><strong>VALORE</strong>
   </td>
   <td>CREATE
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>action_id
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>HASH FILE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Hash del file fornito in input
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>ccd1a23b4a73c838e4dfc2a1948aaec8389ebd331cbaebc1b3144c74fca17da5
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio (in fase di pubblicazione)
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td>attachment_hash
   </td>
  </tr>
</table>


_Tabella 17: Campi contenuti nel JWT_



**Esempio di utilizzo del token**

Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg

**Esempio di token decodificato, sezione header**

{

  "alg": "RS256",

  "typ": "JWT",

  "x5c": [

    "MIIDXjCCAkagAwIBAgIBAjANBgkqhkiG9w ... 779BM4SOI="

  ]

}

**Esempio di token decodificato, sezione body**

{ \
  "sub": "RSSMRA22A01A399Z", \
  "subject_role": "AAS", \
  "purpose_of_use": "TREATMENT", \
  "iss": "190201123456XX", \
  "locality": "201123456", \
  "subject_organization": "Regione Sicilia", \
  "subject_organization_id": "190", \
  "aud": "[https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1"](https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1%22), \
  "patient_consent": true, \
  "action_id": "CREATE", \
  "resource_hl7_type": "11502-2^^2.16.840.1.113883.6.1", \
  "exp": 1656541352925, \
  "iat": 1656454952925, \
  "jti": "1234", \
  "attachment_hash": "d04f5f5d34c7bbb77e27fba4edb2c49d16ca90193d89a47117e892387c7ee466", \
  "person_id": "RSSMRA22A01A399Z" \
}





    2. **Campi Contenuti nella Request Body**

        Per i campi contenuti nella request body si evidenzia nel campo “provenienza” se questi sono campi introdotti per rendere possibile la comunicazione con INI o se questi sono stati appositamente introdotti per gestire in maniera efficace ed efficiente il gateway.


<table>
  <tr>
   <td colspan="2" >
<strong>WORKFLOW INSTANCE ID</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>workflowInstanceId
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identificativo univoco della transazione espresso in formato stringa. Da inviare in request nel servizio di pubblicazione. Viene restituito in response nel servizio di validazione
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>GATEWAY
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio (solo per servizio di pubblicazione)
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>FORMATO DEI DATI SANITARI</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>healthDataFormat
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identifica il formato con cui vengono espressi i dati sanitari.
<p>
Se non viene specificato alcun valore si assume che il formato sia CDA.
<p>
Vedi TABELLA DATA FORMAT
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>CDA
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>GATEWAY
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Non obbligatorio
   </td>
  </tr>
</table>





<table>
  <tr>
   <td colspan="2" ><strong>MODALITA’ DI INIEZIONE DEI DATI SANITARI</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>mode
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identifica la modalità con la quale i dati sanitari sono stati iniettati nel PDF
<p>
Se non viene specificato alcun valore il Gateway proverà entrambe le modalità di estrazione
<p>
Vedi TABELLA INJECTION MODE.
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>ATTACHMENT
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>GATEWAY
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Non obbligatorio, in caso di omissione produce un errore di tipo warning
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>ATTIVITA’ DEL GATEWAY</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>activity
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identifica l’azione da eseguire sui dati sanitari (validation o verifica); 
<p>
Se non viene specificato alcun valore il Gateway assumerà l’attività di validation.
<p>
Vedi TABELLA ACTIVITY ENUM
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>VALIDATION
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>GATEWAY
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio solo per il servizio di validazione
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>TIPOLOGIA DI STRUTTURA CHE HA PRODOTTO IL DOCUMENTO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>tipologiaStruttura
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>(codifica della specialità o del tipo di struttura) \
Vedi TABELLA HEALTHCARE FACILITY TYPE CODE
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>Ospedale
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
</table>





<table>
  <tr>
   <td colspan="2" ><strong>ATTI CLINICI REGOLE DI ACCESSO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td><code>a</code>ttiCliniciRegoleAccesso
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Metadato che può essere utilizzato per rappresentare i principali atti clinici che vengono documentati, come ulteriore specializzazione del metadato typeCode, ed è utilizzato anche per specificare la politica di visibilità del documento (ossia se esso è oscurato o meno).Per quanto riguarda la descrizione dell’evento documentato, questo metadato può ad esempio specificare il tipo di vaccino o indicare la tipologia di tampone documentata nel referto di laboratorio. \
Da Affinity Domain, come specificato al paragrafo 2.7, Tabella 2.7-1 \
Vedi TABELLA EVENT CODE ENUM
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>P99
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Non Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>IDENTIFICATIVO DOCUMENTO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>identificativoDoc
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Da Affinity Domain, come specificato al paragrafo 2.20: \
L’OID da utilizzare per il metadato uniqueId deve essere strutturato nel seguente modo: per i documenti gestiti da un sistema di FSE regionale, il valore deve essere 2.16.840.1.113883.2.9.2.[REGIONE].4.4^X, dove X rappresenta una specifica istanza di documento presente in regione; per i documenti gestiti da Sistema TS, il valore deve essere 2.16.840.1.113883.2.9.4.3.8^Y, dove Y rappresenta una specifica istanza di documento presente nel Sistema TS (ad esempio Y è pari al NRE per la prescrizione dematerializzata). Il valore [REGIONE] è il valore corrispondente alla regione indicato in Tabella 6.43 (la prima cifra numerica pari a 0 va omessa).
<p>
Vedi TABELLA ORGANIZZAZIONE per il codice della REGIONE
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>2.16.840.1.113883.2.9.2.80.4.4^514782
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio; dovrà coincidere con l’xpath ClinicalDocument/id/@extension del CDA.
   </td>
  </tr>
</table>





<table>
  <tr>
   <td colspan="2" ><strong>IDENTIFICATIVO REPOSITORY</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>identificativoRep
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identificativo del repository che custodisce il documento \
Codificato con OID, come specificato al paragrafo 2.15 del documento Affinity Domain. \
 L’OID che deve essere utilizzato per il metadato repositoryUniqueId deve essere strutturato nel seguente modo: 2.16.840.1.113883.2.9.2.[REGIONE oppure INI].4.5.X, dove X rappresenta una specifica istanza di repository.
<p>
Vedi TABELLA ORGANIZZAZIONE per il codice della REGIONE
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>2.16.840.1.113883.2.9.2.80.4.5.1234
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>TIPO DOCUMENTO ALTO LIVELLO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>tipoDocumentoLivAlto
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Descrive la tipologia di documento ad alto livello. \
Da Affinity Domain, come specificato in Tabella 2.3-1. \
Vedi TABELLA TIPO DOCUMENTO ALTO LIVELLO
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>REF
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>ASSETTO ORGANIZZATIVO CHE HA PORTATO ALLA CREAZIONE DEL DOCUMENTO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>assettoOrganizzativo
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Classificazione della pratica clinica o specialistica nell’ambito della quale è stato prodotto il documento 
<p>
Da Affinity Domain, come specificato in Tabella 2.13-1. \
Vedi TABELLA PRACTICE SETTING CODE
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>AD_PSC131
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>DATA INIZIO DELLA PRESTAZIONE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>dataInizioPrestazione
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Date di inizio della prestazione sanitaria che ha comportato la produzione del documento \
Formato codifica conforme alle specifiche IHE (ITI TF-3)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>20141020110012
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Non Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>DATA FINE DELLA PRESTAZIONE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>dataFinePrestazione
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Date di fine della prestazione sanitaria che ha comportato la produzione del documento \
Formato codifica conforme alle specifiche IHE (ITI TF-3)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>20141020110012
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Non Obbligatorio
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="2" >     <strong>CONSERVAZIONE A NORMA</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>conservazioneANorma
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Indica se il documento è memorizzato negli archivi di conservazione sostitutiva (Affinity Domain, come specificato al paragrafo 2.21)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>CONS^^^&2.16.840.1.113883.2.9.3.3.6.1.7&ISO
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Non Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>TIPO ATTIVITA’ CLINICA</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>tipoAttivitaClinica
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Tipo Attività Clinica che ha portato alla creazione del documento
<p>
Vedi TABELLA ATTIVITA' CLINICA
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>PHR
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>IDENTIFICATIVO SOTTOMISSIONE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>identificativoSottomissione
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Metadato che rappresenta l’identificativo univoco dell’oggetto XDSSubmissionSet.
<p>
Formato codifica conforme alla specifiche IHE (ITI TF-3), di tipo OID, strutturato nel seguente modo:  \
2.16.840.1.113883.2.9.2.[REGIONE oppure INI].4.3.X, dove X rappresenta una specifica istanza di XDSSubmissionSet.
<p>
Vedi TABELLA ORGANIZZAZIONE per il codice della REGIONE
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>2.16.840.1.113883.2.9.2.50.4.3.123
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>INI
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>PRIORITA</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td>priorità
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Indica che la richiesta dovrà essere processata con priorità massima
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>true
   </td>
  </tr>
  <tr>
   <td><strong>PROVENIENZA</strong>
   </td>
   <td>GATEWAY
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Facoltativo
   </td>
  </tr>
</table>


_Tabella 18: Campi contenuti nella Request Body_

	





    3. **Tabelle di Riferimento**

Nella sezione presente vengono riportate le Tabelle di Riferimento per i Parametri di Input: se specificato in “Fonte” queste sono riconducibili alle “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”, laddove non specificato si tratta di tabelle custom create ad uso dei servizi di questo documento.

Le informazioni riportate nelle tabelle con Fonte Affinity Domain, rispetto alle medesime specifiche di riferimento (versione 2.2), sono esclusivamente quelle necessarie all’utilizzo dei servizi di validazione e di pubblicazione.

Eventuali variazioni normative e/o ad Affinity Domain implicano l’aggiornamento delle tabelle referenziate.



        2. **_Attività Clinica Enum_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 3.1-1. Value set per il metadato XDSSubmissionSet.contentTypeCode


<table>
  <tr>
   <td><strong>Codice</strong>
   </td>
   <td><strong>DisplayName </strong>
   </td>
   <td><strong>Descrizione utilizzo</strong>
   </td>
  </tr>
  <tr>
   <td>PHR
   </td>
   <td>Personal Health Record Update
   </td>
   <td>Documenti trasmessi direttamente dal
<p>
paziente mediante il taccuino personale.
   </td>
  </tr>
  <tr>
   <td>CON
   </td>
   <td>Consulto
   </td>
   <td>Documenti trasmessi per richiedere un
<p>
consulto.
   </td>
  </tr>
  <tr>
   <td>DIS
   </td>
   <td>Discharge
   </td>
   <td>Documenti trasmessi a seguito di un
<p>
ricovero.
   </td>
  </tr>
  <tr>
   <td>ERP
   </td>
   <td>Erogazione Prestazione Prenotata
   </td>
   <td>Documenti trasmessi a seguito di una
<p>
prestazione programmata/prenotata
   </td>
  </tr>
  <tr>
   <td>Sistema TS
   </td>
   <td>Documenti sistema TS
   </td>
   <td>Documenti resi disponibili nel FSE dal
<p>
Sistema TS.
   </td>
  </tr>
</table>


_Tabella 19: contentTypeCode_





        3. **_Healthcare Facility Type Code_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 2.8-1. Value set per il metadato XDSDocumentEntry.healthcareFacilityTypeCode


<table>
  <tr>
   <td><strong>Codice</strong>
   </td>
   <td><strong>Nome mnemonico</strong>
   </td>
   <td><strong>Descrizione</strong>
   </td>
  </tr>
  <tr>
   <td>Ospedale
   </td>
   <td>Ospedale
   </td>
   <td>Indica che il documento è stato prodotto in regime di ricovero ospedaliero del paziente.
   </td>
  </tr>
  <tr>
   <td>Prevenzione
   </td>
   <td>Prevenzione
   </td>
   <td>Indica che il documento è stato prodotto a seguito di uno screening o di medicina preventiva.
   </td>
  </tr>
  <tr>
   <td>Territorio
   </td>
   <td>Territorio
   </td>
   <td>Indica che il documento è stato prodotto a seguito di un incontro con uno specialista territoriale (ad es. MMG, PLS, ecc.).
   </td>
  </tr>
  <tr>
   <td>SistemaTS
   </td>
   <td>SistemaTS
   </td>
   <td>Indica che il documento è gestito e condiviso dal Sistema TS.
   </td>
  </tr>
  <tr>
   <td>Cittadino
   </td>
   <td>Cittadino
   </td>
   <td>Indica che il dato/documento è stato inserito dal cittadino.
   </td>
  </tr>
</table>


_Tabella 20: healthcareFacilityTypeCode_





        4. **_Tipo Documento Alto Livello_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 2.3-1. Value set per il metadato XDSDocumentEntry.classCode


<table>
  <tr>
   <td><strong>Codice</strong>
   </td>
   <td><strong>Nome mnemonico</strong>
   </td>
   <td><strong>Descrizione Utilizzo</strong>
   </td>
  </tr>
  <tr>
   <td>WOR
   </td>
   <td>Documento di workflow
   </td>
   <td>Questa classe di documenti deve essere utilizzata per i documenti di workflow.
   </td>
  </tr>
  <tr>
   <td>REF
   </td>
   <td>Referto
   </td>
   <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di referto.
   </td>
  </tr>
  <tr>
   <td>LDO
   </td>
   <td>Lettera di dimissione ospedaliera
   </td>
   <td>Questa classe di documenti deve essere utilizzata per le lettere di dimissione ospedaliera.
   </td>
  </tr>
  <tr>
   <td>RIC
   </td>
   <td>Richiesta
   </td>
   <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di richiesta (prescrizioni, richieste di consulto, ecc.).
   </td>
  </tr>
  <tr>
   <td>SUM
   </td>
   <td>Sommario
   </td>
   <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di sommario (ad es. profilo sanitario sintetico).
   </td>
  </tr>
  <tr>
   <td>TAC
   </td>
   <td>Taccuino
   </td>
   <td>Questa classe deve essere utilizzata per indicare documenti trasmessi nel taccuino dall’assistito.
   </td>
  </tr>
  <tr>
   <td>PRS
   </td>
   <td>Prescrizione
   </td>
   <td>Questa classe specifica che le informazioni riguardano le prescrizioni condivise dal Sistema TS.
   </td>
  </tr>
  <tr>
   <td>PRE
   </td>
   <td>Prestazioni
   </td>
   <td>Questa classe specifica che le informazioni riguardano le prestazioni erogate condivise dal Sistema TS.
   </td>
  </tr>
  <tr>
   <td>ESE
   </td>
   <td>Esenzione
   </td>
   <td>Questa classe indica che le informazioni riguardano le esenzioni.
   </td>
  </tr>
  <tr>
   <td>PDC
   </td>
   <td>Piano di cura
   </td>
   <td>Questa classe specifica che le informazioni riguardano i piani terapeutici condivisi dal Sistema TS.
   </td>
  </tr>
  <tr>
   <td>VAC
   </td>
   <td>Vaccino
   </td>
   <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di vaccino (scheda della singola vaccinazione, certificato vaccinale).
   </td>
  </tr>
  <tr>
   <td>CER
   </td>
   <td>Certificato per DGC
   </td>
   <td>Questa classe di documenti deve essere utilizzata per i documenti associati al Digital Green Certificate (certificazione verde Covid-19, certificazione di guarigione da Covid-19).
   </td>
  </tr>
  <tr>
   <td>VRB
   </td>
   <td>Verbale
   </td>
   <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di verbale (ad es. verbale di pronto soccorso).
   </td>
  </tr>
</table>


_Tabella 21: classCode_



        5. **_Event Code Enum_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 2.7-1. Value set per il metadato XDSDocumentEntry.eventCodeList


<table>
  <tr>
   <td><strong>CODICE</strong>
   </td>
   <td><strong>NOME MNEMONICO</strong>
   </td>
   <td><strong>DESCRIZIONE UTILIZZO</strong>
   </td>
  </tr>
  <tr>
   <td>P99
   </td>
   <td>Oscuramento del documento
   </td>
   <td>Specifica che un assistito ha stabilito di oscurare un documento a tutti i ruoli abilitati all’accesso al FSE.
   </td>
  </tr>
  <tr>
   <td>J07BX03
   </td>
   <td>Vaccino per Covid-19
   </td>
   <td>Fornisce indicazione relativamente all’evento vaccino per Covid-19, dettagliando maggiormente il contenuto del metadato typeCode cui è correlato (ad es. scheda della singola vaccinazione). Il codice utilizzato è individuato dalla classificazione ATC.
   </td>
  </tr>
  <tr>
   <td>LP418019-8
   </td>
   <td>Tampone antigenico per Covid-19
   </td>
   <td>Fornisce indicazione relativamente all’evento tampone antigenico per Covid-19, dettagliando maggiormente il contenuto del metadato typeCode cui è correlato (ad es. referto di laboratorio). Il codice utilizzato è individuato dalla codifica LOINC.
   </td>
  </tr>
  <tr>
   <td>LP417541-2
   </td>
   <td>Tampone molecolare per Covid-19
   </td>
   <td>Fornisce indicazione relativamente all’evento tampone molecolare per Covid-19, dettagliando maggiormente il contenuto del metadato typeCode cui è correlato (ad es. referto di laboratorio). Il codice utilizzato è individuato dalla codifica LOINC.
   </td>
  </tr>
  <tr>
   <td>96118-5
   </td>
   <td>Test Sierologico qualitativo
   </td>
   <td>Fornisce indicazione relativamente all’evento test sierologico qualitativo per Covid-19, dettagliando maggiormente il contenuto del metadato typeCode cui è correlato (ad es. referto di laboratorio). Il codice utilizzato è individuato dalla codifica LOINC.
   </td>
  </tr>
  <tr>
   <td>94503-0
   </td>
   <td>Test Sierologico quantitativo
   </td>
   <td>Fornisce indicazione relativamente all’evento test sierologico quantitativo per Covid-19, dettagliando maggiormente il contenuto del metadato typeCode cui è correlato (ad es. referto di laboratorio). Il codice utilizzato è individuato dalla codifica LOINC.
   </td>
  </tr>
  <tr>
   <td>pay
   </td>
   <td>Prescrizione farmaceutica non a carico SSN
   </td>
   <td>Fornisce indicazione relativamente alla cosiddetta “Ricetta bianca”, consentendo di specificare che il metadato typeCode (57833-6) cui è correlato fa riferimento ad una prescrizione non a carico del SSN. Il codice utilizzato è individuato dal value set http://hl7.org/fhir/ValueSet/coverage-type
   </td>
  </tr>
  <tr>
   <td>PUBLICPOL
   </td>
   <td>Prescrizione farmaceutica SSN
   </td>
   <td>Consente di specificare che il metadato typeCode (57833-6) cui è correlato fa riferimento ad una prescrizione a carico del SSN in maniera totale o parziale. Il codice utilizzato è individuato dal value set http://hl7.org/fhir/ValueSet/coverage-type
   </td>
  </tr>
</table>


_Tabella 22: eventCodeList_



        6. **_Ruolo_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 6.4-1. Value set per l’attributo urn:oasis:names:tc:xacml:2.0:subject:role


<table>
  <tr>
   <td><strong>Valore</strong>
   </td>
   <td><strong>Descrizione</strong>
   </td>
   <td><strong>Mappatura con ruoli del DPCM sul FSE</strong>
   </td>
  </tr>
  <tr>
   <td>AAS
   </td>
   <td>Personale di assistenza ad alta specializzazione
   </td>
   <td>Medico / Dirigente sanitario
   </td>
  </tr>
  <tr>
   <td>APR
   </td>
   <td>Medico Medicina Generale
<p>
Pediatra di Libera Scelta
   </td>
   <td>Medico di Medicina Generale / Pediatra di Libera Scelta
   </td>
  </tr>
  <tr>
   <td>PSS
   </td>
   <td>Professionista del sociale
   </td>
   <td>Professionista del sociale
   </td>
  </tr>
  <tr>
   <td>INF
   </td>
   <td>Personale infermieristico
   </td>
   <td>Infermiere o altro Professionista Sanitario
   </td>
  </tr>
  <tr>
   <td>FAR
   </td>
   <td>Farmacista
   </td>
   <td>Farmacista
   </td>
  </tr>
  <tr>
   <td>OAM
   </td>
   <td>Operatore amministrativo
   </td>
   <td>Operatore Amministrativo
   </td>
  </tr>
  <tr>
   <td>DRS
   </td>
   <td>Dirigente sanitario
   </td>
   <td>Medico / Dirigente sanitario
   </td>
  </tr>
  <tr>
   <td>RSA
   </td>
   <td>Medico RSA
   </td>
   <td>Medico RSA
   </td>
  </tr>
  <tr>
   <td>MRP
   </td>
   <td>Medico Rete di Patologia
   </td>
   <td>Medico Rete di Patologia
   </td>
  </tr>
  <tr>
   <td>INI
   </td>
   <td>Infrastruttura Nazionale per l’Interoperabilità
   </td>
   <td>Ruolo di sistema (non indicato nel DPCM perché non rappresenta una professione)
   </td>
  </tr>
  <tr>
   <td>MDS
   </td>
   <td>Ruolo del Ministero della Salute per la gestione del DGC
   </td>
   <td>Non indicato nel DPCM perché non rappresenta una professione
   </td>
  </tr>
</table>


_Tabella 23: role_





        7. **_Contesto Operativo_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 6.4-2. Value set per l’attributo urn:oasis:names:tc:xspa:1.0:subject:purposeofuse


<table>
  <tr>
   <td><strong>Valore</strong>
   </td>
   <td><strong>Descrizione</strong>
   </td>
   <td><strong>Note</strong>
   </td>
  </tr>
  <tr>
   <td>TREATMENT
   </td>
   <td>Trattamento di cura ordinario
   </td>
   <td>Il valore deve essere utilizzato per il servizio di validazione e per il servizio di pubblicazione.
   </td>
  </tr>
</table>


_Tabella 24: purposeofuse_



        8. **_Organizzazione_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 6.4-3. Value set per l’attributo urn:oasis:names:tc:xspa:1.0:subject:organization-id


<table>
  <tr>
   <td><strong>Valore</strong>
   </td>
   <td><strong>Descrizione</strong>
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
010</p>

   </td>
   <td>Regione Piemonte
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
020</p>

   </td>
   <td>Regione Valle d'Aosta
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
030</p>

   </td>
   <td>Regione Lombardia
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
041</p>

   </td>
   <td>P.A. Bolzano
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
042</p>

   </td>
   <td>P.A. Trento
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
050</p>

   </td>
   <td>Regione Veneto
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
060</p>

   </td>
   <td>Regione Friuli Venezia Giulia
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
070</p>

   </td>
   <td>Regione Liguria
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
080</p>

   </td>
   <td>Regione Emilia-Romagna
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
090</p>

   </td>
   <td>Regione Toscana
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
100</p>

   </td>
   <td>Regione Umbria
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
110</p>

   </td>
   <td>Regione Marche
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
120</p>

   </td>
   <td>Regione Lazio
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
130</p>

   </td>
   <td>Regione Abruzzo
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
140</p>

   </td>
   <td>Regione Molise
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
150</p>

   </td>
   <td>Regione Campania
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
160</p>

   </td>
   <td>Regione Puglia
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
170</p>

   </td>
   <td>Regione Basilicata
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
180</p>

   </td>
   <td>Regione Calabria
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
190</p>

   </td>
   <td>Regione Sicilia
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
200</p>

   </td>
   <td>Regione Sardegna
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
000</p>

   </td>
   <td>INI o Sistema TS
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
001</p>

   </td>
   <td>SASN
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
999</p>

   </td>
   <td>MDS
   </td>
  </tr>
</table>


_Tabella 25: organization-id_





        9. **_Practice Setting Code_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 2.13-1. Value set per il metadato XDSDocumentEntry.practiceSettingCode


<table>
  <tr>
   <td><strong>Code</strong>
   </td>
   <td><strong>CodingScheme</strong>
   </td>
  </tr>
  <tr>
   <td>AD_PSC001
   </td>
   <td>Allergologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC002
   </td>
   <td>Day Hospital
   </td>
  </tr>
  <tr>
   <td>AD_PSC003
   </td>
   <td>Anatomia e Istologia Patologica
   </td>
  </tr>
  <tr>
   <td>AD_PSC005
   </td>
   <td>Angiologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC006
   </td>
   <td>Cardiochirurgia Padiatrica
   </td>
  </tr>
  <tr>
   <td>AD_PSC007
   </td>
   <td>Cardiochirurgia
   </td>
  </tr>
  <tr>
   <td>AD_PSC008
   </td>
   <td>Cardiologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC009
   </td>
   <td>Chirurgia Generale
   </td>
  </tr>
  <tr>
   <td>AD_PSC010
   </td>
   <td>Chirurgia Maxillo-Facciale
   </td>
  </tr>
  <tr>
   <td>AD_PSC011
   </td>
   <td>Chirurgia Pediatrica
   </td>
  </tr>
  <tr>
   <td>AD_PSC012
   </td>
   <td>Chirurgia Plastica
   </td>
  </tr>
  <tr>
   <td>AD_PSC013
   </td>
   <td>Chirurgia Toracica
   </td>
  </tr>
  <tr>
   <td>AD_PSC014
   </td>
   <td>Chirurgia Vascolare
   </td>
  </tr>
  <tr>
   <td>AD_PSC015
   </td>
   <td>Medicina Sportiva
   </td>
  </tr>
  <tr>
   <td>AD_PSC018
   </td>
   <td>Ematologia e Immunoematologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC019
   </td>
   <td>Malattie Endocrine, del Ricambio e della Nutrizione
   </td>
  </tr>
  <tr>
   <td>AD_PSC020
   </td>
   <td>Immunologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC021
   </td>
   <td>Geriatria
   </td>
  </tr>
  <tr>
   <td>AD_PSC024
   </td>
   <td>Malattie Infettive e Tropicali
   </td>
  </tr>
  <tr>
   <td>AD_PSC025
   </td>
   <td>Medicina del Lavoro
   </td>
  </tr>
  <tr>
   <td>AD_PSC026
   </td>
   <td>Medicina Generale
   </td>
  </tr>
  <tr>
   <td>AD_PSC027
   </td>
   <td>Medicina Legale
   </td>
  </tr>
  <tr>
   <td>AD_PSC028
   </td>
   <td>Unita Spinale
   </td>
  </tr>
  <tr>
   <td>AD_PSC029
   </td>
   <td>Nefrologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC030
   </td>
   <td>Neurochirurgia
   </td>
  </tr>
  <tr>
   <td>AD_PSC031
   </td>
   <td>Nido
   </td>
  </tr>
  <tr>
   <td>AD_PSC032
   </td>
   <td>Neurologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC033
   </td>
   <td>Neuropsichiatria Infantile
   </td>
  </tr>
  <tr>
   <td>AD_PSC034
   </td>
   <td>Oculistica
   </td>
  </tr>
  <tr>
   <td>AD_PSC035
   </td>
   <td>Odontoiatria e Stomatologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC036
   </td>
   <td>Ortopedia e Traumatologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC037
   </td>
   <td>Ostetricia e Ginecologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC038
   </td>
   <td>Otorinolaringoiatria
   </td>
  </tr>
  <tr>
   <td>AD_PSC039
   </td>
   <td>Pediatria
   </td>
  </tr>
  <tr>
   <td>AD_PSC040
   </td>
   <td>Psichiatria
   </td>
  </tr>
  <tr>
   <td>AD_PSC042
   </td>
   <td>Tossicologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC043
   </td>
   <td>Urologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC046
   </td>
   <td>Grandi Ustioni Pediatriche
   </td>
  </tr>
  <tr>
   <td>AD_PSC047
   </td>
   <td>Grandi Ustionati
   </td>
  </tr>
  <tr>
   <td>AD_PSC048
   </td>
   <td>Nefrologia (Abilitazione Trapianto Rene)
   </td>
  </tr>
  <tr>
   <td>AD_PSC049
   </td>
   <td>Terapia Intensiva
   </td>
  </tr>
  <tr>
   <td>AD_PSC050
   </td>
   <td>Unità Coronarica
   </td>
  </tr>
  <tr>
   <td>AD_PSC051
   </td>
   <td>Astanteria
   </td>
  </tr>
  <tr>
   <td>AD_PSC052
   </td>
   <td>Dermatologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC054
   </td>
   <td>Emodialisi
   </td>
  </tr>
  <tr>
   <td>AD_PSC055
   </td>
   <td>Farmacologia Clinica
   </td>
  </tr>
  <tr>
   <td>AD_PSC056
   </td>
   <td>Recupero e Riabilitazione Funzionale
   </td>
  </tr>
  <tr>
   <td>AD_PSC057
   </td>
   <td>Fisiopatologia della Riabilitazione Umana
   </td>
  </tr>
  <tr>
   <td>AD_PSC058
   </td>
   <td>Gastroenterologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC060
   </td>
   <td>Lungodegenti
   </td>
  </tr>
  <tr>
   <td>AD_PSC061
   </td>
   <td>Medicina Nucleare
   </td>
  </tr>
  <tr>
   <td>AD_PSC062
   </td>
   <td>Neonatologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC064
   </td>
   <td>Oncologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC065
   </td>
   <td>Oncoematologia Pediatrica
   </td>
  </tr>
  <tr>
   <td>AD_PSC066
   </td>
   <td>Oncoematologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC068
   </td>
   <td>Pneumologia, Fisiopatologia Respiratoria, Tisiologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC069
   </td>
   <td>Radiologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC070
   </td>
   <td>Radioterapia
   </td>
  </tr>
  <tr>
   <td>AD_PSC071
   </td>
   <td>Reumatologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC073
   </td>
   <td>Terapia Intensiva Neonatale
   </td>
  </tr>
  <tr>
   <td>AD_PSC074
   </td>
   <td>Radioterapia Oncologica
   </td>
  </tr>
  <tr>
   <td>AD_PSC075
   </td>
   <td>Neuro-Riabilitazione
   </td>
  </tr>
  <tr>
   <td>AD_PSC076
   </td>
   <td>Neurochirurgia Pediatrica
   </td>
  </tr>
  <tr>
   <td>AD_PSC077
   </td>
   <td>Nefrologia Pediatrica
   </td>
  </tr>
  <tr>
   <td>AD_PSC078
   </td>
   <td>Urologia Pediatrica
   </td>
  </tr>
  <tr>
   <td>AD_PSC082
   </td>
   <td>Anestesia e Rianimazione
   </td>
  </tr>
  <tr>
   <td>AD_PSC097
   </td>
   <td>Detenuti
   </td>
  </tr>
  <tr>
   <td>AD_PSC098
   </td>
   <td>Day Surgery Plurispecialistica
   </td>
  </tr>
  <tr>
   <td>AD_PSC100
   </td>
   <td>Laboratorio Analisi Chimico Cliniche
   </td>
  </tr>
  <tr>
   <td>AD_PSC101
   </td>
   <td>Microbiologia e Virologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC102
   </td>
   <td>Centro Trasfusionale e Immunoematologico
   </td>
  </tr>
  <tr>
   <td>AD_PSC103
   </td>
   <td>Radiodiagnostica
   </td>
  </tr>
  <tr>
   <td>AD_PSC104
   </td>
   <td>Neuroradiologia
   </td>
  </tr>
  <tr>
   <td>AD_PSC106
   </td>
   <td>Pronto Soccorso e OBI
   </td>
  </tr>
  <tr>
   <td>AD_PSC107
   </td>
   <td>Poliambulatorio
   </td>
  </tr>
  <tr>
   <td>AD_PSC109
   </td>
   <td>Centrale Operativa 118
   </td>
  </tr>
  <tr>
   <td>AD_PSC121
   </td>
   <td>Comparti Operatori - Degenza Ordinaria
   </td>
  </tr>
  <tr>
   <td>AD_PSC122
   </td>
   <td>Comparti Operatori - Day Surgery
   </td>
  </tr>
  <tr>
   <td>AD_PSC126
   </td>
   <td>Libera Professione Degenza
   </td>
  </tr>
  <tr>
   <td>AD_PSC127
   </td>
   <td>Hospice Ospedaliero
   </td>
  </tr>
  <tr>
   <td>AD_PSC129
   </td>
   <td>Trapianto Organi e Tessuti
   </td>
  </tr>
  <tr>
   <td>AD_PSC130
   </td>
   <td>Medicina di Base
   </td>
  </tr>
  <tr>
   <td>AD_PSC131
   </td>
   <td>Assistenza Territoriale
   </td>
  </tr>
  <tr>
   <td>AD_PSC199
   </td>
   <td>Raccolta Consenso
   </td>
  </tr>
  <tr>
   <td>AD_PSC999
   </td>
   <td>Altro
   </td>
  </tr>
</table>


_Tabella 26: practiceSettingCode_



        10. **_Activity Enum_**

<table>
  <tr>
   <td>
<strong>CODICE</strong>
   </td>
   <td><strong>VALORE</strong>
   </td>
   <td><strong>DESCRIZIONE</strong>
   </td>
  </tr>
  <tr>
   <td>V
   </td>
   <td>VERIFICA
   </td>
   <td>Attività di validazione
   </td>
  </tr>
  <tr>
   <td>P
   </td>
   <td>VALIDATION
   </td>
   <td>Attività di validazione finalizzata alla pubblicazione
   </td>
  </tr>
</table>


_Tabella 27: ActivityEnum_



        11. **_Injection Mode Enum_**

<table>
  <tr>
   <td>
<strong>CODICE</strong>
   </td>
   <td><strong>VALORE</strong>
   </td>
   <td><strong>DESCRIZIONE</strong>
   </td>
  </tr>
  <tr>
   <td>A
   </td>
   <td>ATTACHMENT
   </td>
   <td>CDA iniettato nel PDF come allegato (EmbeddedFiles)
   </td>
  </tr>
  <tr>
   <td>R
   </td>
   <td>RESOURCE
   </td>
   <td>CDA iniettato nel PDF come risorsa (XFAResources)
   </td>
  </tr>
</table>


_Tabella 28: ModeEnum_

Health Data Format Enum


<table>
  <tr>
   <td><strong>CODICE</strong>
   </td>
   <td><strong>VALORE</strong>
   </td>
   <td><strong>DESCRIZIONE</strong>
   </td>
  </tr>
  <tr>
   <td>C
   </td>
   <td>CDA
   </td>
   <td>Clinical Document Architecture
   </td>
  </tr>
  <tr>
   <td>D
   </td>
   <td>DICOM_SR
   </td>
   <td>Digital Imaging and Communications in Medicine Structured Reporting
   </td>
  </tr>
</table>


_Tabella 29: HealthDataFormatEnum_



        12. **_Tipo Attività_**

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.2”

Tabella 6.4-5. Value set per l’attributo urn:oasis:names:tc:xacml:1.0:action:action-id  


<table>
  <tr>
   <td><strong>VALORE</strong>
   </td>
   <td><strong>DESCRIZIONE</strong>
   </td>
  </tr>
  <tr>
   <td>CREATE
   </td>
   <td>Il valore deve essere utilizzato per il servizio di validazione e per il servizio di pubblicazione 
   </td>
  </tr>
</table>


_Tabella 30: action-id_


<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]:

      https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]:
     Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]:

     Par. 4.3.1 del documento rif [2]

[^4]:

     Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]:

     Par. 3.5.3 delle Linee Guida Modello di Interoperabilità
