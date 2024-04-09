**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST Gateway**


<table>
  <tr>
   <td>Versione
   </td>
   <td>:
   </td>
   <td>ver 2.8
   </td>
  </tr>
</table>




**INDICE**

- [1. Introduzione](#1-introduzione)
  - [1.1. Riferimenti](#11-riferimenti)
  - [1.2. Acronimi e Definizioni](#12-acronimi-e-definizioni)
- [2. Contesto di Riferimento](#2-contesto-di-riferimento)
  - [2.1. Pattern di Interazione](#21-pattern-di-interazione)
  - [2.2. Processo di Autenticazione\[^3\]](#22-processo-di-autenticazione3)
  - [2.3. Note su autenticazione e token JWT](#23-note-su-autenticazione-e-token-jwt)
- [3. Servizio di Validazione](#3-servizio-di-validazione)
  - [3.1. Request](#31-request)
    - [3.1.1. Messaggio di richiesta, esempio “Validation con Attachment”](#311-messaggio-di-richiesta-esempio-validation-con-attachment)
    - [3.1.2. Messaggio di richiesta, esempio “Verifica con Attachment”](#312-messaggio-di-richiesta-esempio-verifica-con-attachment)
    - [3.1.3. Messaggio di richiesta, esempio “Verifica con resource”](#313-messaggio-di-richiesta-esempio-verifica-con-resource)
  - [3.2. Response](#32-response)
    - [3.2.1. Messaggio di risposta, esempio “Validation con Attachment” con esito Success 201](#321-messaggio-di-risposta-esempio-validation-con-attachment-con-esito-success-201)
    - [3.2.2. Messaggio di risposta, esempio “Validation con Attachment” con esito KO 400](#322-messaggio-di-risposta-esempio-validation-con-attachment-con-esito-ko-400)
    - [3.2.3. Messaggio di risposta, esempio “Verifica con Attachment” con esito OK 200 con warning](#323-messaggio-di-risposta-esempio-verifica-con-attachment-con-esito-ok-200-con-warning)
- [4. Servizio di Creazione](#4-servizio-di-creazione)
  - [4.1. Request](#41-request)
    - [4.1.1. Messaggio di Richiesta, esempio “Pubblicazione con Attachment”](#411-messaggio-di-richiesta-esempio-pubblicazione-con-attachment)
    - [4.1.2. Messaggio di Richiesta, esempio “Pubblicazione con Resource”](#412-messaggio-di-richiesta-esempio-pubblicazione-con-resource)
  - [4.2. Response](#42-response)
    - [4.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Pubblicazione con Attachment”](#421-esempio-di-messaggio-di-risposta-con-esito-ok-200---pubblicazione-con-attachment)
    - [4.2.2. Messaggio di Risposta, esempio “Pubblicazione con Resource” con esito KO 400](#422-messaggio-di-risposta-esempio-pubblicazione-con-resource-con-esito-ko-400)
- [5. Servizio di Eliminazione Documento](#5-servizio-di-eliminazione-documento)
  - [5.1. Request](#51-request)
    - [5.1.1. Messaggio di Richiesta, esempio “Eliminazione Documento”](#511-messaggio-di-richiesta-esempio-eliminazione-documento)
  - [5.2. Response](#52-response)
    - [5.2.1. Esempio di Messaggio di Risposta con esito OK 200 - Delete eseguita con successo](#521-esempio-di-messaggio-di-risposta-con-esito-ok-200---delete-eseguita-con-successo)
    - [5.2.2. Esempio di Messaggio di Risposta con esito KO 400](#522-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [6. Servizio di Sostituzione Documento](#6-servizio-di-sostituzione-documento)
  - [6.1. Request](#61-request)
    - [6.1.1. Messaggio di Richiesta, esempio “Pubblicazione Sostituzione Documento con Attachment”](#611-messaggio-di-richiesta-esempio-pubblicazione-sostituzione-documento-con-attachment)
  - [6.2. Response](#62-response)
    - [6.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”](#621-esempio-di-messaggio-di-risposta-con-esito-ok-200-pubblicazione-sostituzione-documento-con-attachment)
    - [6.2.2. Esempio di Messaggio di Risposta con esito KO 400](#622-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [7. Servizio di Aggiornamento Metadati](#7-servizio-di-aggiornamento-metadati)
  - [7.1. Request](#71-request)
    - [7.1.1. Esempio Messaggio di Richiesta](#711-esempio-messaggio-di-richiesta)
  - [7.2. Response](#72-response)
    - [7.2.1. Esempio di Messaggio di risposta con Esito Success 200](#721-esempio-di-messaggio-di-risposta-con-esito-success-200)
    - [7.2.2. Esempio di Messaggio di Risposta con esito KO 400](#722-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [8. Servizio di validazione e pubblicazione creazione contestuale](#8-servizio-di-validazione-e-pubblicazione-creazione-contestuale)
  - [8.1. Request](#81-request)
    - [8.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Attachment”](#811-messaggio-di-richiesta-esempio-validazione-pubblicazione-creazione-con-attachment)
    - [8.1.2. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Resource”](#812-messaggio-di-richiesta-esempio-validazione-pubblicazione-creazione-con-resource)
  - [8.2. Response](#82-response)
    - [8.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Validazione Pubblicazione creazione contestuale con Attachment”](#821-esempio-di-messaggio-di-risposta-con-esito-ok-200---validazione-pubblicazione-creazione-contestuale-con-attachment)
    - [8.2.2. Esempio di Messaggio di Risposta con esito OK 400 - “Validazione Pubblicazione creazione contestuale con errore sintattico”](#822-esempio-di-messaggio-di-risposta-con-esito-ok-400---validazione-pubblicazione-creazione-contestuale-con-errore-sintattico)
    - [8.2.3. Esempio di Messaggio di Risposta con esito OK 201 - “Validazione Pubblicazione creazione contestuale con warning semantico”](#823-esempio-di-messaggio-di-risposta-con-esito-ok-201---validazione-pubblicazione-creazione-contestuale-con-warning-semantico)
- [9. Servizio di validazione pubblicazione sostituzione contestuale](#9-servizio-di-validazione-pubblicazione-sostituzione-contestuale)
  - [9.1. Request](#91-request)
    - [9.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione Sostituzione Documento con Attachment”](#911-messaggio-di-richiesta-esempio-validazione-pubblicazione-sostituzione-documento-con-attachment)
  - [9.2. Response](#92-response)
    - [9.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”](#921-esempio-di-messaggio-di-risposta-con-esito-ok-200-pubblicazione-sostituzione-documento-con-attachment)
    - [9.2.2. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con warning semantico”](#922-esempio-di-messaggio-di-risposta-con-esito-ok-200-pubblicazione-sostituzione-documento-con-warning-semantico)
    - [9.2.3. Esempio di Messaggio di Risposta con esito OK 400, “Pubblicazione Sostituzione Documento con errore sintattico”](#923-esempio-di-messaggio-di-risposta-con-esito-ok-400-pubblicazione-sostituzione-documento-con-errore-sintattico)
- [10. Servizio di Recupero Stato Transazione per WorkflowInstanceId](#10-servizio-di-recupero-stato-transazione-per-workflowinstanceid)
  - [10.1. Request](#101-request)
    - [10.1.1. Esempio Messaggio di Richiesta stato Transazioni](#1011-esempio-messaggio-di-richiesta-stato-transazioni)
  - [10.2. Response](#102-response)
    - [10.2.1. Esempio messaggio di risposta con Esito Success 200](#1021-esempio-messaggio-di-risposta-con-esito-success-200)
    - [10.2.2. Esempio di Messaggio di Risposta con esito KO 400](#1022-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [11. Servizio di Recupero Stato Transazione per TraceId](#11-servizio-di-recupero-stato-transazione-per-traceid)
  - [11.1. Request](#111-request)
    - [11.1.1. Esempio Messaggio di Richiesta stato Transazioni](#1111-esempio-messaggio-di-richiesta-stato-transazioni)
  - [11.1. Response](#111-response)
- [12. Drilldown Response in caso di Errore](#12-drilldown-response-in-caso-di-errore)
  - [12.1. Errori Applicativi](#121-errori-applicativi)
    - [12.3.1. Esempi di errore generati dal Gateway](#1231-esempi-di-errore-generati-dal-gateway)
  - [12.1. Errori provenienti da Apparati di Frontiera](#121-errori-provenienti-da-apparati-di-frontiera)
- [13. Drilldown Parametri di Input](#13-drilldown-parametri-di-input)
  - [13.1. Campi Contenuti nei JWT](#131-campi-contenuti-nei-jwt)
  - [13.2. Campi Contenuti nella Request Body](#132-campi-contenuti-nella-request-body)
  - [13.3. Tabelle di Riferimento](#133-tabelle-di-riferimento)
    - [13.3.1. Attività Clinica Enum](#1331-attività-clinica-enum)
    - [13.3.2. Healthcare Facility Type Code](#1332-healthcare-facility-type-code)
    - [13.3.3. Tipo Documento Alto Livello](#1333-tipo-documento-alto-livello)
    - [13.3.4. Event Code](#1334-event-code)
    - [13.3.5. Ruolo](#1335-ruolo)
    - [13.3.6. Contesto Operativo](#1336-contesto-operativo)
    - [13.3.7. Organizzazione](#1337-organizzazione)
    - [13.3.8. Practice Setting Code](#1338-practice-setting-code)
    - [13.3.9. Activity Enum](#1339-activity-enum)
    - [13.3.10. Injection Mode Enum](#13310-injection-mode-enum)
    - [13.3.11. Health Data Format Enum](#13311-health-data-format-enum)
    - [13.3.12. Tipo Attività](#13312-tipo-attività)
    - [13.3.13. Administrative Request](#13313-administrative-request)
  - [Notes](#notes)



# 1. Introduzione


## 1.1. Riferimenti


<table>
  <tr>
   <td><strong>RIF.</strong>
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
   <td>Affinity Domain 2.5
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


## 1.2. Acronimi e Definizioni


<table>
  <tr>
   <td><strong>ACRONIMO</strong>
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
3.2: aggiornamento status code; esempio workflowInstanceId; esempio response con warning;
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
  <tr>
   <td>2.0
   </td>
   <td>29/07/2022
   </td>
   <td>Paragrafi modificati:
<p>
3: aggiornamento Request e Accept header
<p>
4: aggiornamento Request e Accept header
<p>
5: stesura del paragrafo Eliminazione Documento
<p>
6: stesura del paragrafo Sostituzione Documento
<p>
7: stesura del paragrafo Aggiornamento Metadati
<p>
8.1: aggiornamento doppio JWT
<p>
8.3.4: aggiornamento doppio JWT
<p>
8.3.6: Contesto Operativo
<p>
8.3.11: Tipo Attività
   </td>
  </tr>
<tr>
   <td>2.1
   </td>
   <td>15/10/2022
   </td>
   <td>Paragrafi modificati:

2: Specificato nome allegato CDA: cda.xml

2.3: Aggiunte note su JWT e certificati

   </td>
  </tr>
<tr>
   <td>2.2
   </td>
   <td>28/11/2022
   </td>
   <td>Paragrafi modificati:

2: Evidenziato endpoint sistema di test

   </td>
  </tr>
  <tr>
   <td>2.3
   </td>
   <td>12/12/2022
   </td>
   <td>Paragrafi modificati:
<p>
2: aggiornamento Contesto di riferimento
<p>
5: aggiornamento Servizio di Eliminazione
<p>
6: aggiornamento Servizio di Sostituzione
<p>
7: aggiornamento Servizio di Aggiornamento Metadati
<p>
8: stesura del paragrafo Servizio di Recupero Stato Transazione per WorkflowInstanceId
<p>
9: stesura del paragrafo Servizio di Recupero Stato Transazione per TraceId
<p>
10: stesura del paragrafo DrillDown Response in caso di Errore
<p>
11.1: aggiunti nuovi custom claims per Applicativo
   </td>
  </tr>
  <tr>
   <td>2.4
   </td>
   <td>21/02/2022
   </td>
   <td>Paragrafi modificati
<p>
5, 7, 8, 9: rimozione Content-Type
<p>
6: rimozione priorità e workflowInstanceId sul Servizio di Sostituzione
   </td>
  </tr>
  </tr>
  <tr>
   <td>2.5
   </td>
   <td>03/03/2023
   </td>
   <td>Paragrafi modificati
<p>
4,6,7: Aggiunti parametri in request body
<p>
11: Aggiornamento enums "affinity domain 2.4.1"
<p>
   </td>
  </tr>

  <tr>
   <td>2.6
   </td>
   <td>23/03/2023
   </td>
   <td>Paragrafi modificati:
<p>
8: Aggiunto paragrafo validazione pubblicazione creazione contestuale
<p>
9: Aggiunto paragrafo validazione pubblicazione sostituzione contestuale
<p>
10: Cambio indice paragrafo "Servizio di Recupero Stato Transazione per WorkflowInstanceId"
<p>
11: Cambio indice paragrafo "Servizio di Recupero Stato Transazione per TraceId"
<p>
12: Cambio indice paragrafo "Drilldown Response in caso di Errore"
<p>
13. Cambio indice paragrafo "Drilldown Parametri di Input"
<p>
   </td>
  </tr>

  <tr>
   <td>2.7
   </td>
   <td>15/03/2024
   </td>
   <td>Paragrafi modificati:

9: Aggiunto paragrafo validazione pubblicazione sostituzione contestuale
<p>
   </td>
  </tr>

   <tr>
   <td>2.8
   </td>
   <td>27/03/2024
   </td>
   <td>Paragrafi modificati:
	   <p>
13.1. Campi Contenuti nei JWT
<p>
   </td>
  </tr>
</table>


_Tabella 3: Registro Modifiche_


# 2. Contesto di Riferimento

La nuova architettura del FSE prevede la presenza di un componente, denominato Gateway, adibito all’acquisizione, alla validazione, e alla traduzione di dati e documenti clinici secondo i formati definiti dalle Linee Guida FSE. Tali dati e documenti sono prodotti dai Sistemi in uso presso le Strutture Sanitarie (Sistemi Produttori). 

In questo documento verranno indicate le modalità per usufruire dei servizi esposti dal gateway: il      documento sarà redatto in modo incrementale e di volta in volta ulteriori API saranno integrate e illustrate. 

In questa fase vengono trattati i due servizi principali del Gateway, che consentono rispettivamente di invocare le funzionalità di Validazione Documento CDA2 e di Pubblicazione Documento CDA2, e i servizi che consentono l’eliminazione e l’aggiornamento del documento e dei suoi metadati.


<table>
  <tr>
   <td><strong>Endpoint URL</strong>
   </td>
   <td><strong>Metodo</strong>
   </td>
   <td><strong>Funzionalità</strong>
   </td>
  </tr>
  <tr>
   <td>/v<major>/documents/validation
   </td>
   <td>POST
   </td>
   <td>VALIDAZIONE DOCUMENTO CDA2 
   </td>
  </tr>
  <tr>
   <td>/v<major>/documents
   </td>
   <td>POST
   </td>
   <td>PUBBLICAZIONE DOCUMENTO CDA2
   </td>
  </tr>
  <tr>
   <td>/v<major>/documents/{identificativoDocUpdate}
   </td>
   <td>DELETE
   </td>
   <td>ELIMINAZIONE DOCUMENTO
   </td>
  </tr>
  <tr>
   <td>/v<major>/documents/{identificativoDocUpdate}
   </td>
   <td>PUT
   </td>
   <td>SOSTITUZIONE DOCUMENTI
   </td>
  </tr>
  <tr>
   <td>/v<major>/documents/{identificativoDocUpdate}/metadata
   </td>
   <td>PUT
   </td>
   <td>AGGIORNAMENTO METADATI
   </td>
  </tr>
  <tr>
   <td>/v<major>/documents/validate-and-create
   </td>
   <td>POST
   </td>
   <td>VALIDAZIONE E PUBBLICAZIONE CREAZIONE CONTESTUALE
   </td>
  </tr>
  <tr>
   <td>/v<major>/documents/validate-and-replace/{idDoc}
   </td>
   <td>PUT
   </td>
   <td>VALIDAZIONE E PUBBLICAZIONE SOSTITUZIONE CONTESTUALE
   </td>
  </tr>
  <tr>
   <td>/v<major>/status/{workflowInstanceId}
   </td>
   <td>GET
   </td>
   <td>RECUPERO STATO TRANSAZIONE PER WORKFLOWINSTANCEID
   </td>
  </tr>
  <tr>
   <td>/v<major>/status/search/{traceId}
   </td>
   <td>GET
   </td>
   <td>RECUPERO STATO TRANSAZIONE PER TRACEID
   </td>
  </tr>
</table>


_Tabella 4: Endpoint/Funzionalità_

L'endpoint del **sistema di test** è: 

    https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1

La Pubblicazione di un documento CDA2 deve essere sempre preceduta da una Validazione Documento CDA2. Una Validazione Documento CDA2 può non essere seguita dalla Pubblicazione CDA2. Questo avverrà soprattutto nella fase iniziale in cui si utilizzerà il solo servizio di validazione per i vari test.  Per distinguere questi due casi è stato introdotto il campo “Activity” specificato nelle successive sezioni.

I due servizi di Validazione e Pubblicazione sono correlati da un identificativo di transazione referenziato nel documento come “workflowInstanceId” secondo standard IHE (Data Type  CXi).

Per identificare invece i documenti da cancellare o aggiornare il chiamante dovrà fornire al Gateway l’OID (Object Identifier) del documento da gestire (lo stesso che è stato fornito in creazione e propagato ad INI in XDSDocumentEntry.uniqueId e all’EDS tramite il MasterIdentifier della DocumentReference).

**Validazione Documento CDA2**

Nello scenario di questa funzionalità il Sistema Produttore invia un documento secondo il formato standard HL7 CDA2, ed iniettato in un PDF, il nome CDA allegato deve essere “**cda.xml**”(senza considerare maiuscole e minuscole). 

Il servizio è sincrono, e implementa le validazioni ed i controlli sintattici, semantici e terminologici. In caso di un esito con errore, verranno restituiti i dettagli di questo indicati nell’apposita sezione in “Response”.

In caso di validazione eseguita con successo, l’esito tornato è positivo e la Validazione può ritenersi conclusa correttamente. 

**Pubblicazione Documento CDA2**

Nello scenario di questa funzionalità il Repository Documentale locale invia il documento secondo il formato standard HL7 CDA2 ed iniettato in PDF firmato digitalmente in modalità **PADES**, corredato di alcuni metadati come di seguito indicato. Il documento CDA2 innestato nel documento dovrà corrispondere a quello precedentemente validato secondo il servizio di Validazione Documenti CDA2.

La verifica della corrispondenza verrà fatta calcolando l’hash del CDA2 estrapolato dal PDF ignorando il tag del CDA "Legal Authenticator". Il processo di Pubblicazione procederà soltanto se l’hash coincide con quello calcolato nel flusso di validazione (recuperato dalla cache tramite il “workflowInstanceId”).

Il servizio ha lo scopo di effettuare la conversione del dato in ingresso in formato FHIR per l’invio verso EDS, e preparare i metadati del documento per la comunicazione verso INI ai fini della indicizzazione.

La conversione del dato in formato FHIR è sincrona mentre la comunicazione verso INI ed EDS è asincrona. Conclusa la conversione il servizio fornisce un acknowledgment di presa in carico.

**Eliminazione Documento**

Nello scenario di questa funzionalità il Repository Documentale locale effettuerà una richiesta di cancellazione di un documento identificato dal XDSDocumentEntry.uniqueId. 

Tale servizio effettua in modalità sincrona la cancellazione delle risorse FHIR sull’EDS e successivamente la cancellazione dei metadati su INI. 

In caso di errore nell’eliminazione, il servizio fornisce un acknowledgement di presa in carico dell’operazione.

**Sostituzione documento**

Questa funzionalità permette di sovrascrivere un documento precedentemente pubblicato. 

Come per la creazione, il servizio effettua la conversione del documento in ingresso (identificato dal XDSDocumentEntry.uniqueId) in formato FHIR e procede all’invio verso EDS e INI.

La conversione del dato in formato FHIR è sincrona mentre la comunicazione verso INI ed EDS è asincrona. Conclusa la conversione il servizio fornisce un acknowledgment di presa in carico.

**Aggiornamento metadati**

Questa funzionalità permette di aggiornare i metadati di un documento presente su FSE. Tale servizio effettua in modalità sincrona l’aggiornamento dei metadati sia su EDS che su INI.

In caso di errore nell’aggiornamento, il servizio fornisce un acknowledgement di presa in carico dell’operazione.

Anche in questo caso il documento viene identificato dal XDSDocumentEntry.uniqueId.

**Validazione e Pubblicazione creazione contestuale di un Documento CDA2**


**Questo servizio non è da intendersi per un utilizzo regolare, ma per la gestione di specifici casi di errore nel normale workflow dei documenti.**

In questa funzionalità, il Repository Documentale locale invia il documento nel formato standard HL7 CDA2, che viene iniettato in un PDF firmato digitalmente in modalità **PADES** e corredato di alcuni metadati. Dapprima, quindi, viene eseguita la validazione (sintattica, semantica, terminologica) del documento fornito in maniera **SINCRONA**. 

In caso di esito positivo, nella stessa transazione, vengono preparati i vari metadati del documento per la comunicazione verso INI e la sua indicizzazione, e viene preparato il bundle FHIR per l'invio ad EDS. È importante notare che la validazione, e la conversione del dato in formato FHIR avvengono in maniera sincrona, mentre la comunicazione dei metadati verso INI e del bundle verso EDS è **ASINCRONA**.

Alla fine del processo, il servizio fornisce un acknowledgment di presa in carico.

È possibile utilizzare questo servizio nei casi in cui non sia stato possibile validare un documento al momento dell'emissione dello stesso per:
* indisponibilità della connettività rete
* indisponibilità del servizio
* errore interno del gateway 

Ci si trova nel caso in cui l'attività clinica sia proceduta e vi sia necessità di "recuperare" la validazione prima della pubblicazione.

In ogni caso questo servizio non è da usarsi per violare la semantica di chiamata sincrona di validazione, da parte del produttore, al momento dell'emissione del documento.

**Validazione e Pubblicazione sostituzione contestuale di un Documento CDA2**

**Questo servizio non è da intendersi per un utilizzo regolare, ma per la gestione di specifici casi di errore nel normale workflow dei documenti.**

In questa funzionalità, il Repository Documentale locale invia il documento nel formato standard HL7 CDA2, che viene iniettato in un PDF firmato digitalmente in modalità **PADES** e corredato di alcuni metadati con il fine ultimo di sostituire un documento precedentemente pubblicato su INI ed EDS.

Inizialmente, quindi, in maniera **SINCRONA**, viene eseguita la validazione (sintattica, semantica, terminologica) del documento fornito e, in caso di esito positivo, nella medesima transazione, vengono recuperati i riferimenti del documento da sostituire da INI e, se presenti, si procede a preparare i metadati per la sostituzione dello stesso e per la sua indicizzazione, e infine viene preparato il bundle FHIR per la sostituzione su EDS.

È importante notare che la validazione, il recupero dei riferimenti da **INI** e la conversione del dato in formato FHIR avvengono in maniera sincrona, mentre la comunicazione dei metadati verso INI e del bundle verso EDS è **ASINCRONA**.

Alla fine del processo, il servizio fornisce un acknowledgment di presa in carico.

È possibile utilizzare questo servizio nei casi in cui non sia stato possibile validare un documento al momento dell'emissione dello stesso per:
* indisponibilità della connettività rete
* indisponibilità del servizio
* errore interno del gateway 

Ci si trova nel caso in cui l'attività clinica sia proceduta e vi sia necessità di "recuperare" la validazione prima della pubblicazione.

In ogni caso questo servizio non è da usarsi per violare la semantica di chiamata sincrona di validazione, da parte del produttore, al momento dell'emissione del documento.


**Recupero Stato Transazione per WorkflowInstanceId (o TraceId)**

Questa funzionalità permette di verificare lo stato della transazione presa in carico dal Gateway. Utilizzando il WorkflowInstanceId (o il TraceId) ottenuto in risposta dai servizi di Validazione e/o Pubblicazione sarà possibile conoscere lo stato della transazione e sapere se la comunicazione verso INI ed EDS è avvenuta con successo.


## 2.1. Pattern di Interazione

Le API sono esposte secondo i pattern definiti nelle Linee Guida Modello di Interoperabilità[^1] definite da Agid.

Come scenario di interazione per i servizi esposti dal Gateway viene utilizzato il pattern [BLOCK_REST] Blocking REST[^2]<sup>.</sup>


## 2.2. Processo di Autenticazione[^3]

Il processo di autenticazione rispetta i seguenti pattern delle suddette Linee Guida:



* ID_AUTH_CHANNEL_02 [^4]


* ID_AUTH_REST_01 [^5]
Di seguito un diagramma che descrive un esempio di interazione per i due servizi di Validazione e Pubblicazione documenti:



![sequence diagram](img/sequence.png "sequence diagram")

## 2.3. Note su autenticazione e token JWT

Per comunicare con il gateway è necessario essere in possesso di 2 certificati X.509 e delle rispettive chiavi private.

Il certificato denominato di **“autenticazione”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> come certificato client per le chiamate https.

Il certificato denominato di **“signature”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> per la firma dei token JWT.

Ogni invocazione delle API avverrà quindi con una chiamata https protetta dal certificato di autenticazione e **conterrà negli header 2 token JWT**.

Il primo JWT è utilizzato per l’autenticazione e contiene i riferimenti all’utente che richiama il servizio e al soggetto interessato, il token viene trasportato nell’header **“Authorization”** di tipo “**Bearer”**:


```
Authorization: Bearer {VALORE DEL TOKEN}
```


Il secondo JWT è di “signature” e contiene rifermenti al documento oggetto delle operazioni, il token viene trasportato nell’header http **“FSE-JWT-Signature”**:


```
FSE-JWT-Signature: {VALORE DEL TOKEN}
```


**Entrambi** i token devono essere firmati utilizzando il certificato “signature”.

Vista la dipendenza dei token dai valori specifici di utente/soggetto/documento è necessario generare nuovi JWT per ogni chiamata alle API.

Per i dettagli sui campi dei token si consulti l’apposito paragrafo.



# 3. Servizio di Validazione

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Validazione Documento CDA2 si compone come segue:


```
https://<HOST>:<PORT>/v<major>/documents/validation
```


Lo scopo di questa API è validare da un punto di vista sintattico, semantico e terminologico i dati forniti dal Sistema Produttore.


## 3.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>POST
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/documents/validation
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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>FSE-JWT-Signature
   </td>
   <td>N.D.
   </td>
   <td>N.D.
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
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

* **file** che dovrà contenere un file PDF con iniettato un Clinical Document in formato XML in linea con quanto riportato nelle «Implementation Guide CDA R2» al link [1]
* **requestBody** che dovrà contenere l’oggetto json con i parameter di input


### 3.1.1. Messaggio di richiesta, esempio “Validation con Attachment”

Messaggio di richiesta con activity “VALIDATION” (validazione ai fini della successiva pubblicazione), pdf con CDA innestato in modalità ATTACHMENT e tipo documento CDA

``` bash
curl -X 'POST' \	
  'https://<HOST>:<PORT>/v1/documents/validation' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "healthDataFormat": "CDA",
  "mode": "ATTACHMENT",
  "activity": "VALIDATION",
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
```


### 3.1.2. Messaggio di richiesta, esempio “Verifica con Attachment”

Messaggio di richiesta con activity “VERIFICA” (validazione che non sarà seguita da pubblicazione), pdf con CDA innestato in modalità ATTACHMENT ma senza specificarlo nella request, tipo documento CDA

``` bash
curl -X 'POST' \	
  'https://<HOST>:<PORT>/v1/documents/validation' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "healthDataFormat": "CDA",
  "activity": "VERIFICA",
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
```


### 3.1.3. Messaggio di richiesta, esempio “Verifica con resource”

Messaggio di richiesta con activity “VERIFICA” (validazione che non sarà seguita da pubblicazione), pdf con CDA innestato in modalità  RESOURCE, tipo documento CDA

``` bash
curl -X 'POST' \	
  'https://<HOST>:<PORT>/v1/documents/validation' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "healthDataFormat": "CDA",
  "mode": "RESOURCE",
  "activity": "VERIFICA",
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
```

## 3.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="13" >STATUS CODE
   </td>
   <td>200
   </td>
   <td>Validazione positiva a seguito di activity verifica**
   </td>
  </tr>
  <tr>
   <td>201
   </td>
   <td>Validazione positiva a seguito di activity validation***
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
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 7: Response Servizio di Validazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

** Se il servizio viene invocato con il parametro “activity” a VERIFICA, verrà restituito lo StatusCode 200  in caso di SUCCESS

*** Se il servizio viene invocato con il parametro “activity” a  VALIDATION, verrà restituito lo StatusCode 201 in caso di SUCCESS

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
   <td>Identificativo univoco assegnato alla singola operazione nell’ambito della richiesta dell'utente. In caso di richiesta avente operazioni multiple (su più microservizi), ognuna di esse avrà un differente spanId (ma stesso traceId). 
TraceId e spanId coincidono nella prima operazione.
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


_Tabella 9: Campi Response valorizzati in caso di warning_


### 3.2.1. Messaggio di risposta, esempio “Validation con Attachment” con esito Success 201 

``` json
{ 
 "traceID": "4e1cd92c6a406c4e", 
 "spanID": "4e1cd92c6a406c4e", 
 "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```


### 3.2.2. Messaggio di risposta, esempio “Validation con Attachment” con esito KO 400

``` json
{
  "traceID": "7fee3f3e2fc75b30",
  "spanID": "7fee3f3e2fc75b30",
  "type": "/msg/cda-element",
  "title": "Errore in fase di estrazione del CDA.",
  "detail": "Errore in fase di estrazione del CDA.",
  "status": 400,
  "instance": "/msg/cda-extraction"
}
```


### 3.2.3. Messaggio di risposta, esempio “Verifica con Attachment” con esito OK 200 con warning

``` json
{
  "traceID": "96c6883856f9f887",
  "spanID": "96c6883856f9f887",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.847c307946d33d8f14876ebb7204f2018a9cbc230da855ac27ed5413a5e2f051.bcf54e7cb9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "warning": "Attenzione, non è stata selezionata la modalità di estrazione del CDA"
}
```

# 4. Servizio di Creazione

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Creazione Documento CDA2 si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents
```

Lo scopo di questa API è indicizzare un nuovo documento clinico sul FSE regionale, tradurre i dati clinici nel formato HL7 FHIR ed inviarli al Data Repository Centrale.


## 4.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>POST
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/documents
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>multipart/form-data
   </td>
  </tr>
</table>


_Tabella 10: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>FSE-JWT-Signature
   </td>
   <td>N.D.
   </td>
   <td>N.D.
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td rowspan="18" >Request Body
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
   <td rowspan="17" >requestBody
   </td>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>false
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
   <td>attiCliniciRegoleAccesso
   </td>
   <td>List<String>
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
   <td>XDSDocumentEntry.Slot - Conservazione a norma
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
   <tr>
   <td>descriptions
   </td>
   <td>List
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - description
   </td>
  </tr>
   <tr>
   <td>administrativeRequest
   </td>
   <td>AdministrativeReqEnum
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>
  
  
  
</table>


_Tabella 11: Parametri Richiesta di Creazione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “priorita” consente al Gateway di decidere la priorità da attribuire al documento fornito in input al servizio.

Il Request Body è di tipo **multipart/form-data**, al suo interno sono previsti due parametri:



* **file** che dovrà contenere un file PDF con iniettato un Clinical Document in formato XML in linea con quanto riportato nelle «Implementation Guide CDA R2» al link [1]


* **requestBody** che dovrà contenere l’oggetto json con i parameter di input

### 4.1.1. Messaggio di Richiesta, esempio “Pubblicazione con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti, senza indicazione della priorità. 

Il workflowInstanceId è corretto e presente nel gateway.

``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v1/documents' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "workflowInstanceId": " 2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.e70b9b0acd^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "healthDataFormat": "CDA",
  "mode": "ATTACHMENT",
  "tipologiaStruttura": "Ospedale",
  "attiCliniciRegoleAccesso": [
    "P99"
  ],
  "identificativoDoc": "2.16.840.1.113883.2.9.2.120.4.4^290700",
  "identificativoRep": " 2.16.840.1.113883.2.9.2.120.4.5.1",
  "tipoDocumentoLivAlto": "REF",
  "assettoOrganizzativo": "AD_PSC001",
  "dataInizioPrestazione": "20141020110012",
  "dataFinePrestazione": "20141020110012",
  "tipoAttivitaClinica": "CON",
  "identificativoSottomissione": "2.16.840.1.113883.2.9.2.120.4.3.489592",
  "priorita": false,
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \

  -F 'file=@CDA_OK.pdf;type=application/pdf'
```

### 4.1.2. Messaggio di Richiesta, esempio “Pubblicazione con Resource”

Messaggio di richiesta con pdf con CDA innestato in modalità RESOURCE, tipo documento CDA e metadati formalmente corretti, con indicazione della priorità.

In questo caso, il workflowInstanceId non esiste nel gateway.

``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v1/documents' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "workflowInstanceId": " 2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ew.e70b9b0acr^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "healthDataFormat": "CDA",
  "mode": "RESOURCE",
  "tipologiaStruttura": "Ospedale",
  "attiCliniciRegoleAccesso": [
    "P99"
  ],
  "identificativoDoc": "2.16.840.1.113883.2.9.2.120.4.4^290701",
  "identificativoRep": " 2.16.840.1.113883.2.9.2.120.4.5.1",
  "tipoDocumentoLivAlto": "REF",
  "assettoOrganizzativo": "AD_PSC001",
  "dataInizioPrestazione": "20141020110012",
  "dataFinePrestazione": "20141020110012",
  "tipoAttivitaClinica": "CON",
  "identificativoSottomissione": "2.16.840.1.113883.2.9.2.120.4.3.489593",
  "priorita": true,
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
```



## 4.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="11" >STATUS CODE
   </td>
   <td>201
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
   <td>403
   </td>
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 12: Response Servizio di Pubblicazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

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
  <tr>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>Identificativo univoco della transazione
   </td>
  </tr>
</table>


_Tabella 13: Campi Response sempre valorizzati_

**Campi valorizzati solo in caso di warning**


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


_Tabella 14: Campi Response valorizzati in caso di warning_


### 4.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Pubblicazione con Attachment”

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 4.2.2. Messaggio di Risposta, esempio “Pubblicazione con Resource” con esito KO 400

``` json
{
  "traceID": "61d8123fb20e2afc",
  "spanID": "61d8123fb20e2afc",
  "type": "/msg/cda-match",
  "title": "Errore in fase di recupero dell'esito della verifica.",
  "detail": "Il CDA non risulta validato",
  "status": 400,
  "instance": "/msg/cda-validation"
}
```

# 5. Servizio di Eliminazione Documento

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 8.1 “Campi Contenuti nei JWT”.

L’Endpoint del caso d’uso di Eliminazione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>
```

Lo scopo di questa API Sincrona è eliminare le risorse FHIR precedentemente pubblicate, inclusi i metadati scritti su INI.


## 5.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>DELETE
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/documents/{identificativoDocUpdate}
   </td>
  </tr>
</table>


_Tabella 15: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>FSE-JWT-Signature
   </td>
   <td>N.D.
   </td>
   <td>N.D
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Path variable
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.uniqueId
   </td>
  </tr>
</table>


_Tabella 16: Parametri Richiesta di Eliminazione_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento da eliminare e al parametro _identificativoDoc_ utilizzato nel servizio di creazione.


### 5.1.1. Messaggio di Richiesta, esempio “Eliminazione Documento”

Messaggio di richiesta con identificativoDocUpdate presente e formalmente corretto. 

``` bash
curl -X 'DELETE' \
  'https://<HOST>:<PORT>/v1/documents/507f1f77bcf86cd799439011' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
```

## 5.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="10" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Cancellazione eseguita con successo
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
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 17: Response Servizio di Pubblicazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

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
  <tr>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>Identificativo univoco della transazione
   </td>
  </tr>
</table>


_Tabella 18: Campi Response sempre valorizzati_

**Campi valorizzati solo in caso di warning**


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


_Tabella 19: Campi Response valorizzati in caso di warning_


### 5.2.1. Esempio di Messaggio di Risposta con esito OK 200 - Delete eseguita con successo

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 5.2.2. Esempio di Messaggio di Risposta con esito KO 400

``` json
{
  "traceID": "61d8123fb20e2afc",
  "spanID": "61d8123fb20e2afc",
  "type": "/msg/mandatory-element",
  "title": "Campo obbligatorio non presente",
  "detail": "Il campo identificativo documento deve essere valorizzato",
  "status": 400,
  "instance": "/msg/mandatory-element"
}
```

# 6. Servizio di Sostituzione Documento

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Sostituzione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>
```

Lo scopo di questa API Asincrona è pubblicare un documento sovrascrivendo il documento che era stato precedentemente pubblicato. 


## 6.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>PUT
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/documents/{identificativoDocUpdate}
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>multipart/form-data
   </td>
  </tr>
</table>


_Tabella 20: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>FSE-JWT-Signature
   </td>
   <td>N.D.
   </td>
   <td>N.D.
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Path variable
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.uniqueId
   </td>
  </tr>
  <tr>
   <td rowspan="18" >Request Body
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
   <td rowspan="18" >requestBody</td>
   <tr>
   </td>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>false
   </td>
   <td>N.A.
   </tr>
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
   <td>attiCliniciRegoleAccesso
   </td>
   <td>String[]
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
   <td>XDSDocumentEntry.Slot - Conservazione a norma
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
   <td>descriptions
   </td>
   <td>String[]
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - description
   </td>
  </tr>
   <tr>
   <td>administrativeRequest
   </td>
   <td>AdministrativeReqEnum[]
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>

</table>


_Tabella 21: Parametri Richiesta di Pubblicazione Sostituzione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “mode” comporta la resituzione di un errore di tipo warning. 

Il Request Body coincide con la struttura utilizzata per il servizio di Pubblicazione Creazione Documento.

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento da sostituire e al parametro _identificativoDoc_ utilizzato precedentemente nel servizio di creazione.


### 6.1.1. Messaggio di Richiesta, esempio “Pubblicazione Sostituzione Documento con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti, senza indicazione della priorità. 

Il workflowInstanceId è corretto e presente nel gateway.

``` bash
curl -X 'PUT' \
  'https://<HOST>:<PORT>/v1/documents/507f1f77bcf86cd799439011' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "workflowInstanceId": " 2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.e70b9b0acd^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "healthDataFormat": "CDA",
  "mode": "ATTACHMENT",
  "tipologiaStruttura": "Ospedale",
  "attiCliniciRegoleAccesso": [
    "P99"
  ],
  "identificativoDoc": "2.16.840.1.113883.2.9.2.120.4.4^290700",
  "identificativoRep": "2.16.840.1.113883.2.9.2.120.4.5.1",
  "tipoDocumentoLivAlto": "REF",
  "assettoOrganizzativo": "AD_PSC001",
  "dataInizioPrestazione": "20141020110012",
  "dataFinePrestazione": "20141020110012",
  "tipoAttivitaClinica": "CON",
  "identificativoSottomissione": "2.16.840.1.113883.2.9.2.120.4.3.489592",
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
```

## 6.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="11" >STATUS CODE
   </td>
   <td> 200
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
   <td>403
   </td>
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 22: Response Servizio di Pubblicazione Sostituzione Documento_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

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
  <tr>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>Identificativo univoco della transazione
   </td>
  </tr>
</table>


_Tabella 23: Campi Response sempre valorizzati_

**Campi valorizzati solo in caso di warning**


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


_Tabella 24: Campi Response valorizzati in caso di warning_


### 6.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 6.2.2. Esempio di Messaggio di Risposta con esito KO 400

``` json
{
  "traceID": "61d8123fb20e2afc",
  "spanID": "61d8123fb20e2afc",
  "type": "/msg/cda-element",
  "title": "Errore in fase di recupero dell'esito della verifica.",
  "detail": "Il CDA non risulta validato",
  "status": 400,
  "instance": "/msg/cda-element"
}
```

# 7. Servizio di Aggiornamento Metadati

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Aggiornamento Metadati si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>/metadata
```

Lo scopo di questa API Sincrona è di aggiornare i metadati di un documento precedentemente pubblicato.


## 7.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>PUT
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/documents/{identificativoDocUpdate}/metadata
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>application/json
   </td>
  </tr>
</table>


_Tabella 25: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>FSE-JWT-Signature
   </td>
   <td>N.D.
   </td>
   <td>N.D.
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Path variable
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.uniqueId
   </td>
  </tr>
  <tr>
   <td rowspan="11" >Request Body
   </td>
   <td rowspan="11" >requestBody
   </td>
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
   <td>attiCliniciRegoleAccesso
   </td>
   <td>String[]
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.eventCodeList
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
   <td>XDSDocumentEntry.Slot - Conservazione a norma
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
   <td>descriptions
   </td>
   <td>String[]
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - description
   </td>
  </tr>
   <tr>
   <td>administrativeRequest
   </td>
   <td>AdministrativeReqEnum[]
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>
  
</table>


_Tabella 26: Parametri Richiesta di Pubblicazione Aggiornamento Metadati_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento di cui modificare i metadati e al parametro _identificativoDoc_ utilizzato nel servizio di creazione.


### 7.1.1. Esempio Messaggio di Richiesta

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti, senza indicazione della priorità. 

``` bash
curl -X 'PUT' \
  'https://<HOST>:<PORT>/v1/documents/507f1f77bcf86cd799439011/metadata' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'accept: application/json' \
  -d '{
  "tipologiaStruttura": "Ospedale",
  "attiCliniciRegoleAccesso": [
    "P99"
  ],
  "tipoDocumentoLivAlto": "WOR",
  "assettoOrganizzativo": "AD_PSC001",
  "dataInizioPrestazione": "20141020110012",
  "dataFinePrestazione": "20141020110012",
  "conservazioneANorma": "string",
  "tipoAttivitaClinica": "CON",
  "identificativoSottomissione": "2.16.840.1.113883.2.9.2.120.4.3.489592",
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}'\
-F 'file=@CDA_OK.pdf;type=application/pdf'
```

## 7.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="10" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Aggiornamento eseguito con successo
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
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 27: Response Servizio di Pubblicazione Aggiornamento Documento_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

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
   <td>Identificativo univoco assegnato alla singola operazione nell’ambito della richiesta dell'utente. In caso di richiesta avente operazioni multiple (su più microservizi), ognuna di esse avrà un differente spanId (ma stesso traceId). \
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


_Tabella 28: Campi Response sempre valorizzati_

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


_Tabella 29: Campi Response valorizzati in caso di warning_


### 7.2.1. Esempio di Messaggio di risposta con Esito Success 200

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 7.2.2. Esempio di Messaggio di Risposta con esito KO 400

``` json
{
  "traceID": "61d8123fb20e2afc",
  "spanID": "61d8123fb20e2afc",
  "type": "/msg/mandatory-element",
  "title": "Campo obbligatorio non presente",
  "detail": "Il campo identificativo documento deve essere valorizzato",
  "status": 400,
  "instance": "/msg/mandatory-element"
}
```

# 8. Servizio di validazione e pubblicazione creazione contestuale
Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l'invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti, è necessario fare riferimento al Capitolo 13 "Drilldown Parametri di Input.

L’Endpoint del caso d’uso di Validazione e pubblicazione creazione Documento CDA2 si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/validate-and-create
```

Lo scopo di questa API è validare (sintatticamente, semanticamente, terminologicamente) un documento CDA2. Nel caso di errore bloccante di validazione, il processo ritornerà all'utente il dettaglio relativo. Nel caso invece di errore non bloccante in validazione o di successo, si procederà all'indicizzazione sul FSE regionale, alla traduzione dei dati clinici nel formato HL7 FHIR e al successivo invio al Data Repository Centrale..


## 8.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>POST
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/documents/validate-and-create
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>multipart/form-data
   </td>
  </tr>
</table>


_Tabella 30: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>FSE-JWT-Signature
   </td>
   <td>N.D.
   </td>
   <td>N.D.
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td rowspan="18" >Request Body
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
   <td>attiCliniciRegoleAccesso
   </td>
   <td>String[]
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
   <td>XDSDocumentEntry.Slot - Conservazione a norma
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
   <tr>
   <td>descriptions
   </td>
   <td>String[]
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - description
   </td>
  </tr>
   <tr>
   <td>administrativeRequest
   </td>
   <td>AdministrativeReqEnum[]
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>
  
  
  
</table>


_Tabella 31: Parametri Richiesta di validazione pubblicazione creazione contestuale_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “priorita” consente al Gateway di decidere la priorità da attribuire al documento fornito in input al servizio.

Il Request Body è di tipo **multipart/form-data**, al suo interno sono previsti due parametri:



* **file** che dovrà contenere un file PDF con iniettato un Clinical Document in formato XML in linea con quanto riportato nelle «Implementation Guide CDA R2» al link [1]


* **requestBody** che dovrà contenere l’oggetto json con i parameter di input

### 8.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti, senza indicazione della priorità. 

``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v1/documents/validate-and-create' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "healthDataFormat": "CDA",
  "mode": "ATTACHMENT",
  "tipologiaStruttura": "Ospedale",
  "attiCliniciRegoleAccesso": [
    "P99"
  ],
  "identificativoDoc": "2.16.840.1.113883.2.9.2.120.4.4^290700",
  "identificativoRep": " 2.16.840.1.113883.2.9.2.120.4.5.1",
  "tipoDocumentoLivAlto": "REF",
  "assettoOrganizzativo": "AD_PSC001",
  "dataInizioPrestazione": "20141020110012",
  "dataFinePrestazione": "20141020110012",
  "tipoAttivitaClinica": "CON",
  "identificativoSottomissione": "2.16.840.1.113883.2.9.2.120.4.3.489592",
  "priorita": false,
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
```

### 8.1.2. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Resource”

Messaggio di richiesta con pdf con CDA innestato in modalità RESOURCE, tipo documento CDA e metadati formalmente corretti, con indicazione della priorità.

``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v1/documents/validate-and-create' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "healthDataFormat": "CDA",
  "mode": "RESOURCE",
  "tipologiaStruttura": "Ospedale",
  "attiCliniciRegoleAccesso": [
    "P99"
  ],
  "identificativoDoc": "2.16.840.1.113883.2.9.2.120.4.4^290701",
  "identificativoRep": " 2.16.840.1.113883.2.9.2.120.4.5.1",
  "tipoDocumentoLivAlto": "REF",
  "assettoOrganizzativo": "AD_PSC001",
  "dataInizioPrestazione": "20141020110012",
  "dataFinePrestazione": "20141020110012",
  "tipoAttivitaClinica": "CON",
  "identificativoSottomissione": "2.16.840.1.113883.2.9.2.120.4.3.489593",
  "priorita": true,
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \

  -F 'file=@CDA_OK.pdf;type=application/pdf'
```



## 8.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="11" >STATUS CODE
   </td>
   <td>201
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
   <td>403
   </td>
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 32: Response Servizio di Validazione Pubblicazione creazione contestuale_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

** La pubblicazione creazione non sarà eseguita se la validazione preliminare restituisce un esito negativo. In caso di errore in validazione o in trasformata FHIR, il servizio risponderà con codice di errore 400

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
  <tr>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>Identificativo univoco della transazione
   </td>
  </tr>
</table>


_Tabella 33: Campi Response sempre valorizzati_

**Campi valorizzati solo in caso di warning**


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


_Tabella 34: Campi Response valorizzati in caso di warning_


### 8.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Validazione Pubblicazione creazione contestuale con Attachment”

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" \
}
```

### 8.2.2. Esempio di Messaggio di Risposta con esito OK 400 - “Validazione Pubblicazione creazione contestuale con errore sintattico”


``` json
{ 
  "traceID": "79e2637736ad9bae", 
  "spanID": "79e2637736ad9bae", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.46a41df0ab0514f11c0811056832c3225e06c8e11824f27c7e5517ca5cfc57fe.ac05831184^^^^urn:ihe:iti:xdw:2013:workflowInstanceId", 
  "responseStatus": 400, 
  "type": "/msg/syntax", 
  "title": "Errore di sintassi.", 
  "detail": "Error while executing validation on xsd schema", 
  "instance": "/validation/error", 
  "status": "400" 
}
```

### 8.2.3. Esempio di Messaggio di Risposta con esito OK 201 - “Validazione Pubblicazione creazione contestuale con warning semantico”


``` json
{
  "traceID": "b20d5f0f59d117ca",
  "spanID": "b20d5f0f59d117ca",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.10908.4.4.2.0d0002200a27e9ead4de0891c19736a630eab68fb09f7851561bbfeed7389948.9562421609^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "warning": "[W005 | Sezione Esame Eseguito: l'entry/act/code può essere valorizzato secondo i sistemi di codifica\n\t\t\tLOINC @codeSystem='2.16.840.1.113883.6.1'\n\t\t\tICD-9-CM @codeSystem='2.16.840.1.113883.6.103']",
  "responseStatus": 201
}
```
 
# 9. Servizio di validazione pubblicazione sostituzione contestuale

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Validazione Pubblicazione Sostituzione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/validate-and-replace/<identificativoDocUpdate>
```

Lo scopo di questa API è validare (sintatticamente, semanticamente, terminologicamente) un documento CDA2. Nel caso di errore bloccante di validazione, il processo ritornerà all'utente il dettaglio relativo. Nel caso invece di errore non bloccante in validazione o di successo, si procederà all'indicizzazione sul FSE regionale sostituendo un documento precedentemente pubblicato, alla traduzione dei dati clinici nel formato HL7 FHIR e al successivo invio al Data Repository Centrale. 


## 9.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>PUT
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/documents/validate-and-replace/{identificativoDocUpdate}
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>multipart/form-data
   </td>
  </tr>
</table>


_Tabella 35: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>FSE-JWT-Signature
   </td>
   <td>N.D.
   </td>
   <td>N.D.
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Path variable
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>identificativoDocUpdate
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.uniqueId
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
   <td>attiCliniciRegoleAccesso
   </td>
   <td>List<String>
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
   <td>XDSDocumentEntry.Slot - Conservazione a norma
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
   <td>descriptions
   </td>
   <td>List
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - description
   </td>
  </tr>
   <tr>
   <td>administrativeRequest
   </td>
   <td>AdministrativeReqEnum
   </td>
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>

</table>


_Tabella 36: Parametri Richiesta di Validazione Pubblicazione Sostituzione contestuale_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “mode” comporta la resituzione di un errore di tipo warning. 

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento da sostituire e al parametro _identificativoDoc_ utilizzato precedentemente nel servizio di creazione.


### 9.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione Sostituzione Documento con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti, senza indicazione della priorità. 
 

``` bash
curl -X 'PUT' \
  'https://<HOST>:<PORT>/v1/documents/validate-and-replace/507f1f77bcf86cd799439011' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={
  "healthDataFormat": "CDA",
  "mode": "ATTACHMENT",
  "tipologiaStruttura": "Ospedale",
  "attiCliniciRegoleAccesso": [
    "P99"
  ],
  "identificativoDoc": "2.16.840.1.113883.2.9.2.120.4.4^290700",
  "identificativoRep": " 2.16.840.1.113883.2.9.2.120.4.5.1",
  "tipoDocumentoLivAlto": "REF",
  "assettoOrganizzativo": "AD_PSC001",
  "dataInizioPrestazione": "20141020110012",
  "dataFinePrestazione": "20141020110012",
  "tipoAttivitaClinica": "CON",
  "identificativoSottomissione": "2.16.840.1.113883.2.9.2.120.4.3.489592",
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \

  -F 'file=@CDA_OK.pdf;type=application/pdf'
```

## 9.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="11" >STATUS CODE
   </td>
   <td> 200
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
   <td>403
   </td>
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found***
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 37: Response Servizio di Validazione pubblicazione Sostituzione Documento contestuale_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

** La pubblicazione sostituzione non sarà eseguita se la validazione preliminare restituisce un esito negativo. In caso di errore in validazione o in trasformata FHIR, il servizio risponderà con codice di errore 400.

*** La pubblicazione sostituzione restituirà codice di errore 404 se il documento che si intende sostituire non è presente su INI.

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
  <tr>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>Identificativo univoco della transazione
   </td>
  </tr>
</table>


_Tabella 38: Campi Response sempre valorizzati_

**Campi valorizzati solo in caso di warning**


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


_Tabella 39: Campi Response valorizzati in caso di warning_


### 9.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”

``` json
{ 
 "traceID": "c2e1818fbf7aea7f", 
 "spanID": "c2e1818fbf7aea7f", 
 "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 9.2.2. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con warning semantico”

``` json
{
  "traceID": "b20d5f0f59d117ca",
  "spanID": "b20d5f0f59d117ca",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.10908.4.4.2.0d0002200a27e9ead4de0891c19736a630eab68fb09f7851561bbfeed7389948.9562421609^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "warning": "[W005 | Sezione Esame Eseguito: l'entry/act/code può essere valorizzato secondo i sistemi di codifica\n\t\t\tLOINC @codeSystem='2.16.840.1.113883.6.1'\n\t\t\tICD-9-CM @codeSystem='2.16.840.1.113883.6.103']",
  "responseStatus": 201
}
```

### 9.2.3. Esempio di Messaggio di Risposta con esito OK 400, “Pubblicazione Sostituzione Documento con errore sintattico”

``` json
{ 
  "traceID": "79e2637736ad9bae", 
  "spanID": "79e2637736ad9bae", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.46a41df0ab0514f11c0811056832c3225e06c8e11824f27c7e5517ca5cfc57fe.ac05831184^^^^urn:ihe:iti:xdw:2013:workflowInstanceId", 
  "responseStatus": 400, 
  "type": "/msg/syntax", 
  "title": "Errore di sintassi.", 
  "detail": "Error while executing validation on xsd schema", 
  "instance": "/validation/error", 
  "status": "400" 
}
```


# 10. Servizio di Recupero Stato Transazione per WorkflowInstanceId

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Recupero Stato Transazione per WorkflowInstanceId si compone come segue:

```
https://<HOST>:<PORT>/v<major>/status/<workflowInstanceId>
```

Lo scopo di questa API Sincrona è di recuperare la lista di tutti gli eventi di una transazione associati ad un workflowInstanceId.


## 10.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>GET
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/status/{workflowInstanceId}
   </td>
  </tr>
</table>


_Tabella 30: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Path variable
   </td>
   <td>workflowInstanceId
   </td>
   <td>workflowInstanceId
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
</table>


_Tabella 31: Parametri Richiesta di Recupero Stato Transazioni per WorkflowInstanceId_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.


### 10.1.1. Esempio Messaggio di Richiesta stato Transazioni

Messaggio di richiesta con workflowInstanceId valorizzato

``` bash
curl -X 'GET' \
'https://<HOST>:<PORT>/v1/status/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'accept: application/json' 
```

## 10.2. Response


<table>
  <tr>
   <td>TIPO IN CASO DI SUCCESSO
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
   <td rowspan="10" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Success
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
   <td>Token jwt mancante o non valido
   </td>
  </tr>
  <tr>
   <td>404
   </td>
   <td>Not found
   </td>
  </tr>
  <tr>
   <td>409
   </td>
   <td>Conflict
   </td>
  </tr>
  <tr>
   <td>413
   </td>
   <td>Payload too large
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
   <td>Invalid response received from the API Implementation
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>
   </td>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 32: Response Servizio di Recupero Stato Transazione per WorkflowInstanceId_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 12 “Drilldown Error Response”.

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
   <td>Identificativo univoco assegnato alla singola operazione nell’ambito della richiesta dell'utente. In caso di richiesta avente operazioni multiple (su più microservizi), ognuna di esse avrà un differente spanId (ma stesso traceId). \
traceId e spanId coincidono nella prima operazione.
   </td>
  </tr>
</table>


_Tabella 33: Campi Response sempre valorizzati_

**Campi valorizzati in caso di Success**


<table>
  <tr>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>ATTRIBUTE</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
   <td rowspan="13" >transactionData
   </td>
   <td>eventType
   </td>
   <td>String
   </td>
   <td>Tipologia di evento emesso
   </td>
  </tr>
  <tr>
   <td>eventDate
   </td>
   <td>String
   </td>
   <td>Timestamp di emissione dell’evento
   </td>
  </tr>
  <tr>
   <td>eventStatus
   </td>
   <td>String
   </td>
   <td>Stato dell’evento (SUCCESS, BLOCKING_ERROR, etc)
   </td>
  </tr>
  <tr>
   <td>message
   </td>
   <td>String
   </td>
   <td>Messaggio opzionale che descrive l’evento
   </td>
  </tr>
  <tr>
   <td>identificativoDocumento
   </td>
   <td>String
   </td>
   <td>Identificativo del documento a cui è associato l’evento emesso
   </td>
  </tr>
  <tr>
   <td>subject
   </td>
   <td>String
   </td>
   <td>Subject a cui è associato l’evento
   </td>
  </tr>
  <tr>
   <td>subjectRole
   </td>
   <td>String
   </td>
   <td>Ruolo del Subject a cui è associato l’evento
   </td>
  </tr>
  <tr>
   <td>tipoAttivita
   </td>
   <td>String
   </td>
   <td>tipologia dell’attività associata all’evento
   </td>
  </tr>
  <tr>
   <td>organizzazione
   </td>
   <td>String
   </td>
   <td>Organizzazione 
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
  <tr>
   <td>traceId
   </td>
   <td>String
   </td>
   <td>Identificativo univoco assegnato alla richiesta dell'utente
   </td>
  </tr>
  <tr>
   <td>issuer
   </td>
   <td>String
   </td>
   <td>Issuer associato all’evento
   </td>
  </tr>
  <tr>
   <td>expiringDate
   </td>
   <td>String
   </td>
   <td>Data di eliminazione della transazione dai sistemi
   </td>
  </tr>
</table>


_Tabella 34: Campi Response sempre valorizzati_


### 10.2.1. Esempio messaggio di risposta con Esito Success 200

``` json
{
  "traceID": "3f67b89ba72ed40b",
  "spanID": "81bad71c3ffea6d0",
  "transactionData": [
    {
      "eventType": "VALIDATION",
      "eventDate": "2022-12-12T12:11:35.955+00:00",
      "eventStatus": "SUCCESS",
      "subject": "SSSMNN75B01F257L^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO",
      "organizzazione": "110",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.5ce1a25ed9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "4dfc0f6e30444deb",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2022-12-17T12:11:35.998+00:00"
    },
    {
      "eventType": "PUBLICATION",
      "eventDate": "2022-12-12T12:11:38.280+00:00",
      "eventStatus": "SUCCESS",
      "identificativoDocumento": "2.16.840.1.113883.2.9.2.110.4.4^27847450",
      "subject": "SSSMNN75B01F257L^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO",
      "tipoAttivita": "PHR",
      "organizzazione": "110",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.5ce1a25ed9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "e46dfa44b05ba6b7",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2022-12-17T12:11:38.341+00:00"
    },
    {
      "eventType": "SEND_TO_INI",
      "eventDate": "2022-12-12T12:11:39.063+00:00",
      "eventStatus": "SUCCESS",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.5ce1a25ed9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2022-12-17T12:11:39.091+00:00"
    },
    {
      "eventType": "SEND_TO_EDS",
      "eventDate": "2022-12-12T12:11:39.262+00:00",
      "eventStatus": "SUCCESS",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.5ce1a25ed9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2022-12-17T12:11:39.309+00:00"
    },
    {
      "eventType": "EDS_WORKFLOW",
      "eventDate": "2022-12-12T12:11:47.275+00:00",
      "eventStatus": "SUCCESS",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.5ce1a25ed9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2022-12-17T12:11:47.302+00:00"
    }

  ]

}
```

### 10.2.2. Esempio di Messaggio di Risposta con esito KO 400

``` json
{
  "traceID": "6cd7a61189e8282f",
  "spanID": "6cd7a61189e8282f",
  "type": "msg/record-not-found",
  "title": "Record non trovato.",
  "detail": "No Record Found",
  "status": 404,
  "instance": ""
}
```

# 11. Servizio di Recupero Stato Transazione per TraceId

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Recupero Stato Transazione per WorkflowInstanceId si compone come segue:

```
https://<HOST>:<PORT>/v<major>/status/search/<traceId>
```

Lo scopo di questa API Sincrona è di recuperare la lista di tutti gli eventi di una transazione associati ad un traceId. 


## 11.1. Request


<table>
  <tr>
   <td>METHOD
   </td>
   <td>GET
   </td>
  </tr>
  <tr>
   <td>URL
   </td>
   <td>/v1/status/search/{traceId}
   </td>
  </tr>
</table>


_Tabella 35: Method, URL, Type_


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
   <td>Authorization
   </td>
   <td>N.D.
   </td>
   <td>Bearer
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Header
   </td>
   <td>Accept
   </td>
   <td>application/json
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
  <tr>
   <td>Path variable
   </td>
   <td>traceId
   </td>
   <td>traceId
   </td>
   <td>String
   </td>
   <td>true
   </td>
   <td>N.A.
   </td>
  </tr>
</table>


_Tabella 36: Parametri Richiesta di Recupero Stato Transazioni per traceId_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.


### 11.1.1. Esempio Messaggio di Richiesta stato Transazioni

Messaggio di richiesta con workflowInstanceId valorizzato

``` bash
curl -X 'GET' \
  'https://<HOST>:<PORT>/v1/status/search/3f67b89ba72ed40b’ \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \ \
  -H 'accept: application/json' 
```

## 11.1. Response

Per ulteriori dettagli su response del servizio in oggetto è necessario fare riferimento al Capitolo 8 “Servizio di Recupero stato transazione per WorkflowInstanceId”


# 12. Drilldown Response in caso di Errore

Il Gateway genererà due tipologie di errore distinte, entrambe aderenti alla specifica RFC 7807.


## 12.1. Errori Applicativi

Di seguito vengono indicati i campi valorizzati soltanto in caso di errori provenienti dall’applicativo


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


_Tabella 37: Campi Response valorizzati in caso di errore_


### 12.3.1. Esempi di errore generati dal Gateway


<table>
  <tr>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>TITLE</strong>
   </td>
   <td><strong>DETAIL</strong>
   </td>
   <td><strong>STATUS</strong>
   </td>
   <td><strong>INSTANCE</strong>
   </td>
  </tr>
  <tr>
   <td>/msg/cda-element
   </td>
   <td>Errore in fase di estrazione del CDA.
   </td>
   <td>Errore in fase di estrazione del CDA.
   </td>
   <td>400
   </td>
   <td>/cda-extraction
   </td>
  </tr>
  <tr>
   <td>/msg/syntax
   </td>
   <td>Errore di sintassi.
   </td>
   <td>{dinamico in base all’errore}
   </td>
   <td>400
   </td>
   <td>/validation/error
   </td>
  </tr>
  <tr>
   <td>/msg/semantic
   </td>
   <td>Errore semantico.
   </td>
   <td>{dinamico in base all’errore}
   </td>
   <td>422
   </td>
   <td>/validation/error
   </td>
  </tr>
  <tr>
   <td>/msg/vocabulary
   </td>
   <td>Errore vocabolario.
   </td>
   <td>{dinamico in base all’errore}
   </td>
   <td>400
   </td>
   <td>/validation/error
   </td>
  </tr>
  <tr>
   <td>/msg/cda-match
   </td>
   <td>Errore in fase di recupero dell'esito della verifica.
   </td>
   <td>Il CDA non risulta validato
   </td>
   <td>400
   </td>
   <td>/cda-validation
   </td>
  </tr>
  <tr>
   <td>/msg/empty-file
   </td>
   <td>File vuoto.
   </td>
   <td>File vuoto
   </td>
   <td>400
   </td>
   <td>/empty-multipart-file
   </td>
  </tr>
  <tr>
   <td>/msg/document-type
   </td>
   <td>Il documento non è pdf.
   </td>
   <td>Il documento non è pdf.
   </td>
   <td>415
   </td>
   <td>/multipart-file
   </td>
  </tr>
  <tr>
   <td>/msg/document-hash
   </td>
   <td>Verifica hash fallita.
   </td>
   <td>Verifica hash fallita.
   </td>
   <td>400
   </td>
   <td>/jwt-hash-match
   </td>
  </tr>
  <tr>
   <td>/msg/mandatory-element
   </td>
   <td>Campo obbligatorio non presente.
   </td>
   <td>Il campo {nomeCampo} deve essere valorizzato
   </td>
   <td>400
   </td>
   <td>/request-missing-field
   </td>
  </tr>
  <tr>
   <td>/msg/invalid-format
   </td>
   <td>Formato campo non valido.
   </td>
   <td>Il campo {nomeCampo} deve essere valorizzato correttamente
   </td>
   <td>400
   </td>
   <td>/request-invalid-date-format
   </td>
  </tr>
  <tr>
   <td>/msg/mandatory-element-token
   </td>
   <td>Token JWT non valido.
   </td>
   <td>Token JWT non valido
   </td>
   <td>403
   </td>
   <td>/jwt-mandatory-field-missing
   </td>
  </tr>
  <tr>
   <td>/msg/jwt-validation
   </td>
   <td>Campo token JWT non valido.
   </td>
   <td>{dinamico in base all’errore ricevuto} 
   </td>
   <td>403
   </td>
   <td>/jwt-person-id
   </td>
  </tr>
  <tr>
   <td>/msg/fhir-mapping-type
   </td>
   <td>Mapping fhir fallito.
   </td>
   <td>{dinamico in base all’errore di trasformazione}
   </td>
   <td>400
   </td>
   <td>/fhir-resource
   </td>
  </tr>
  <tr>
   <td>/msg/generic-timeout
   </td>
   <td>Generic timeout.
   </td>
   <td>{dinamico in base all’errore}
   </td>
   <td>504
   </td>
   <td>-
   </td>
  </tr>
  <tr>
   <td>/msg/workflow-id-error-extraction
   </td>
   <td>Errore in fase di estrazione del workflow id.
   </td>
   <td>Errore durante l'estrazione del workflow instance id
   </td>
   <td>400
   </td>
   <td>/msg/workflow-id-error-extraction
   </td>
  </tr>
  <tr>
   <td>/msg/record-not-found
   </td>
   <td>Record non trovato.
   </td>
   <td>{dinamico in base a cosa non viene trovato}
   </td>
   <td>404
   </td>
   <td>-
   </td>
  </tr>
  <tr>
   <td>/msg/ini-error
   </td>
   <td>Ini error.
   </td>
   <td>{dinamico in base all’errore}
   </td>
   <td>{dinamico da INI}
   </td>
   <td>/msg/service-error/ini
   </td>
  </tr>
  <tr>
   <td>/msg/generic-error
   </td>
   <td>Errore generico.
   </td>
   <td>{dinamico in base all’errore}
   </td>
   <td>500
   </td>
   <td>-
   </td>
  </tr>
  <tr>
   <td>/msg/missing-token
   </td>
   <td>Token non fornito.
   </td>
   <td>Attenzione il jwt fornito risulta essere vuoto
   </td>
   <td>403
   </td>
   <td>/missing-jwt
   </td>
  </tr>
  <tr>
   <td>/msg/eds-error
   </td>
   <td>Eds error.
   </td>
   <td>Document cannot be found on the Server FHIR
   </td>
   <td>404
   </td>
   <td>/msg/eds-document-missing
   </td>
  </tr>
  <tr>
   <td>/msg/max-day-limit-exceed
   </td>
   <td>Error: document exceeded the maximum period to be published.
   </td>
   <td>Error: cannot publish documents older than 5 days
   </td>
   <td>400
   </td>
   <td>/msg/max-day-limit-exceed
   </td>
  </tr>
</table>



## 12.1. Errori provenienti da Apparati di Frontiera

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
   <td>govway_id
   </td>
   <td>String
   </td>
   <td>Identificativo di transazione che permette di individuare la transazione tramite la Console di Monitoraggio GovWay
   </td>
  </tr>
</table>


_Tabella 38: Campi Response valorizzati in caso di errore govWay_


# 13. Drilldown Parametri di Input

Come riportato nel documento "Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Framework e dataset dei servizi base - Versione 2.5” l’interoperabilità fra i differenti sistemi di FSE a livello nazionale è assicurata tramite INI. 

INI rappresenta un mediatore per le comunicazioni tra i diversi sistemi regionali che appartengono allo stesso Affinity Domain, in grado di garantire ad un sistema di FSE di una regione diversa da quella di assistenza l’accesso ai documenti.

Per individuare i parametri di input dei servizi di pubblicazione relativi alla creazione è necessario quindi fare riferimento al dataset del servizio base di comunicazione metadati presentato al paragrafo 3.3 del documento citato in precedenza.

I campi dei messaggi di richiesta comunicazione metadati riportati nella tabella 9 sono suddivisi per tipologia, in particolare possiamo individuare:



* I campi “asserzione attributo”  
Campi aventi una natura tale da richiedere una certificazione da parte di Sistemi preposti; proprio per rispettare tale vincolo, i campi in questione dovranno essere inviati al Gateway attraverso il JWT fornito nell’header della chiamata.



* I campi “specifici per messaggio”  
Campi che possono essere forniti al Gateway direttamente tramite la request body.

Nella parte restante di questo paragrafo saranno descritti puntualmente i campi recuperati dal JWT (che coincidono con i campi “asserzione attributo”) e quelli recuperati dalla request body (che nascono dall’unione dei campi “specifici per messaggio” che non possono essere dedotti dal contesto di invocazione).


## 13.1. Campi Contenuti nei JWT

Gli endpoint del Gateway ricevono 2 token JWT:



* **Authentication Bearer Token**: token di autenticazione, composto da Header e Reserved Claims;

     


<table>
  <tr>
   <td colspan="2" >
<strong>HEADER: ALGORITHM & TOKEN TYPE</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2" style="text-align:center"><strong>ALG</strong>
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
   <td><code>alg</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>TYPE</strong>
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
   <td><code>typ</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>KID</strong>
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
   <td><code>kid</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>XC5</strong>
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
   <td><code>x5c</code>
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>RESERVED CLAIMS</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>ISSUER</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Stringa che contiene il nome identificativo dell’entità che ha generato il token. Valorizzato con “auth:” seguito dal “Common Name del certificato di firma”
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>auth:190201123456XX
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
   <td><code>iss</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>ISSUED AT</strong>
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
   <td><code>iat</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>EXPIRATION</strong>
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
   <td><code>exp</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>JWT ID</strong>
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
   <td><code>Jti</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>AUDIENCE</strong>
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
   <td><code>aud</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>SUBJECT</strong>
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
   <td><code>sub</code>
   </td>
  </tr>
</table>


_Tabella 39: Campi contenuti in Authentication Bearer Token_



* **FSE-JWT-Signature**: token JWT contenente custom claims necessari ai fini applicativi

<table>
  <tr>
   <td colspan="2" >
<strong>HEADER: ALGORITHM & TOKEN TYPE</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>ALG</strong>
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
   <td><code>alg</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>TYPE</strong>
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
   <td><code>typ</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>KID</strong>
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
   <td><code>kid</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>XC5</strong>
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
   <td><code>x5c</code>
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>RESERVED CLAIMS</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>ISSUER</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Stringa che contiene il nome identificativo dell’entità che ha generato il token. Valorizzato con “integrity:” seguito dal “Common Name del certificato di firma”
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>integrity:190201123456XX
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
   <td><code>iss</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>ISSUED AT</strong>
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
   <td><code>iat</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>EXPIRATION</strong>
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
   <td><code>exp</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>JWT ID</strong>
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
   <td><code>Jti</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>AUDIENCE</strong>
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
   <td><code>aud</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>SUBJECT</strong>
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
   <td><code>sub</code>
   </td>
  </tr>
</table>



---

<table>
  <tr>
   <td colspan="2" ><strong>CUSTOM CLAIMS</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>IDENTIFICATIVO ORGANIZZAZIONE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identificativo del dominio dell’utente (vedi TABELLA ORGANIZZAZIONE - Valore)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>190
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
   <td><code>subject_organization_id</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>DESCRIZIONE ORGANIZZAZIONE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Descrizione del dominio dell’utente (vedi TABELLA ORGANIZZAZIONE - Descrizione)
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>Regione Sicilia
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
   <td><code>subject_organization</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>STRUTTURA UTENTE</strong>
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
   <td><code>locality</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>RUOLO UTENTE</strong>
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
   <td><code>subject_role</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>IDENTIFICATIVO ASSISTITO</strong>
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
   <td><code>person_id</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>PRESA IN CARICO</strong>
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
   <td><code>patient_consent</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>CONTESTO OPERATIVO RICHIESTA</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Contesto operativo della richiesta.
Vedi TABELLA CONTESTO OPERATIVO
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>TREATMENT per il servizio di Validazione, Creazione 
<p>
UPDATE per il servizio di Eliminazione Documento, Aggiornamento Metadati e Sostituzione Documento
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
   <td><code>purpose_of_use</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>TIPO DOCUMENTO</strong>
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
   <td>Non Obbligatorio per il servizio di Eliminazione Documento e Aggiornamento Metadati
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td><code>resource_hl7_type</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>TIPO ATTIVITÀ</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Descrive il tipo di attività     
<p>
Vedi TABELLA TIPO ATTIVITÀ
<p>
Riferimento: urn:oasis:names:tc:xacml:1.0:action:action-id
   </td>
  </tr>
  <tr>
   <td><strong>VALORE</strong>
   </td>
   <td>CREATE per il servizio di Creazione
<p>
DELETE per il servizio di Eliminazione Documento
<p>
UPDATE per il servizio di Sostituzione Documento e Aggiornamento Metadati
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
   <td><code>action_id</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>HASH FILE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Hash (SHA256) del file fornito in input
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
   <td>Obbligatorio per i servizi di Creazione e Sostituzione Documento
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td><code>attachment_hash</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>ID APPLICATIVO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>ID applicativo dell’utente
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>BARMED
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
   <td><code>subject_application_id</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>VENDOR APPLICATIVO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Vendor applicativo dell’utente
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>FOO SPA
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
   <td><code>subject_application_vendor</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>VERSIONE APPLICATIVO</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Versione applicativo dell’utente
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>V.4.2.0
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
   <td><code>subject_application_version</code>
   </td>
  </tr>
</table>


_Tabella 40: Campi contenuti in FSE-JWT-Signature_



**Esempio di utilizzo del token bearerAuth**

```
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg
```

**Esempio di token decodificato, sezione header**

``` json
{
  "alg": "RS256",
  "typ": "JWT",
  "x5c": [
    "MIIDXjCCAkagAwIBAgIBAjANBgkqhkiG9w ... 779BM4SOI="
  ]
}
```

**Esempio di Payload del token FSE-JWT-Signature decodificato**

``` json
{ 
  "sub": "RSSMRA22A01A399Z^^^&2.16.840.1.113883.2.9.4.3.2&ISO", 
  "subject_role": "AAS", 
  "purpose_of_use": "TREATMENT", 
  "iss": "190201123456XX", 
  "locality": "201123456", 
  "subject_organization": "Regione Sicilia", 
  "subject_organization_id": "190", 
  "aud": "https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1", 
  "patient_consent": true, 
  "action_id": "CREATE", 
  "resource_hl7_type": "11502-2^^2.16.840.1.113883.6.1", 
  "exp": 1656541352925, 
  "iat": 1656454952925, 
  "jti": "1234", 
  "attachment_hash": "d04f5f5d34c7bbb77e27fba4edb2c49d16ca90193d89a47117e892387c7ee466", 
  "person_id": "PROVAX00X00X000Y^^^&2.16.840.1.113883.2.9.4.3.2&ISO" 
}
```



## 13.2. Campi Contenuti nella Request Body

Per i campi contenuti nella request body si evidenzia nel campo “provenienza” se questi sono campi introdotti per rendere possibile la comunicazione con INI o se questi sono stati appositamente introdotti per gestire in maniera efficace ed efficiente il gateway.


<table>
  <tr>
   <td colspan="2" ><strong>WORKFLOW INSTANCE ID</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td><code>workflowInstanceId</code>
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
   <td><code>healthDataFormat</code>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identifica il formato con cui vengono espressi i dati sanitari.
<p>
Se non viene specificato alcun valore si assume che il formato sia CDA.
<p>
Vedi TABELLA HEALTH DATA FORMAT ENUM
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
   <td><code>mode</code>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identifica la modalità con la quale i dati sanitari sono stati iniettati nel PDF
<p>
Se non viene specificato alcun valore il Gateway proverà entrambe le modalità di estrazione
<p>
Vedi TABELLA INJECTION MODE ENUM
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
   <td><code>activity</code>
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
   <td><code>tipologiaStruttura</code>
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
   <td><code>attiCliniciRegoleAccesso</code>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Metadato che può essere utilizzato per rappresentare i principali atti clinici che vengono documentati, come ulteriore specializzazione del metadato typeCode, ed è utilizzato anche per specificare la politica di visibilità del documento (ossia se esso è oscurato o meno).Per quanto riguarda la descrizione dell’evento documentato, questo metadato può ad esempio specificare il tipo di vaccino o indicare la tipologia di tampone documentata nel referto di laboratorio. \
Da Affinity Domain, come specificato al paragrafo 2.7, Tabella 2.7-1 \
Vedi TABELLA EVENT CODE
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
   <td><code>identificativoDoc<code>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Da Affinity Domain, come specificato al paragrafo 2.20:
L’OID da utilizzare per il metadato uniqueId deve essere strutturato nel seguente modo: per i documenti gestiti da un sistema di FSE regionale, il valore deve essere 2.16.840.1.113883.2.9.2.[REGIONE].4.4^X, dove X rappresenta una specifica istanza di documento presente in regione; per i documenti gestiti da Sistema TS, il valore deve essere 2.16.840.1.113883.2.9.4.3.8^Y, dove Y rappresenta una specifica istanza di documento presente nel Sistema TS (ad esempio Y è pari al NRE per la prescrizione dematerializzata). Il valore [REGIONE] è il valore corrispondente alla regione indicato in Tabella 6.43 (la prima cifra numerica pari a 0 va omessa).
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
   <td>Obbligatorio
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
   <td><code>identificativoRep</code>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Identificativo del repository che custodisce il documento \
Codificato con OID, come specificato al paragrafo 2.15 del documento Affinity Domain. \
 L’OID che deve essere utilizzato per il metadato repositoryUniqueId deve essere strutturato nel seguente modo: 2.16.840.1.113883.2.9.2.[REGIONE oppure INI].4.5.X, dove X rappresenta una specifica istanza di repository.
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
   <td><code>tipoDocumentoLivAlto</code>
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
   <td><code>assettoOrganizzativo</code>
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
   <td><code>dataInizioPrestazione</code>
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
   <td><code>dataFinePrestazione</code>
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
   <td><code>conservazioneANorma</code>
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
   <td><code>tipoAttivitaClinica</code>
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
   <td>Metadato che rappresenta l’identificativo univoco dell’oggetto XDSSubmissionSet.
<p>
Formato codifica conforme alla specifiche IHE (ITI TF-3), di tipo OID, strutturato nel seguente modo:  \
2.16.840.1.113883.2.9.2.[REGIONE oppure INI].4.3.X, dove X rappresenta una specifica istanza di XDSSubmissionSet.
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
   <td><code>priorita</code>
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
  <tr>
   <td colspan="2" ><strong>DESCRIPTIONS</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td><code>descriptions</code>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Questo metadato permette di specificare una ulteriore descrizione associata al documento.
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>[CODICE]^[Descrizione]^[OID]
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
  <tr>
   <td colspan="2" ><strong>ADMINISTRATIVE REQUEST</strong>
   </td>
  </tr>
  <tr>
   <td><strong>PARAMETRO</strong>
   </td>
   <td><code>administrativeRequest</code>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Questo metadato permette di indicare il regime nel quale il documento è stato prodotto.
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>SSN
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


_Tabella 41: Campi contenuti nella Request Body_

	




## 13.3. Tabelle di Riferimento

Nella sezione presente vengono riportate le Tabelle di Riferimento per i Parametri di Input: se specificato in “Fonte” queste sono riconducibili alle “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”, laddove non specificato si tratta di tabelle custom create ad uso dei servizi di questo documento.

Le informazioni riportate nelle tabelle con Fonte Affinity Domain, rispetto alle medesime specifiche di riferimento (versione 2.5), sono esclusivamente quelle necessarie all’utilizzo dei servizi di validazione e di pubblicazione.

Eventuali variazioni normative e/o ad Affinity Domain implicano l’aggiornamento delle tabelle referenziate.


### 13.3.1. Attività Clinica Enum

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


<table>
  <tr>
    <td><strong>Codice</strong></td>
    <td><strong>DisplayName</strong></td>
    <td><strong>Descrizione utilizzo</strong></td>
  </tr>
  <tr>
    <td>PHR</td>
    <td>Personal Health Record Update</td>
    <td>Documenti trasmessi direttamente dal paziente mediante il taccuino personale.</td>
  </tr>
  <tr>
    <td>CON</td>
    <td>Consulto</td>
    <td>Documenti trasmessi per richiedere un consulto.</td>
  </tr>
  <tr>
    <td>DIS</td>
    <td>Discharge</td>
    <td>Documenti trasmessi a seguito di un ricovero.</td>
  </tr>
  <tr>
    <td>ERP</td>
    <td>Erogazione Prestazione Prenotata</td>
    <td>Documenti trasmessi a seguito di una prestazione programmata/prenotata</td>
  </tr>
  <tr>
    <td>Sistema_TS</td>
    <td>Documenti sistema TS</td>
    <td>Documenti resi disponibili nel FSE dal Sistema TS.</td>
  </tr>
  <tr>
    <td>INI</td>
    <td>Documenti INI</td>
    <td>Documenti trasferiti da INI durante il trasferimento indice alla nuova RDA.</td>
  </tr>
  <tr>
    <td>PN_DGC</td>
    <td>Documenti PN-DGC</td>
    <td>Documenti resi disponibili dalla Piattaforma Nazionale DGC al sistema FSE.</td>
  </tr>
  <tr>
    <td>OBS</td>
    <td>Documento stato di salute</td>
    <td>Documenti trasmessi al FSE per arricchire la valutazione dello stato di salute del paziente.</td>
  </tr>
</table>


_Tabella 42:  _Value set per il metadato XDSSubmissionSet.contentTypeCode




### 13.3.2. Healthcare Facility Type Code

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


<table>
  <tr>
    <td><strong>Codice</strong></td>
    <td><strong>DisplayName</strong></td>
    <td><strong>Descrizione utilizzo</strong></td>
  </tr>
  <tr>
    <td>Ospedale</td>
    <td>Ospedale</td>
    <td>Indica che il documento è stato prodotto in regime di ricovero ospedaliero del paziente.</td>
  </tr>
  <tr>
    <td>Prevenzione</td>
    <td>Prevenzione</td>
    <td>Indica che il documento è stato prodotto a seguito di uno screening o di medicina preventiva.</td>
  </tr>
  <tr>
    <td>Territorio</td>
    <td>Territorio</td>
    <td>Indica che il documento è stato prodotto a seguito di un incontro con uno specialista territoriale (ad es. MMG, PLS, ecc.).</td>
  </tr>
  <tr>
    <td>SistemaTS</td>
    <td>SistemaTS</td>
    <td>Indica che il documento è gestito e condiviso dal Sistema TS.</td>
  </tr>
  <tr>
    <td>Cittadino</td>
    <td>Cittadino</td>
    <td>Indica che il dato/documento è stato inserito dal cittadino.</td>
  </tr>
  <tr>
    <td>MdsPN_DGC</td>
    <td>MdsPN-DGC</td>
    <td>Piattaforma Nazionale DGC del Ministero Della Salute.</td>
  </tr>
</table>


_Tabella 43:  _Value set per il metadato XDSDocumentEntry.healthcareFacilityTypeCode_reFacilityTypeCode_




### 13.3.3. Tipo Documento Alto Livello

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


<table>
  <tr>
    <td><strong>Codice</strong></td>
    <td><strong>DisplayName</strong></td>
    <td><strong>Descrizione utilizzo</strong></td>
  </tr>
  <tr>
    <td>WOR</td>
    <td>Documento di workflow</td>
    <td>Questa classe di documenti deve essere utilizzata per i documenti di workflow.</td>
  </tr>
  <tr>
    <td>REF</td>
    <td>Referto</td>
    <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di referto.</td>
  </tr>
  <tr>
    <td>LDO</td>
    <td>Lettera di dimissione ospedaliera</td>
    <td>Questa classe di documenti deve essere utilizzata per le lettere di dimissione ospedaliera.</td>
  </tr>
  <tr>
    <td>RIC</td>
    <td>Richiesta</td>
    <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di richiesta (prescrizioni, richieste di consulto, ecc.).</td>
  </tr>
  <tr>
    <td>SUM</td>
    <td>Sommario</td>
    <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di sommario (ad es. profilo sanitario sintetico).</td>
  </tr>
  <tr>
    <td>TAC</td>
    <td>Taccuino</td>
    <td>Questa classe deve essere utilizzata per indicare documenti trasmessi nel taccuino dall’assistito.</td>
  </tr>
  <tr>
    <td>PRS</td>
    <td>Prescrizione</td>
    <td>Questa classe specifica che le informazioni riguardano le prescrizioni condivise dal Sistema TS.</td>
  </tr>
  <tr>
    <td>PRE</td>
    <td>Prestazioni</td>
    <td>Questa classe specifica che le informazioni riguardano le prestazioni erogate condivise dal Sistema TS.</td>
  </tr>
  <tr>
    <td>ESE</td>
    <td>Esenzione</td>
    <td>Questa classe indica che le informazioni riguardano le esenzioni.</td>
  </tr>
  <tr>
    <td>PDC</td>
    <td>Piano di cura</td>
    <td>Questa classe specifica che le informazioni riguardano i piani terapeutici condivisi dal Sistema TS.</td>
  </tr>
  <tr>
    <td>VAC</td>
    <td>Vaccino</td>
    <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di vaccino (scheda della singola vaccinazione, certificato vaccinale).</td>
  </tr>
  <tr>
    <td>CER</td>
    <td>Certificato per DGC</td>
    <td>Questa classe di documenti deve essere utilizzata per i documenti associati al Digital Green Certificate (certificazione verde Covid-19, certificazione di guarigione da Covid-19).</td>
  </tr>
  <tr>
    <td>VRB</td>
    <td>Verbale</td>
    <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di verbale (ad es. verbale di pronto soccorso).</td>
  </tr>
  <tr>
    <td>CON</td>
    <td>Documento di consenso</td>
    <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di documento di consenso (ad es. consenso informato anestesia).</td>
  </tr>
  <tr>
    <td>CNT</td>
    <td>Documento di controllo</td>
    <td>Questa classe di documenti deve essere utilizzata per ogni tipologia di documento che descrive un controllo clinico (ad es. bilanci di salute).</td>
  </tr>
</table>


_Tabella 44: _Value set per il metadato XDSDocumentEntry.classCode


### 13.3.4. Event Code

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


<table>
  <tr>
    <td><strong>Codice</strong></td>
    <td><strong>DisplayName</strong></td>
    <td><strong>Descrizione utilizzo</strong></td>
  </tr>
  <tr>
    <td>J07AC</td>
    <td>J07AC</td>
    <td>Anthrax vaccines</td>
  </tr>
  <tr>
    <td>J07AC01</td>
    <td>J07AC01</td>
    <td>anthrax antigen</td>
  </tr>
  <tr>
    <td>J07AD</td>
    <td>J07AD</td>
    <td>Brucellosis vaccines</td>
  </tr>
  <tr>
    <td>J07AD01</td>
    <td>J07AD01</td>
    <td>brucella antigen</td>
  </tr>
  <tr>
    <td>J07AE</td>
    <td>J07AE</td>
    <td>Cholera vaccines</td>
  </tr>
  <tr>
    <td>J07AE01</td>
    <td>J07AE01</td>
    <td>cholera, inactivated, whole cell</td>
  </tr>
  <tr>
    <td>J07AE02</td>
    <td>J07AE02</td>
    <td>cholera, live attenuated</td>
  </tr>
  <tr>
    <td>J07AE51</td>
    <td>J07AE51</td>
    <td>cholera, combinations with typhoid vaccine, inactivated, whole cell</td>
  </tr>
  <tr>
    <td>J07AF</td>
    <td>J07AF</td>
    <td>Diphtheria vaccines</td>
  </tr>
  <tr>
    <td>J07AF01</td>
    <td>J07AF01</td>
    <td>diphtheria toxoid</td>
  </tr>
  <tr>
    <td>J07AG</td>
    <td>J07AG</td>
    <td>Haemophilus influenzae B vaccines</td>
  </tr>
  <tr>
    <td>J07AG01</td>
    <td>J07AG01</td>
    <td>haemophilus influenzae B, purified antigen conjugated</td>
  </tr>
  <tr>
    <td>J07AG51</td>
    <td>J07AG51</td>
    <td>haemophilus influenzae B, combinations with toxoids</td>
  </tr>
  <tr>
    <td>J07AG52</td>
    <td>J07AG52</td>
    <td>haemophilus influenzae B, combinations with pertussis and toxoids</td>
  </tr>
  <tr>
    <td>J07AG53</td>
    <td>J07AG53</td>
    <td>haemophilus influenzae B, combinations with meningococcus C, conjugated</td>
  </tr>
  <tr>
    <td>J07AG54</td>
    <td>J07AG54</td>
    <td>haemophilus influenza B, combinations with meningococcus C,Y, conjugated</td>
  </tr>
  <tr>
    <td>J07AH</td>
    <td>J07AH</td>
    <td>Meningococcal vaccines</td>
  </tr>
  <tr>
    <td>J07AH01</td>
    <td>J07AH01</td>
    <td>meningococcus A, purified polysaccharides antigen</td>
  </tr>
  <tr>
    <td>J07AH02</td>
    <td>J07AH02</td>
    <td>other meningococcal monovalent purified polysaccharides antigen</td>
  </tr>
  <tr>
    <td>J07AH03</td>
    <td>J07AH03</td>
    <td>meningococcus A,C, bivalent purified polysaccharides antigen</td>
  </tr>
  <tr>
    <td>J07AH04</td>
    <td>J07AH04</td>
    <td>meningococcus A,C,Y,W-135, tetravalent purified polysaccharides antigen</td>
  </tr>
  <tr>
    <td>J07AH05</td>
    <td>J07AH05</td>
    <td>other meningococcal polyvalent purified polysaccharides antigen</td>
  </tr>
  <tr>
    <td>J07AH06</td>
    <td>J07AH06</td>
    <td>meningococcus B, outer membrane vesicle vaccine</td>
  </tr>
  <tr>
    <td>J07AH07</td>
    <td>J07AH07</td>
    <td>meningococcus C, purified polysaccharides antigen conjugated</td>
  </tr>
  <tr>
    <td>J07AH08</td>
    <td>J07AH08</td>
    <td>meningococcus A,C,Y,W-135, tetravalent purified polysaccharides antigen conjugated</td>
  </tr>
  <tr>
    <td>J07AH09</td>
    <td>J07AH09</td>
    <td>meningococcus B, multicomponent vaccine</td>
  </tr>
  <tr>
    <td>J07AH10</td>
    <td>J07AH10</td>
    <td>meningococcus A, purified polysaccharides antigen conjugated</td>
  </tr>
  <tr>
    <td>J07AJ</td>
    <td>J07AJ</td>
    <td>Pertussis vaccines</td>
  </tr>
  <tr>
    <td>J07AJ01</td>
    <td>J07AJ01</td>
    <td>pertussis, inactivated, whole cell</td>
  </tr>
  <tr>
    <td>J07AJ02</td>
    <td>J07AJ02</td>
    <td>pertussis, purified antigen</td>
  </tr>
  <tr>
    <td>J07AJ51</td>
    <td>J07AJ51</td>
    <td>pertussis, inactivated, whole cell, combinations with toxoids</td>
  </tr>
  <tr>
    <td>J07AJ52</td>
    <td>J07AJ52</td>
    <td>pertussis, purified antigen, combinations with toxoids</td>
  </tr>
  <tr>
    <td>J07AK</td>
    <td>J07AK</td>
    <td>Plague vaccines</td>
  </tr>
  <tr>
    <td>J07AK01</td>
    <td>J07AK01</td>
    <td>plague, inactivated, whole cell</td>
  </tr>
  <tr>
    <td>J07AL</td>
    <td>J07AL</td>
    <td>Pneumococcal vaccines</td>
  </tr>
  <tr>
    <td>J07AL01</td>
    <td>J07AL01</td>
    <td>pneumococcus, purified polysaccharides antigen</td>
  </tr>
  <tr>
    <td>J07AL02</td>
    <td>J07AL02</td>
    <td>pneumococcus, purified polysaccharides antigen conjugated</td>
  </tr>
  <tr>
    <td>J07AL52</td>
    <td>J07AL52</td>
    <td>pneumococcus purified polysaccharides antigen and haemophilus influenzae, conjugated</td>
  </tr>
  <tr>
    <td>J07AM</td>
    <td>J07AM</td>
    <td>Tetanus vaccines</td>
  </tr>
  <tr>
    <td>J07AM01</td>
    <td>J07AM01</td>
    <td>tetanus toxoid</td>
  </tr>
  <tr>
    <td>J07AM51</td>
    <td>J07AM51</td>
    <td>tetanus toxoid, combinations with diphtheria toxoid</td>
  </tr>
  <tr>
    <td>J07AM52</td>
    <td>J07AM52</td>
    <td>tetanus toxoid, combinations with tetanus immunoglobulin</td>
  </tr>
  <tr>
    <td>J07AN</td>
    <td>J07AN</td>
    <td>Tuberculosis vaccines</td>
  </tr>
  <tr>
    <td>J07AN01</td>
    <td>J07AN01</td>
    <td>tuberculosis, live attenuated</td>
  </tr>
  <tr>
    <td>J07AP</td>
    <td>J07AP</td>
    <td>Typhoid vaccines</td>
  </tr>
  <tr>
    <td>J07AP01</td>
    <td>J07AP01</td>
    <td>typhoid, oral, live attenuated</td>
  </tr>
  <tr>
    <td>J07AP02</td>
    <td>J07AP02</td>
    <td>typhoid, inactivated, whole cell</td>
  </tr>
  <tr>
    <td>J07AP03</td>
    <td>J07AP03</td>
    <td>typhoid, purified polysaccharide antigen</td>
  </tr>
  <tr>
    <td>J07AP10</td>
    <td>J07AP10</td>
    <td>typhoid, combinations with paratyphi types</td>
  </tr>
  <tr>
    <td>J07AR</td>
    <td>J07AR</td>
    <td>Typhus (exanthematicus) vaccines</td>
  </tr>
  <tr>
    <td>J07AR01</td>
    <td>J07AR01</td>
    <td>typhus exanthematicus, inactivated, whole cell</td>
  </tr>
  <tr>
    <td>J07AX</td>
    <td>J07AX</td>
    <td>Other bacterial vaccines</td>
  </tr>
  <tr>
    <td>J07AX01</td>
    <td>J07AX01</td>
    <td>leptospira vaccines</td>
  </tr>
  <tr>
    <td>J07BA</td>
    <td>J07BA</td>
    <td>Encephalitis vaccines</td>
  </tr>
  <tr>
    <td>J07BA01</td>
    <td>J07BA01</td>
    <td>encephalitis, tick borne, inactivated, whole virus</td>
  </tr>
  <tr>
    <td>J07BA02</td>
    <td>J07BA02</td>
    <td>encephalitis, Japanese, inactivated, whole virus</td>
  </tr>
  <tr>
    <td>J07BA03</td>
    <td>J07BA03</td>
    <td>encephalitis, Japanese, live attenuated</td>
  </tr>
  <tr>
    <td>J07BB</td>
    <td>J07BB</td>
    <td>Influenza vaccines</td>
  </tr>
  <tr>
    <td>J07BB01</td>
    <td>J07BB01</td>
    <td>influenza, inactivated, whole virus</td>
  </tr>
  <tr>
    <td>J07BB02</td>
    <td>J07BB02</td>
    <td>influenza, inactivated, split virus or surface antigen</td>
  </tr>
  <tr>
    <td>J07BB03</td>
    <td>J07BB03</td>
    <td>influenza, live attenuated</td>
  </tr>
  <tr>
    <td>J07BB04</td>
    <td>J07BB04</td>
    <td>influenza, virus like particles</td>
  </tr>
  <tr>
    <td>J07BC</td>
    <td>J07BC</td>
    <td>Hepatitis vaccines</td>
  </tr>
  <tr>
    <td>J07BC01</td>
    <td>J07BC01</td>
    <td>hepatitis B, purified antigen</td>
  </tr>
  <tr>
    <td>J07BC02</td>
    <td>J07BC02</td>
    <td>hepatitis A, inactivated, whole virus</td>
  </tr>
  <tr>
    <td>J07BC20</td>
    <td>J07BC20</td>
    <td>combinations</td>
  </tr>
  <tr>
    <td>J07BD</td>
    <td>J07BD</td>
    <td>Measles vaccines</td>
  </tr>
  <tr>
    <td>J07BD01</td>
    <td>J07BD01</td>
    <td>measles, live attenuated</td>
  </tr>
  <tr>
    <td>J07BD51</td>
    <td>J07BD51</td>
    <td>measles, combinations with mumps, live attenuated</td>
  </tr>
  <tr>
    <td>J07BD52</td>
    <td>J07BD52</td>
    <td>measles, combinations with mumps and rubella, live attenuated</td>
  </tr>
  <tr>
    <td>J07BD53</td>
    <td>J07BD53</td>
    <td>measles, combinations with rubella, live attenuated</td>
  </tr>
  <tr>
    <td>J07BD54</td>
    <td>J07BD54</td>
    <td>measles, combinations with mumps, rubella and varicella, live attenuated</td>
  </tr>
  <tr>
    <td>J07BE</td>
    <td>J07BE</td>
    <td>Mumps vaccines</td>
  </tr>
  <tr>
    <td>J07BE01</td>
    <td>J07BE01</td>
    <td>mumps, live attenuated</td>
  </tr>
  <tr>
    <td>J07BF</td>
    <td>J07BF</td>
    <td>Poliomyelitis vaccines</td>
  </tr>
  <tr>
    <td>J07BF01</td>
    <td>J07BF01</td>
    <td>poliomyelitis oral, monovalent, live attenuated</td>
  </tr>
  <tr>
    <td>J07BF02</td>
    <td>J07BF02</td>
    <td>poliomyelitis oral, trivalent, live attenuated</td>
  </tr>
  <tr>
    <td>J07BF03</td>
    <td>J07BF03</td>
    <td>poliomyelitis, trivalent, inactivated, whole virus</td>
  </tr>
  <tr>
    <td>J07BF04</td>
    <td>J07BF04</td>
    <td>poliomyelitis oral, bivalent, live attenuated</td>
  </tr>
  <tr>
    <td>J07BG</td>
    <td>J07BG</td>
    <td>Rabies vaccines</td>
  </tr>
  <tr>
    <td>J07BG01</td>
    <td>J07BG01</td>
    <td>rabies, inactivated, whole virus</td>
  </tr>
  <tr>
    <td>J07BH</td>
    <td>J07BH</td>
    <td>Rota virus diarrhea vaccines</td>
  </tr>
  <tr>
    <td>J07BH01</td>
    <td>J07BH01</td>
    <td>rota virus, live attenuated</td>
  </tr>
  <tr>
    <td>J07BH02</td>
    <td>J07BH02</td>
    <td>rota virus, pentavalent, live, reassorted</td>
  </tr>
  <tr>
    <td>J07BJ</td>
    <td>J07BJ</td>
    <td>Rubella vaccines</td>
  </tr>
  <tr>
    <td>J07BJ01</td>
    <td>J07BJ01</td>
    <td>rubella, live attenuated</td>
  </tr>
  <tr>
    <td>J07BJ51</td>
    <td>J07BJ51</td>
    <td>rubella, combinations with mumps, live attenuated</td>
  </tr>
  <tr>
    <td>J07BK</td>
    <td>J07BK</td>
    <td>Varicella zoster vaccines</td>
  </tr>
  <tr>
    <td>J07BK01</td>
    <td>J07BK01</td>
    <td>varicella, live attenuated</td>
  </tr>
  <tr>
    <td>J07BK02</td>
    <td>J07BK02</td>
    <td>zoster, live attenuated</td>
  </tr>
  <tr>
    <td>J07BK03</td>
    <td>J07BK03</td>
    <td>zoster, purified antigen</td>
  </tr>
  <tr>
    <td>J07BL</td>
    <td>J07BL</td>
    <td>Yellow fever vaccines</td>
  </tr>
  <tr>
    <td>J07BL01</td>
    <td>J07BL01</td>
    <td>yellow fever, live attenuated</td>
  </tr>
  <tr>
    <td>J07BM</td>
    <td>J07BM</td>
    <td>Papillomavirus vaccines</td>
  </tr>
  <tr>
    <td>J07BM01</td>
    <td>J07BM01</td>
    <td>papillomavirus (human types 6, 11, 16, 18)</td>
  </tr>
  <tr>
    <td>J07BM02</td>
    <td>J07BM02</td>
    <td>papillomavirus (human types 16, 18)</td>
  </tr>
  <tr>
    <td>J07BM03</td>
    <td>J07BM03</td>
    <td>papillomavirus (human types 6, 11, 16, 18, 31, 33, 45, 52, 58)</td>
  </tr>
  <tr>
    <td>J07BN01</td>
    <td>J07BN01</td>
    <td>covid-19, RNA-based vaccine</td>
  </tr>
  <tr>
    <td>J07BN02</td>
    <td>J07BN02</td>
    <td>covid-19, viral vector, non-replicating</td>
  </tr>
  <tr>
    <td>J07BN03</td>
    <td>J07BN03</td>
    <td>covid-19, inactivated virus</td>
  </tr>
  <tr>
    <td>J07BN04</td>
    <td>J07BN04</td>
    <td>covid-19, protein subunit</td>
  </tr>
  <tr>
    <td>J07BX</td>
    <td>J07BX</td>
    <td>Other viral vaccines</td>
  </tr>
  <tr>
    <td>J07BX01</td>
    <td>J07BX01</td>
    <td>smallpox vaccines</td>
  </tr>
  <tr>
    <td>J07BX02</td>
    <td>J07BX02</td>
    <td>ebola vaccines</td>
  </tr>
  <tr>
    <td>J07BX04</td>
    <td>J07BX04</td>
    <td>dengue virus vaccines</td>
  </tr>
  <tr>
    <td>J07CA</td>
    <td>J07CA</td>
    <td>Bacterial and viral vaccines, combined</td>
  </tr>
  <tr>
    <td>J07CA01</td>
    <td>J07CA01</td>
    <td>diphtheria-poliomyelitis-tetanus</td>
  </tr>
  <tr>
    <td>J07CA02</td>
    <td>J07CA02</td>
    <td>diphtheria-pertussis-poliomyelitis-tetanus</td>
  </tr>
  <tr>
    <td>J07CA03</td>
    <td>J07CA03</td>
    <td>diphtheria-rubella-tetanus</td>
  </tr>
  <tr>
    <td>J07CA04</td>
    <td>J07CA04</td>
    <td>haemophilus influenzae B and poliomyelitis</td>
  </tr>
  <tr>
    <td>J07CA05</td>
    <td>J07CA05</td>
    <td>diphtheria-hepatitis B-pertussis-tetanus</td>
  </tr>
  <tr>
    <td>J07CA06</td>
    <td>J07CA06</td>
    <td>diphtheria-haemophilus influenzae B-pertussis-poliomyelitis-tetanus</td>
  </tr>
  <tr>
    <td>J07CA07</td>
    <td>J07CA07</td>
    <td>diphtheria-hepatitis B-tetanus</td>
  </tr>
  <tr>
    <td>J07CA08</td>
    <td>J07CA08</td>
    <td>haemophilus influenzae B and hepatitis B</td>
  </tr>
  <tr>
    <td>J07CA09</td>
    <td>J07CA09</td>
    <td>diphtheria-haemophilus influenzae B-pertussis-poliomyelitis-tetanus-hepatitis B</td>
  </tr>
  <tr>
    <td>J07CA10</td>
    <td>J07CA10</td>
    <td>typhoid-hepatitis A</td>
  </tr>
  <tr>
    <td>J07CA11</td>
    <td>J07CA11</td>
    <td>diphtheria-haemophilus influenzae B-pertussis-tetanus-hepatitis B</td>
  </tr>
  <tr>
    <td>J07CA12</td>
    <td>J07CA12</td>
    <td>diphtheria-pertussis-poliomyelitis-tetanus-hepatitis B</td>
  </tr>
  <tr>
    <td>J07CA13</td>
    <td>J07CA13</td>
    <td>diphtheria-haemophilus influenzae B-pertussis-tetanus-hepatitis B-meningococcus A + C</td>
  </tr>
  <tr>
    <td>J07XA</td>
    <td>J07XA</td>
    <td>Parasitic vaccines</td>
  </tr>
  <tr>
    <td>J07XA01</td>
    <td>J07XA01</td>
    <td>malaria vaccines</td>
  </tr>
  <tr>
    <td>_1001000221103</td>
    <td>1001000221103</td>
    <td>Inactivated whole Vibrio cholerae antigen only vaccine product in oral dose form</td>
  </tr>
  <tr>
    <td>_1011000221100</td>
    <td>1011000221100</td>
    <td>Live attenuated Vibrio cholerae antigen only vaccine product in oral dose form</td>
  </tr>
  <tr>
    <td>_1031000221108</td>
    <td>1031000221108</td>
    <td>Human poliovirus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_1051000221104</td>
    <td>1051000221104</td>
    <td>Live attenuated Human poliovirus serotypes 1 and 3 antigens only vaccine product in oral dose form</td>
  </tr>
  <tr>
    <td>_1052328007</td>
    <td>1052328007</td>
    <td>Streptococcus pneumoniae Danish serotype 4, 6B, 9V, 14, 18C, 19F, and 23F capsular polysaccharide antigens conjugated only vaccine product</td>
  </tr>
  <tr>
    <td>_1081000221109</td>
    <td>1081000221109</td>
    <td>Live attenuated Rotavirus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_1101000221104</td>
    <td>1101000221104</td>
    <td>Clostridium tetani toxoid antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_1119254000</td>
    <td>1119254000</td>
    <td>Streptococcus pneumoniae Danish serotype 1, 3, 4, 5, 6A, 6B, 7F, 9V, 14, 18C, 19A, 19F, and 23F capsular polysaccharide antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_1119305005</td>
    <td>1119305005</td>
    <td>SARS-CoV-2 antigen vaccine</td>
  </tr>
  <tr>
    <td>_1119349007</td>
    <td>1119349007</td>
    <td>SARS-CoV-2 mRNA vaccine</td>
  </tr>
  <tr>
    <td>_1121000221106</td>
    <td>1121000221106</td>
    <td>Live attenuated Yellow fever virus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_1131000221109</td>
    <td>1131000221109</td>
    <td>Vaccine product containing only inactivated whole Rabies lyssavirus antigen</td>
  </tr>
  <tr>
    <td>_1157024006</td>
    <td>1157024006</td>
    <td>Inactivated whole SARS-CoV-2 antigen vaccine</td>
  </tr>
  <tr>
    <td>_1162643001</td>
    <td>1162643001</td>
    <td>SARS-CoV-2 recombinant spike protein antigen vaccine</td>
  </tr>
  <tr>
    <td>_1181000221105</td>
    <td>1181000221105</td>
    <td>Influenza virus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_1801000221105</td>
    <td>1801000221105</td>
    <td>Streptococcus pneumoniae capsular polysaccharide antigen conjugated only vaccine product</td>
  </tr>
  <tr>
    <td>_1861000221106</td>
    <td>1861000221106</td>
    <td>Bacillus Calmette-Guerin antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_1981000221108</td>
    <td>1981000221108</td>
    <td>Neisseria meningitidis serogroup B antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_2171000221104</td>
    <td>2171000221104</td>
    <td>Salmonella enterica subspecies enterica serovar Typhi capsular polysaccharide unconjugated antigen only vaccine product in parenteral dose form</td>
  </tr>
  <tr>
    <td>_2221000221107</td>
    <td>2221000221107</td>
    <td>Live attenuated Human alphaherpesvirus 3 only vaccine product</td>
  </tr>
  <tr>
    <td>_28531000087107</td>
    <td>28531000087107</td>
    <td>COVID-19 vaccine</td>
  </tr>
  <tr>
    <td>_29061000087103</td>
    <td>29061000087103</td>
    <td>COVID-19 non-replicating viral vector vaccine</td>
  </tr>
  <tr>
    <td>_37146000</td>
    <td>37146000</td>
    <td>Typhus vaccine</td>
  </tr>
  <tr>
    <td>_409568008</td>
    <td>409568008</td>
    <td>Pentavalent botulinum toxoid vaccine</td>
  </tr>
  <tr>
    <td>_428601009</td>
    <td>428601009</td>
    <td>Paratyphoid vaccine</td>
  </tr>
  <tr>
    <td>_601000221108</td>
    <td>601000221108</td>
    <td>Bordetella pertussis antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_774618008</td>
    <td>774618008</td>
    <td>Whole cell Bordetella pertussis and Clostridium tetani toxoid adsorbed and Corynebacterium diphtheriae toxoid antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_775641005</td>
    <td>775641005</td>
    <td>Clostridium tetani toxoid adsorbed and Corynebacterium diphtheriae toxoid antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_777725002</td>
    <td>777725002</td>
    <td>Clostridium tetani toxoid antigen adsorbed only vaccine product</td>
  </tr>
  <tr>
    <td>_836368004</td>
    <td>836368004</td>
    <td>Bacteria antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836369007</td>
    <td>836369007</td>
    <td>Virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836374004</td>
    <td>836374004</td>
    <td>Hepatitis B virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836375003</td>
    <td>836375003</td>
    <td>Hepatitis A virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836377006</td>
    <td>836377006</td>
    <td>Influenza virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836378001</td>
    <td>836378001</td>
    <td>Japanese encephalitis virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836379009</td>
    <td>836379009</td>
    <td>Human papillomavirus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836380007</td>
    <td>836380007</td>
    <td>Haemophilus influenzae type B antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836381006</td>
    <td>836381006</td>
    <td>Corynebacterium diphtheriae antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836382004</td>
    <td>836382004</td>
    <td>Measles morbillivirus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836383009</td>
    <td>836383009</td>
    <td>Vibrio cholerae antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836384003</td>
    <td>836384003</td>
    <td>Bacillus anthracis antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836385002</td>
    <td>836385002</td>
    <td>Yellow fever virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836387005</td>
    <td>836387005</td>
    <td>Rotavirus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836388000</td>
    <td>836388000</td>
    <td>Rubella virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836389008</td>
    <td>836389008</td>
    <td>Vaccinia virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836390004</td>
    <td>836390004</td>
    <td>Salmonella enterica subspecies enterica serovar Typhi antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836393002</td>
    <td>836393002</td>
    <td>Rabies lyssavirus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836397001</td>
    <td>836397001</td>
    <td>Coxiella burnetii antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836398006</td>
    <td>836398006</td>
    <td>Streptococcus pneumoniae antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836401009</td>
    <td>836401009</td>
    <td>Neisseria meningitidis antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836402002</td>
    <td>836402002</td>
    <td>Bacillus Calmette-Guerin antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836403007</td>
    <td>836403007</td>
    <td>Tick-borne encephalitis virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836495005</td>
    <td>836495005</td>
    <td>Human alphaherpesvirus 3 antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836498007</td>
    <td>836498007</td>
    <td>Mumps orthorubulavirus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_836500008</td>
    <td>836500008</td>
    <td>Haemophilus influenzae type B and Neisseria meningitidis serogroup C antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_840549009</td>
    <td>840549009</td>
    <td>Yersinia pestis antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_840563003</td>
    <td>840563003</td>
    <td>Dengue virus antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_840599008</td>
    <td>840599008</td>
    <td>Borrelia burgdorferi antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_863911006</td>
    <td>863911006</td>
    <td>Clostridium tetani antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_871726005</td>
    <td>871726005</td>
    <td>Rabies lyssavirus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871737006</td>
    <td>871737006</td>
    <td>Mumps orthorubulavirus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871738001</td>
    <td>871738001</td>
    <td>Live attenuated Mumps orthorubulavirus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871739009</td>
    <td>871739009</td>
    <td>Human poliovirus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871740006</td>
    <td>871740006</td>
    <td>Inactivated whole Human poliovirus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871742003</td>
    <td>871742003</td>
    <td>Clostridium tetani antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871751006</td>
    <td>871751006</td>
    <td>Hepatitis A virus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871759008</td>
    <td>871759008</td>
    <td>Acellular Bordetella pertussis only vaccine product</td>
  </tr>
  <tr>
    <td>_871764007</td>
    <td>871764007</td>
    <td>Haemophilus influenzae type b antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871765008</td>
    <td>871765008</td>
    <td>Measles morbillivirus antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871768005</td>
    <td>871768005</td>
    <td>Influenza virus antigen only vaccine product in nasal dose form</td>
  </tr>
  <tr>
    <td>_871772009</td>
    <td>871772009</td>
    <td>Influenza A virus subtype H1N1 antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_871803007</td>
    <td>871803007</td>
    <td>Hepatitis A and Hepatitis B virus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871804001</td>
    <td>871804001</td>
    <td>Hepatitis A virus and Salmonella enterica subspecies enterica serovar Typhi antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871806004</td>
    <td>871806004</td>
    <td>Haemophilus influenzae type B and Hepatitis B virus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871826000</td>
    <td>871826000</td>
    <td>Clostridium tetani and Corynebacterium diphtheriae antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871831003</td>
    <td>871831003</td>
    <td>Measles morbillivirus and Mumps orthorubulavirus and Rubella virus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871837004</td>
    <td>871837004</td>
    <td>Clostridium tetani and Corynebacterium diphtheriae and Human poliovirus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871839001</td>
    <td>871839001</td>
    <td>Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Haemophilus influenzae type B antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871866001</td>
    <td>871866001</td>
    <td>Neisseria meningitidis serogroup C only vaccine product</td>
  </tr>
  <tr>
    <td>_871871008</td>
    <td>871871008</td>
    <td>Neisseria meningitidis serogroup A and C only vaccine product</td>
  </tr>
  <tr>
    <td>_871873006</td>
    <td>871873006</td>
    <td>Neisseria meningitidis serogroup A, C, W135 and Y only vaccine product</td>
  </tr>
  <tr>
    <td>_871875004</td>
    <td>871875004</td>
    <td>Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871876003</td>
    <td>871876003</td>
    <td>Acellular Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871878002</td>
    <td>871878002</td>
    <td>Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Human poliovirus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871887006</td>
    <td>871887006</td>
    <td>Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Haemophilus influenzae type B and Human poliovirus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871889009</td>
    <td>871889009</td>
    <td>Acellular Bordetella pertussis and Corynebacterium diphtheriae and Hepatitis B virus and inactivated whole Human poliovirus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871895005</td>
    <td>871895005</td>
    <td>Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Haemophilus influenzae type B and Hepatitis B virus and Human poliovirus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871908002</td>
    <td>871908002</td>
    <td>Human alphaherpesvirus 3 and Measles morbillivirus and Mumps orthorubulavirus and Rubella virus antigens only vaccine product</td>
  </tr>
  <tr>
    <td>_871918007</td>
    <td>871918007</td>
    <td>Rickettsia antigen-containing vaccine product</td>
  </tr>
  <tr>
    <td>_871921009</td>
    <td>871921009</td>
    <td>Staphylococcus toxoid vaccine</td>
  </tr>
  <tr>
    <td>_921000221108</td>
    <td>921000221108</td>
    <td>Neisseria meningitidis antigen only vaccine product</td>
  </tr>
  <tr>
    <td>_971000221109</td>
    <td>971000221109</td>
    <td>Live attenuated Salmonella enterica subspecies enterica serovar Typhi antigen only vaccine product in oral dose form</td>
  </tr>
  <tr>
    <td>_981000221107</td>
    <td>981000221107</td>
    <td>Streptococcus pneumoniae antigen only vaccine product</td>
  </tr>
  <tr>
    <td>P99</td>
    <td>P99</td>
    <td>Oscuramento del documento</td>
  </tr>
  <tr>
    <td>P97</td>
    <td>P97</td>
    <td>Oscuramento al genitore</td>
  </tr>
  <tr>
    <td>P98</td>
    <td>P98</td>
    <td>Oscuramento all’assistito</td>
  </tr>
  <tr>
    <td>J07BN</td>
    <td>J07BN</td>
    <td>Vaccino per Covid-19</td>
  </tr>
  <tr>
    <td>LP418019_8</td>
    <td>LP418019-8</td>
    <td>Tampone antigenico per Covid-19</td>
  </tr>
  <tr>
    <td>LP417541_2</td>
    <td>LP417541-2</td>
    <td>Tampone molecolare per Covid-19</td>
  </tr>
  <tr>
    <td>_96118_5</td>
    <td>96118-5</td>
    <td>Test Sierologico qualitativo</td>
  </tr>
  <tr>
    <td>_94503_0</td>
    <td>94503-0</td>
    <td>Test Sierologico quantitativo</td>
  </tr>
  <tr>
    <td>pay</td>
    <td>pay</td>
    <td>Prescrizione farmaceutica non a carico SSN</td>
  </tr>
  <tr>
    <td>PUBLICPOL</td>
    <td>PUBLICPOL</td>
    <td>Prescrizione farmaceutica SSN</td>
  </tr>
  <tr>
    <td>LP267463_0</td>
    <td>LP267463-0</td>
    <td>Reddito</td>
  </tr>
  <tr>
    <td>LP199190_2</td>
    <td>LP199190-2</td>
    <td>Patologia</td>
  </tr>
  <tr>
    <td>_90768_3</td>
    <td>90768-3</td>
    <td>Analisi sangue donatore</td>
  </tr>
</table>


_Tabella 45: _Value set per il metadato XDSDocumentEntry.eventCodeList


### 13.3.5. Ruolo

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


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
   <td>DSA
   </td>
   <td>Direttore sanitario
   </td>
   <td>Direttore sanitario
   </td>
  </tr>
   <tr>
   <td>DAM
   </td>
   <td>Direttore amministrativo
   </td>
   <td>Direttore amministrativo
   </td>
  </tr>
  <tr>
  <tr>
   <td>OAM
   </td>
   <td>Operatore amministrativo
   </td>
   <td>Operatore Amministrativo
   </td>
  </tr>
  <tr>
   <td>ASS
   </td>
   <td>Assistito
   </td>
   <td>Assistito
   </td>
  </tr>
  <tr>
   <td>TUT
   </td>
   <td>Tutore
   </td>
   <td>Tutore
   </td>
  </tr>
  <tr>
   <td>ING
   </td>
   <td>Informal giver (Assistito)
   </td>
   <td>Informal giver (Assistito)
   </td>
  </tr>
  <tr>
   <td>GEN
   </td>
   <td>Genitore Assistito
   </td>
   <td>Genitore Assistito
   </td>
  </tr>
  <tr>
   <td>NOR
   </td>
   <td>Nodo regionale
   </td>
   <td>Nodo regionale
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
   <td>OGC
   </td>
   <td>Operatore per la gestione dei consensi
   </td>
   <td>Operatore per la gestione dei consensi
   </td>
  </tr>
   <tr>
   <td>OPI
   </td>
   <td>Operatore di informativa
   </td>
   <td>Operatore di informativa
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


_Tabella 46: _Value set per l’attributo urn:oasis:names:tc:xacml:2.0:subject:role




### 13.3.6. Contesto Operativo

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


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
   <td>Il valore deve essere utilizzato per il servizio di validazione e per i servizi di Validazione e Creazione.
   </td>
  </tr>
  <tr>
   <td>UPDATE
   </td>
   <td>Invalidamento e aggiornamento di un documento
   </td>
   <td>Il valore deve essere utilizzato per il servizio di Eliminazione Documento, Aggiornamento Metadati e Sostituzione documento.
   </td>
  </tr>
</table>


_Tabella 47: _Value set per l’attributo urn:oasis:names:tc:xspa:1.0:subject:purposeofuse


### 13.3.7. Organizzazione

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


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
   <td>INI
   </td>
  </tr>
   <tr>
   <td><p style="text-align: right">
970</p>

   </td>
   <td>Sistema TS
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


_Tabella 48: _Value set per l’attributo urn:oasis:names:tc:xspa:1.0:subject:organization-id




### 13.3.8. Practice Setting Code

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


<table>
  <tr>
   <td><strong>Code</strong>
   </td>
   <td><strong>CodingScheme</strong>
   </td>
  </tr>
   <tr>
      <td>AD_PSC001</td>
      <td>Allergologia</td>
    </tr>
    <tr>
      <td>AD_PSC002</td>
      <td>Day Hospital</td>
    </tr>
    <tr>
      <td>AD_PSC003</td>
      <td>Anatomia e Istologia Patologica</td>
    </tr>
    <tr>
      <td>AD_PSC005</td>
      <td>Angiologia</td>
    </tr>
    <tr>
      <td>AD_PSC006</td>
      <td>Cardiochirurgia Pediatrica</td>
    </tr>
    <tr>
      <td>AD_PSC007</td>
      <td>Cardiochirurgia</td>
    </tr>
    <tr>
      <td>AD_PSC008</td>
      <td>Cardiologia</td>
    </tr>
    <tr>
      <td>AD_PSC009</td>
      <td>Chirurgia Generale</td>
    </tr>
    <tr>
      <td>AD_PSC010</td>
      <td>Chirurgia Maxillo-Facciale</td>
    </tr>
    <tr>
      <td>AD_PSC011</td>
      <td>Chirurgia Pediatrica</td>
    </tr>
    <tr>
      <td>AD_PSC012</td>
      <td>Chirurgia Plastica</td>
    </tr>
    <tr>
      <td>AD_PSC013</td>
      <td>Chirurgia Toracica</td>
    </tr>
    <tr>
      <td>AD_PSC014</td>
      <td>Chirurgia Vascolare</td>
    </tr>
    <tr>
      <td>AD_PSC015</td>
      <td>Medicina Sportiva</td>
    </tr>
    <tr>
      <td>AD_PSC018</td>
      <td>Ematologia e Immunoematologia</td>
    </tr>
    <tr>
      <td>AD_PSC019</td>
      <td>Malattie Endocrine, del Ricambio e della Nutrizione</td>
    </tr>
    <tr>
      <td>AD_PSC020</td>
      <td>Immunologia</td>
    </tr>
    <tr>
      <td>AD_PSC021</td>
      <td>Geriatria</td>
    </tr>
    <tr>
      <td>AD_PSC024</td>
      <td>Malattie Infettive e Tropicali</td>
    </tr>
    <tr>
      <td>AD_PSC025</td>
      <td>Medicina del Lavoro</td>
    </tr>
    <tr>
      <td>AD_PSC026</td>
      <td>Medicina Generale</td>
    </tr>
    <tr>
      <td>AD_PSC027</td>
      <td>Medicina Legale</td>
    </tr>
    <tr>
    <td>AD_PSC028</td>
    <td>Unita Spinale</td>
  </tr>
  <tr>
    <td>AD_PSC029</td>
    <td>Nefrologia</td>
  </tr>
  <tr>
    <td>AD_PSC030</td>
    <td>Neurochirurgia</td>
  </tr>
  <tr>
    <td>AD_PSC031</td>
    <td>Nido</td>
  </tr>
  <tr>
    <td>AD_PSC032</td>
    <td>Neurologia</td>
  </tr>
  <tr>
    <td>AD_PSC033</td>
    <td>Neuropsichiatria Infantile</td>
  </tr>
  <tr>
    <td>AD_PSC034</td>
    <td>Oculistica</td>
  </tr>
  <tr>
    <td>AD_PSC035</td>
    <td>Odontoiatria e Stomatologia</td>
  </tr>
  <tr>
    <td>AD_PSC036</td>
    <td>Ortopedia e Traumatologia</td>
  </tr>
  <tr>
    <td>AD_PSC037</td>
    <td>Ostetricia e Ginecologia</td>
  </tr>
  <tr>
    <td>AD_PSC038</td>
    <td>Otorinolaringoiatria</td>
  </tr>
  <tr>
    <td>AD_PSC039</td>
    <td>Pediatria</td>
  </tr>
  <tr>
    <td>AD_PSC040</td>
    <td>Psichiatria</td>
  </tr>
  <tr>
    <td>AD_PSC042</td>
    <td>Tossicologia</td>
  </tr>
  <tr>
    <td>AD_PSC043</td>
    <td>Urologia</td>
  </tr>
  <tr>
    <td>AD_PSC046</td>
    <td>Grandi Ustioni Pediatriche</td>
  </tr>
  <tr>
    <td>AD_PSC047</td>
    <td>Grandi Ustionati</td>
  </tr>
  <tr>
    <td>AD_PSC048</td>
    <td>Nefrologia (Abilitazione Trapianto Rene)</td>
  </tr>
  <tr>
    <td>AD_PSC049</td>
    <td>Terapia Intensiva</td>
  </tr>
  <tr>
    <td>AD_PSC050</td>
    <td>Unità Coronarica</td>
  </tr>
  <tr>
    <td>AD_PSC051</td>
    <td>Astanteria</td>
  </tr>
  <tr>
    <td>AD_PSC052</td>
    <td>Dermatologia</td>
  </tr>
  <tr>
    <td>AD_PSC054</td>
    <td>Emodialisi</td>
  </tr>
  <tr>
      <td>AD_PSC055</td>
      <td>Farmacologia Clinica</td>
    </tr>
    <tr>
      <td>AD_PSC056</td>
      <td>Recupero e Riabilitazione Funzionale</td>
    </tr>
    <tr>
      <td>AD_PSC057</td>
      <td>Fisiopatologia della Riabilitazione Umana</td>
    </tr>
    <tr>
      <td>AD_PSC058</td>
      <td>Gastroenterologia</td>
    </tr>
    <tr>
      <td>AD_PSC060</td>
      <td>Lungodegenti</td>
    </tr>
    <tr>
      <td>AD_PSC061</td>
      <td>Medicina Nucleare</td>
    </tr>
    <tr>
      <td>AD_PSC062</td>
      <td>Neonatologia</td>
    </tr>
    <tr>
      <td>AD_PSC064</td>
      <td>Oncologia</td>
    </tr>
    <tr>
      <td>AD_PSC065</td>
      <td>Oncoematologia Pediatrica</td>
    </tr>
    <tr>
      <td>AD_PSC066</td>
      <td>Oncoematologia</td>
    </tr>
    <tr>
      <td>AD_PSC068</td>
      <td>Pneumologia, Fisiopatologia Respiratoria, Tisiologia</td>
    </tr>
    <tr>
      <td>AD_PSC069</td>
      <td>Radiologia</td>
    </tr>
    <tr>
      <td>AD_PSC070</td>
      <td>Radioterapia</td>
    </tr>
    <tr>
      <td>AD_PSC071</td>
      <td>Reumatologia</td>
    </tr>
    <tr>
      <td>AD_PSC073</td>
      <td>Terapia Intensiva Neonatale</td>
    </tr>
    <tr>
      <td>AD_PSC074</td>
      <td>Radioterapia Oncologica</td>
    </tr>
    <tr>
      <td>AD_PSC075</td>
      <td>Neuro-Riabilitazione</td>
    </tr>
    <tr>
      <td>AD_PSC076</td>
      <td>Neurochirurgia Pediatrica</td>
    </tr>
    <tr>
      <td>AD_PSC077</td>
      <td>Nefrologia Pediatrica</td>
    </tr>
    <tr>
      <td>AD_PSC078</td>
      <td>Urologia Pediatrica</td>
    </tr>
    <tr>
      <td>AD_PSC082</td>
      <td>Anestesia e Rianimazione</td>
    </tr>
    <tr>
      <td>AD_PSC097</td>
      <td>Detenuti</td>
    </tr>
     <tr>
    <td>AD_PSC098</td>
    <td>Day Surgery Plurispecialistica</td>
  </tr>
  <tr>
    <td>AD_PSC100</td>
    <td>Laboratorio Analisi Chimico Cliniche</td>
  </tr>
  <tr>
    <td>AD_PSC101</td>
    <td>Microbiologia e Virologia</td>
  </tr>
  <tr>
    <td>AD_PSC102</td>
    <td>Centro Trasfusionale e Immunoematologico</td>
  </tr>
  <tr>
    <td>AD_PSC103</td>
    <td>Radiodiagnostica</td>
  </tr>
  <tr>
    <td>AD_PSC104</td>
    <td>Neuroradiologia</td>
  </tr>
  <tr>
    <td>AD_PSC106</td>
    <td>Pronto Soccorso e OBI</td>
  </tr>
  <tr>
    <td>AD_PSC107</td>
    <td>Poliambulatorio</td>
  </tr>
  <tr>
    <td>AD_PSC109</td>
    <td>Centrale Operativa 118</td>
  </tr>
  <tr>
    <td>AD_PSC121</td>
    <td>Comparti Operatori - Degenza Ordinaria</td>
  </tr>
  <tr>
    <td>AD_PSC122</td>
    <td>Comparti Operatori - Day Surgery</td>
  </tr>
  <tr>
    <td>AD_PSC126</td>
    <td>Libera Professione Degenza</td>
  </tr>
  <tr>
    <td>AD_PSC127</td>
    <td>Hospice Ospedaliero</td>
  </tr>
  <tr>
    <td>AD_PSC129</td>
    <td>Trapianto Organi e Tessuti</td>
  </tr>
  <tr>
    <td>AD_PSC130</td>
    <td>Medicina di Base</td>
  </tr>
  <tr>
    <td>AD_PSC131</td>
    <td>Assistenza Territoriale</td>
  </tr>
  <tr>
    <td>AD_PSC199</td>
    <td>Raccolta Consenso</td>
  </tr>
  <tr>
    <td>AD_PSC999</td>
    <td>Altro</td>
  </tr>
</table>


_Tabella 49: _Value set per il metadato XDSDocumentEntry.practiceSettingCode


### 13.3.9. Activity Enum


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


_Tabella 50: ActivityEnum_


### 13.3.10. Injection Mode Enum


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


_Tabella 51: InjectionModeEnum_


### 13.3.11. Health Data Format Enum


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
</table>


_Tabella 52: HealthDataFormatEnum_


### 13.3.12. Tipo Attività

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”

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
   <td>Il valore deve essere utilizzato per il servizio di validazione e per il servizio di Pubblicazione Creazione Documento
   </td>
  </tr>
  <tr>
   <td>DELETE
   </td>
   <td>Il valore deve essere utilizzato per il servizio di Eliminazione Documento
   </td>
  </tr>
  <tr>
   <td>UPDATE
   </td>
   <td>Il valore deve essere utilizzato per il servizio di Aggiornamento Metadati
   </td>
  </tr>
</table>


_Tabella 53: action-id_


### 13.3.13. Administrative Request

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”

<table>
  <tr>
   <td><strong>Codice</strong>
   </td>
   <td><strong>DisplayName</strong>
   </td>
   <td><strong>Descrizione utilizzo</strong>
   </td>
  </tr>
  
<tr>  
<td>SSN</td>
<td>Regime SSN</td>
<td>Documento prodotto in regime SSN (in seguito a impegnativa SSN o screening)</td>
</tr>
<tr>
<td>INPATIENT</td>
<td>Regime di ricovero</td>
<td>Documenti prodotti in: regime di ricovero ad eccezione di ricoveri in libera professione completamente a carico del cittadino, pronto soccorso ad eccezione dei pazienti che non hanno copertura SSN.</td>
</tr>
<tr>
<td>NOSSN</td>
<td>Regime privato</td>
<td>Documento prodotto in regime privato per cui il cittadino paga tutte le spese sanitarie (es. ricoveri in libera professione, prestazioni intramoenia, etc.</td>
</tr>
<tr>
<td>SSR</td>
<td>Regime SSR</td>
<td>Documento prodotto in regime SSR (all’interno di progettualità regionali)</td>
</tr>
<tr>
<td>DONOR</td>
<td>Regime donatori</td>
<td>Documento prodotto in regime per i donatori</td>
</tr>
</table>

_Tabella 53: Value set per il metadato XDSDocumentEntry.Slot - Administrative Request_


<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità
