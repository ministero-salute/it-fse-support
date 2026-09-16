**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST Gateway**


<table>
  <tr>
   <td>Versione
   </td>
   <td>:
   </td>
   <td>ver 2.24
   </td>
  </tr>
</table>



**INDICE**

- [1. Introduzione](#1-introduzione)
  - [1.1. Riferimenti](#11-riferimenti)
  - [1.2. Acronimi e Definizioni](#12-acronimi-e-definizioni)
  - [Registro Modifiche](#registro-modifiche)
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
- [4. Servizio di Validazione FHIR](#4-servizio-di-validazione-fhir)
  - [4.1. Request](#41-request)
    - [4.1.1. Messaggio di richiesta, esempio “Verifica con PDF”](#411-messaggio-di-richiesta-esempio-verifica-con-pdf)
    - [4.1.2. Messaggio di richiesta, esempio “Verifica con Bundle JSON”](#412-messaggio-di-richiesta-esempio-verifica-con-bundle-json)
  - [4.2. Response](#42-response)
    - [4.2.1. Messaggio di risposta, esempio “Verifica con PDF” con esito Success 200](#421-messaggio-di-risposta-esempio-verifica-con-pdf-con-esito-success-200)
    - [4.2.2. Messaggio di risposta, esempio “Validation con Attachment” con esito KO 400](#422-messaggio-di-risposta-esempio-validation-con-attachment-con-esito-ko-400)
    - [4.2.3. Messaggio di risposta, esempio “Verifica con Bundle” con esito Success 200 con warning](#423-messaggio-di-risposta-esempio-verifica-con-bundle-con-esito-success-200-con-warning)
- [5. Servizio di Creazione](#5-servizio-di-creazione)
  - [5.1. Request](#51-request)
    - [5.1.1. Messaggio di Richiesta, esempio “Pubblicazione con Attachment”](#511-messaggio-di-richiesta-esempio-pubblicazione-con-attachment)
    - [5.1.2. Messaggio di Richiesta, esempio “Pubblicazione con Resource”](#512-messaggio-di-richiesta-esempio-pubblicazione-con-resource)
  - [5.2. Response](#52-response)
    - [5.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Pubblicazione con Attachment”](#521-esempio-di-messaggio-di-risposta-con-esito-ok-200---pubblicazione-con-attachment)
    - [5.2.2. Messaggio di Risposta, esempio “Pubblicazione con Resource” con esito KO 400](#522-messaggio-di-risposta-esempio-pubblicazione-con-resource-con-esito-ko-400)
- [6. Servizio di Eliminazione Documento](#6-servizio-di-eliminazione-documento)
  - [6.1. Request](#61-request)
    - [6.1.1. Messaggio di Richiesta, esempio “Eliminazione Documento”](#611-messaggio-di-richiesta-esempio-eliminazione-documento)
  - [6.2. Response](#62-response)
    - [6.2.1. Esempio di Messaggio di Risposta con esito OK 200 - Delete eseguita con successo](#621-esempio-di-messaggio-di-risposta-con-esito-ok-200---delete-eseguita-con-successo)
    - [6.2.2. Esempio di Messaggio di Risposta con esito KO 400](#622-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [7. Servizio di Sostituzione Documento](#7-servizio-di-sostituzione-documento)
  - [7.1. Request](#71-request)
    - [7.1.1. Messaggio di Richiesta, esempio “Pubblicazione Sostituzione Documento con Attachment”](#711-messaggio-di-richiesta-esempio-pubblicazione-sostituzione-documento-con-attachment)
  - [7.2. Response](#72-response)
    - [7.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”](#721-esempio-di-messaggio-di-risposta-con-esito-ok-200-pubblicazione-sostituzione-documento-con-attachment)
    - [7.2.2. Esempio di Messaggio di Risposta con esito KO 400](#722-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [8. Servizio di Aggiornamento Metadati](#8-servizio-di-aggiornamento-metadati)
  - [8.1. Request](#81-request)
    - [8.1.1. Esempio Messaggio di Richiesta](#811-esempio-messaggio-di-richiesta)
  - [8.2. Response](#82-response)
    - [8.2.1. Esempio di Messaggio di risposta con Esito Success 200](#821-esempio-di-messaggio-di-risposta-con-esito-success-200)
    - [8.2.2. Esempio di Messaggio di Risposta con esito KO 400](#822-esempio-di-messaggio-di-risposta-con-esito-ko-400)
    - [8.2.3. Esempio Messaggio di Richiesta attraverso iti-57](#823-esempio-messaggio-di-richiesta-attraverso-iti-57)
- [9. Servizio di Aggiornamento Metadati per oscuramento a catena](#9-servizio-di-aggiornamento-metadati-per-oscuramento-a-catena)
  - [9.1. Request](#91-request)
    - [9.1.1. Esempio Messaggio di Richiesta](#911-esempio-messaggio-di-richiesta)
  - [9.2. Response](#92-response)
    - [9.2.1. Esempio di Messaggio di risposta con Esito Success 200](#921-esempio-di-messaggio-di-risposta-con-esito-success-200)
    - [9.2.2. Esempio di Messaggio di Risposta con esito KO 400](#922-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [10. Servizio di validazione e pubblicazione creazione contestuale](#10-servizio-di-validazione-e-pubblicazione-creazione-contestuale)
  - [10.1. Request](#101-request)
    - [10.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Attachment”](#1011-messaggio-di-richiesta-esempio-validazione-pubblicazione-creazione-con-attachment)
    - [10.1.2. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Resource”](#1012-messaggio-di-richiesta-esempio-validazione-pubblicazione-creazione-con-resource)
  - [10.2. Response](#102-response)
    - [10.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Validazione Pubblicazione creazione contestuale con Attachment”](#1021-esempio-di-messaggio-di-risposta-con-esito-ok-200---validazione-pubblicazione-creazione-contestuale-con-attachment)
    - [10.2.2. Esempio di Messaggio di Risposta con esito OK 400 - “Validazione Pubblicazione creazione contestuale con errore sintattico”](#1022-esempio-di-messaggio-di-risposta-con-esito-ok-400---validazione-pubblicazione-creazione-contestuale-con-errore-sintattico)
    - [10.2.3. Esempio di Messaggio di Risposta con esito OK 201 - “Validazione Pubblicazione creazione contestuale con warning semantico”](#1023-esempio-di-messaggio-di-risposta-con-esito-ok-201---validazione-pubblicazione-creazione-contestuale-con-warning-semantico)
- [11. Servizio di validazione pubblicazione sostituzione contestuale](#11-servizio-di-validazione-pubblicazione-sostituzione-contestuale)
  - [11.1. Request](#111-request)
    - [11.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione Sostituzione Documento con Attachment”](#1111-messaggio-di-richiesta-esempio-validazione-pubblicazione-sostituzione-documento-con-attachment)
  - [11.2. Response](#112-response)
    - [11.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”](#1121-esempio-di-messaggio-di-risposta-con-esito-ok-200-pubblicazione-sostituzione-documento-con-attachment)
    - [11.2.2. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con warning semantico”](#1122-esempio-di-messaggio-di-risposta-con-esito-ok-200-pubblicazione-sostituzione-documento-con-warning-semantico)
    - [11.2.3. Esempio di Messaggio di Risposta con esito OK 400, “Pubblicazione Sostituzione Documento con errore sintattico”](#1123-esempio-di-messaggio-di-risposta-con-esito-ok-400-pubblicazione-sostituzione-documento-con-errore-sintattico)
- [12. Servizio di Notifica Stato Transazione](#12-servizio-di-notifica-stato-transazione)
  - [12.1. Modalità di Comunicazione e Paradigma di Sicurezza](#121-modalità-di-comunicazione-e-paradigma-di-sicurezza)
  - [12.2. Modalità Push](#122-modalità-push)
    - [12.2.1. Endpoint Push Broker verso Gateway](#1221-endpoint-push-broker-verso-gateway)
    - [12.2.2. Request](#1222-request)
    - [12.2.3. Parametri Body](#1223-parametri-body)
  - [12.3. Notifica verso l’Utente Finale](#123-notifica-verso-lutente-finale)
    - [12.3.1. Endpoint (Gateway verso touchpoint)](#1231-endpoint-gateway-verso-touchpoint)
    - [12.3.2. Payload di Notifica in caso di success](#1232-payload-di-notifica-in-caso-di-success)
    - [12.3.3. Payload di Notifica in caso di errore verso INI](#1233-payload-di-notifica-in-caso-di-errore-verso-ini)
    - [12.3.4. Payload di Notifica in caso di errore verso UAR](#1234-payload-di-notifica-in-caso-di-errore-verso-uar)
  - [12.4. Comportamento della Tabella di Routing del Gateway](#124-comportamento-della-tabella-di-routing-del-gateway)
  - [12.5. Modalità Pull](#125-modalità-pull)
    - [12.5.1. Endpoint Pull Gateway verso Broker](#1251-endpoint-pull-gateway-verso-broker)
    - [12.5.2. Response](#1252-response)
    - [12.5.3. Esempio risposta 200](#1253-esempio-risposta-200)
  - [12.6. Stati transazione](#126-stati-transazione)
- [13. Servizio di Recupero Stato Transazione per WorkflowInstanceId](#13-servizio-di-recupero-stato-transazione-per-workflowinstanceid)
  - [13.1. Request](#131-request)
    - [13.1.1. Esempio Messaggio di Richiesta stato Transazioni](#1311-esempio-messaggio-di-richiesta-stato-transazioni)
  - [13.2. Response](#132-response)
    - [13.2.1. Esempio messaggio di risposta ad una creazione con Esito Success 200](#1321-esempio-messaggio-di-risposta-ad-una-creazione-con-esito-success-200)
    - [13.2.2. Esempio messaggio di risposta ad una cancellazione con Esito Success 200](#1322-esempio-messaggio-di-risposta-ad-una-cancellazione-con-esito-success-200)
    - [13.2.3. Esempio messaggio di risposta ad una sostituzione con Esito Success 200](#1323-esempio-messaggio-di-risposta-ad-una-sostituzione-con-esito-success-200)
    - [13.2.4. Esempio messaggio di risposta ad una update con Esito Success 200](#1324-esempio-messaggio-di-risposta-ad-una-update-con-esito-success-200)
    - [13.2.5. Esempio di Messaggio di Risposta con esito KO 404](#1325-esempio-di-messaggio-di-risposta-con-esito-ko-404)
- [14. Servizio di Recupero Stato Transazione per TraceId](#14-servizio-di-recupero-stato-transazione-per-traceid)
  - [14.1. Request](#141-request)
    - [14.1.1. Esempio Messaggio di Richiesta stato Transazioni](#1411-esempio-messaggio-di-richiesta-stato-transazioni)
  - [14.2. Response](#142-response)
- [15. Drilldown Response in caso di Errore](#15-drilldown-response-in-caso-di-errore)
  - [15.1. Errori Applicativi](#151-errori-applicativi)
    - [15.1.1. Esempi di errore generati dal Gateway](#1511-esempi-di-errore-generati-dal-gateway)
  - [15.2. Errori provenienti da Apparati di Frontiera](#152-errori-provenienti-da-apparati-di-frontiera)
- [16. Drilldown Parametri di Input](#16-drilldown-parametri-di-input)
  - [16.1. Campi Contenuti nei JWT](#161-campi-contenuti-nei-jwt)
  - [16.2. Campi Contenuti nella Request Body](#162-campi-contenuti-nella-request-body)
  - [16.3. Tabelle di Riferimento](#163-tabelle-di-riferimento)
    - [16.3.1. Attività Clinica Enum](#1631-attività-clinica-enum)
    - [16.3.2. Healthcare Facility Type Code](#1632-healthcare-facility-type-code)
    - [16.3.3. Tipo Documento Alto Livello](#1633-tipo-documento-alto-livello)
    - [16.3.4. Event Code](#1634-event-code)
  - [Tabella dei codici](#tabella-dei-codici)
  - [Tabella dei codici](#tabella-dei-codici-1)
    - [16.3.5. Ruolo](#1635-ruolo)
    - [16.3.6. Contesto Operativo](#1636-contesto-operativo)
    - [16.3.7. Organizzazione](#1637-organizzazione)
    - [16.3.8. Practice Setting Code](#1638-practice-setting-code)
    - [16.3.9. Activity Enum](#1639-activity-enum)
    - [16.3.10. Injection Mode Enum](#16310-injection-mode-enum)
    - [16.3.11. Health Data Format Enum](#16311-health-data-format-enum)
    - [16.3.12. Tipo Attività](#16312-tipo-attività)
    - [16.3.13. Administrative Request](#16313-administrative-request)
  - [16.4. Correlazione tra classCode e typeCode](#164-correlazione-tra-classcode-e-typecode)
    - [16.4.1. Tabella dei controlli](#1641-tabella-dei-controlli)
- [17. Notes](#17-notes)

# 1. Introduzione


## 1.1. Riferimenti

| RIF. | DOCUMENTO | DESCRIZIONE |
|------|-----------|-------------|
| 1 | http://www.hl7italia.it/hl7italia_D7/hl7it_publications | Implementation Guide CDA R2 |
| 2 | Affinity Domain 2.6.1 | Documento Affinity Domain |
| 3 | Linee Guida FSE | Linee guida FSE |

_Tabella 1: Riferimenti Esterni_

## 1.2. Acronimi e Definizioni

| ACRONIMO | DEFINIZIONE |
|----------|-------------|
| API | Application Programming Interface |
| REST | REpresentational State Transfer |
| FHIR | Fast Healthcare Interoperability Resources |
| CDA | Clinical Document Architecture |
| URI | Uniform Resource Identifier |
| JWT | JSON Web Token |
| INI | Infrastruttura Nazionale per l'Interoperabilità |
| FSE | Fascicolo Sanitario Elettronico |
| HL7 | Health Level 7 |
| GTW | Gateway |
| EDS | Ecosistema Dati Sanitari |
| N.A. | Non Applicabile |

_Tabella 2: Acronimi e Definizioni_

## Registro Modifiche

| VERSIONE | DATA | MODIFICHE |
|----------|------|-----------|
| 1.1 | 20/05/22 | Paragrafi modificati: Tutti - prima stesura a seguito rivisitazione |
| 1.2 | 07/06/22 | Paragrafi modificati: Tutti - stesura a seguito rivisitazione |
| 1.3 | 13/06/22 | Paragrafi modificati: 2.2 scenario integrazione gateway; 3.2 aggiornamento status code; 4.2 aggiornamento status code; 5.1 obbligatorietà campo patient_consent |
| 1.4 | 28/06/2022 | Paragrafi modificati: 2 Contesto di riferimento; 3 aggiornamento paragrafo introduttivo; 3.1 aggiornamento parametri; 4 aggiornamento paragrafo; 4.1 aggiornamento parametri; 5.1 eliminata valorizzazione; 5.3 stesura paragrafo; vari aggiornamenti tabelle |
| 1.5 | 05/07/2022 | Correzioni su tutte le sezioni |
| 2.0 | 29/07/2022 | Paragrafi modificati: 3 aggiornamento Request; 4 aggiornamento Request; 5 eliminazione documento; 6 sostituzione documento; 7 aggiornamento metadati; 8.1 doppio JWT |
| 2.1 | 15/10/2022 | Paragrafi modificati: 2 specificato nome allegato CDA: cda.xml; 2.3 aggiunte note su JWT e certificati |
| 2.2 | 28/11/2022 | Paragrafi modificati: 2 evidenziato endpoint sistema di test |
| 2.3 | 12/12/2022 | Paragrafi modificati: 2 aggiornamento contesto; 5 aggiornamento eliminazione; 6 aggiornamento sostituzione; 7 aggiornamento metadati; 8 servizio recupero stato; 9 servizio recupero per TraceId; 10 drilldown response; 11.1 nuovi custom claims |
| 2.4 | 21/02/2022 | Paragrafi modificati: 5,7,8,9 rimozione Content-Type; 6 rimozione priorità e workflowInstanceId |
| 2.5 | 03/03/2023 | Paragrafi modificati: 4,6,7 aggiunti parametri in request body; 11 aggiornamento enums |
| 2.6 | 23/03/2023 | Paragrafi modificati: 8 validazione pubblicazione creazione; 9 validazione pubblicazione sostituzione; cambio indici paragrafi |
| 2.7 | 15/03/2024 | Paragrafi modificati: 9 validazione pubblicazione sostituzione contestuale |
| 2.8 | 27/03/2024 | Paragrafi modificati: 13.1 campi contenuti nei JWT |
| 2.9 | 29/07/2024 | Paragrafi modificati: 13.1 campi contenuti nei JWT |
| 2.10 | 02/10/2024 | Paragrafi modificati: 13.1 chiarimenti claim locality |
| 2.11 | 23/10/2024 | Paragrafi modificati: 10 servizio recupero stato; vari esempi messaggi di risposta |
| 2.12 | 04/12/2024 | Paragrafi modificati: 2 contesto di riferimento; 7.1 request; 7.3 esempio messaggio |
| 2.13 | 03/03/2025 | Paragrafi modificati: 13.3.5 ruolo; 13.3.4 event code; 13.3.7 organizzazione; 13.3.8 practice setting code |
| 2.14 | 23/05/2025 | Paragrafi modificati: 13.1 gestione claim locality e authorInstitution; 13.3.6 aggiunto campo ACCESS UPDATE |
| 2.15 | 30/06/2025 | Paragrafi modificati: 2 aggiunto cappello FHIR diretto; 4 definizione paragrafo FHIR; 5,6 rimozione flag priorità; modifica indice validazione FHIR |
| 2.16 | 22/09/2025 | Paragrafi modificati: 14 modificato enum tipo documento; 14.3.13 tabella administrative request; 14.3.4 event code con P00; 14.3.5 ruolo con DAP |
| 2.17 | 03/12/2025 | Paragrafi modificati: 5.2, 6.2, 7.2, 8.2, 9.2, 10.2 modificato status code in 202 |
| 2.18 | 23/03/2026 | Paragrafi modificati: 11 inseriti esempio response per status KO; 14 rimossa non obbligatorietà resource_hl7_type per update |
| 2.19 | 23/04/2026 | Paragrafi modificati: 2 aggiornata tabella endpoint e funzionalità |
| 2.20 | 05/06/2026 | Aggiornamento capitolo 11 con aggiunta paragrafo autenticazione |
| 2.21 | 16/06/2026 | Ripristinato capitolo search status/{workflowInstanceId}; modificato paragrafo 11.5 modalità pull |
| 2.22 | 25/06/2026 | Aggiornamento paragrafo autenticazione |
| 2.23 | 24/07/2026 | Aggiunta endpoint aggiornamento metadati oscuramento a catena; refattorizzazione indice; aggiornamento tabelle per valori ad 2.6.4 |
| 2.24 | 16/09/2026 | Correzione obbligatorietà metadato Administrative Request |

_Tabella 3: Registro Modifiche_


# 2. Contesto di Riferimento

La nuova architettura del FSE prevede la presenza di un componente, denominato Gateway, adibito all’acquisizione, alla validazione, e alla traduzione di dati e documenti clinici secondo i formati definiti dalle Linee Guida FSE. Tali dati e documenti sono prodotti dai Sistemi in uso presso le Strutture Sanitarie (Sistemi Produttori). 

In questo documento verranno indicate le modalità per usufruire dei servizi esposti dal gateway: il      documento sarà redatto in modo incrementale e di volta in volta ulteriori API saranno integrate e illustrate. 

In questa fase vengono trattati i due servizi principali del Gateway, che consentono rispettivamente di invocare le funzionalità di Validazione Documento CDA2 e FHIR e di Pubblicazione Documento CDA2, e i servizi che consentono l’eliminazione e l’aggiornamento del documento e dei suoi metadati.


<table>
  <tr>
    <td><strong>Endpoint URL</strong></td>
    <td><strong>Metodo</strong></td>
    <td><strong>Funzionalità</strong></td>
    <td><strong>Disponibile in Produzione</strong></td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents/validation</td>
    <td>POST</td>
    <td>VALIDAZIONE DOCUMENTO CDA2</td>
    <td>Sì</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents/fhir-validation</td>
    <td>POST</td>
    <td>VALIDAZIONE DOCUMENTO FHIR</td>
    <td>No</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents</td>
    <td>POST</td>
    <td>PUBBLICAZIONE DOCUMENTO CDA2</td>
    <td>Si</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents/{identificativoDocUpdate}</td>
    <td>DELETE</td>
    <td>ELIMINAZIONE DOCUMENTO</td>
    <td>Si</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents/{identificativoDocUpdate}</td>
    <td>PUT</td>
    <td>SOSTITUZIONE DOCUMENTI</td>
    <td>Si</td>
  </tr> 
  <tr>
    <td>/v&lt;major&gt;/documents/{identificativoDocUpdate}/metadata-iti-57</td>
    <td>PUT</td>
    <td>AGGIORNAMENTO METADATI ITI-57</td>
    <td>Si</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents/{identificativoDocUpdate}/metadata-oscuramento-catena</td>
    <td>PUT</td>
    <td>AGGIORNAMENTO METADATI PER OSCURAMENTO A CATENA</td>
    <td>No</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents/validate-and-create</td>
    <td>POST</td>
    <td>VALIDAZIONE E PUBBLICAZIONE CREAZIONE CONTESTUALE</td>
    <td>Si</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/documents/validate-and-replace/{idDoc}</td>
    <td>PUT</td>
    <td>VALIDAZIONE E PUBBLICAZIONE SOSTITUZIONE CONTESTUALE</td>
    <td>Si</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/status/{workflowInstanceId}</td>
    <td>GET</td>
    <td>RECUPERO STATO TRANSAZIONE PER WORKFLOWINSTANCEID</td>
    <td>Si</td>
  </tr>
  <tr>
    <td>/v&lt;major&gt;/status/search/{traceId}</td>
    <td>GET</td>
    <td>RECUPERO STATO TRANSAZIONE PER TRACEID</td>
    <td>Si</td>
  </tr>
</table>


_Tabella 4: Endpoint/Funzionalità_

L'endpoint del **sistema di test** è: 

    https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1

L'endpoint del **sistema di produzione** è: 

    https://modipa.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1

La Pubblicazione di un documento CDA2 deve essere sempre preceduta da una Validazione Documento CDA2. Una Validazione Documento CDA2/FHIR può non essere seguita dalla Pubblicazione. Questo avverrà soprattutto nella fase iniziale in cui si utilizzerà il solo servizio di validazione per i vari test.  Per distinguere questi due casi è stato introdotto il campo “Activity” specificato nelle successive sezioni.

I due servizi di Validazione e Pubblicazione sono correlati da un identificativo di transazione referenziato nel documento come “workflowInstanceId” secondo standard IHE (Data Type  CXi).

Per identificare invece i documenti da cancellare o aggiornare il chiamante dovrà fornire al Gateway l’OID (Object Identifier) del documento da gestire (lo stesso che è stato fornito in creazione e propagato ad INI in XDSDocumentEntry.uniqueId e all’EDS tramite il MasterIdentifier della DocumentReference).

**Validazione Documento CDA2**

Nello scenario di questa funzionalità il Sistema Produttore invia un documento secondo il formato standard HL7 CDA2, ed iniettato in un PDF, il nome CDA allegato deve essere `cda.xml` (senza considerare maiuscole e minuscole). Il `cda.xml` deve essere presente in uno dei seguenti punti all'interno del pdf:
- Root/Names/EmbeddedFiles/Names/[1]/EF/F
- Root/Names/EmbeddedFiles/Kids/[0]/Names/[1]/EF/F

In differenti circostanze, verrà restituito un errore di validazione come definito al paragrafo [3.2.2](#322-messaggio-di-risposta-esempio-validation-con-attachment-con-esito-ko-400).


Il servizio è sincrono, e implementa le validazioni ed i controlli sintattici, semantici e terminologici. In caso di un esito con errore, verranno restituiti i dettagli di questo indicati nell’apposita sezione in “Response”.

In caso di validazione eseguita con successo, l’esito tornato è positivo e la Validazione può ritenersi conclusa correttamente. 

**Validazione Documento FHIR**

Nello scenario di questa funzionalità il Sistema Produttore invia un documento secondo il formato standard FHIR; Tale endpoint accetterà sia un Bundle FHIR in JSON nei casi in cui non si ha a disposizione il documento ma solo i metadati, sia un PDF con iniettato un bundle il cui nome deve essere `bundleFhir.json`(senza considerare maiuscole e minuscole) presente in uno dei seguenti punti all'interno del pdf:
- Root/Names/EmbeddedFiles/Names/[1]/EF/F
- Root/Names/EmbeddedFiles/Kids/[0]/Names/[1]/EF/F

In differenti circostanze, verrà restituito un errore di validazione.
Il servizio è sincrono, e implementa le validazioni ed i controlli sintattici, semantici. In caso di un esito con errore, verranno restituiti i dettagli di questo indicati nell’apposita sezione in “Response”.
In caso di validazione eseguita con successo, l’esito tornato è positivo e la Validazione può ritenersi conclusa correttamente. 

**Pubblicazione Documento CDA2**

Nello scenario di questa funzionalità il Repository Documentale locale invia il documento secondo il formato standard HL7 CDA2 ed iniettato in PDF firmato digitalmente in modalità **PADES**, corredato di alcuni metadati come di seguito indicato. Il documento CDA2 innestato nel documento dovrà corrispondere a quello precedentemente validato secondo il servizio di Validazione Documenti CDA2.

La verifica della corrispondenza verrà fatta calcolando l’hash del CDA2 estrapolato dal PDF ignorando il campo signature del tag "Legal Authenticator" del CDA fornito in input. Il processo di Pubblicazione procederà soltanto se l’hash coincide con quello calcolato nel flusso di validazione.

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

**Aggiornamento metadati per oscuramento**

Questa funzionalità mette a disposizione un endpoint dedicato solo ed esclusivamente all'aggiornamento dei metadati a seguito di un’operazione scaturita da una catena di oscuramento. 
In particolare, il servizio gestisce unicamente l'aggiornamento del metadato eventCodeList verso INI e del metadato securityLabel presente nella DocumentReference verso EDS

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

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

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

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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

# 4. Servizio di Validazione FHIR

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Validazione Bundle FHIR si compone come segue:


```
https://<HOST>:<PORT>/v<major>/documents/fhir-validation
```


Lo scopo di questa API è validare un documento nativo FHIR da un punto di vista sintattico, semantico sfruttando le implementation guide dei diversi tipi documento.


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
   <td>/v1/documents/fhir-validation
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>multipart/form-data
   </td>
  </tr>
</table>


_Tabella 10: Method, Url, Type_


<table>
    <tr>
        <td colspan="6"> <strong>PARAMETER</strong>
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
        <td rowspan="4">Request
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
        <td rowspan="2">requestBody
        </td>
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


_Tabella 11: Parametri Richiesta di Validazione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “mode” comporta la restituzione di un errore di tipo warning. 

Il Request Body è di tipo **multipart/form-data**, al suo interno sono previsti due parametri:

* **file** che potrà contenere un file PDF con iniettato un Bundle FHIR in formato JSON, o in alternativa un file JSON di un Bundle FHIR(quando non si ha a disposizione il documento ma solo i metadati) in linea con quanto riportato nelle «Implementation Guide»
* **requestBody** che dovrà contenere l’oggetto json con i parameter di input


### 4.1.1. Messaggio di richiesta, esempio “Verifica con PDF”

Messaggio di richiesta con activity “VERIFICA” (validazione che non sarà seguita da pubblicazione), pdf con Bundle FHIR innestato in modalità ATTACHMENT

``` bash
curl -X 'POST' \	
  'https://<HOST>:<PORT>/v1/documents/validation' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={ 
  "mode": "ATTACHMENT",
  "activity": "VERIFICA",
}' \
  -F 'file=@BUNDLE_FHIR_ATTACH.pdf;type=application/pdf'
```


### 4.1.2. Messaggio di richiesta, esempio “Verifica con Bundle JSON”

Messaggio di richiesta con activity “VERIFICA” (validazione che non sarà seguita da pubblicazione), file Bundle FHIR fornito direttamente in input

``` bash
curl -X 'POST' \	
  'https://<HOST>:<PORT>/v1/documents/validation' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'requestBody={ 
  "mode": "RESOURCE",
  "activity": "VERIFICA",
}' \
  -F 'file=@BUNDLE_FHIR.json;type=application/json'
```

## 4.2. Response


<table cellspacing="0" cellpadding="5">
  <tr>
    <td><strong>TIPO IN CASO DI SUCCESSO</strong></td>
    <td colspan="2">application/json</td>
  </tr>
  <tr>
    <td><strong>TIPO IN CASO DI ERRORE*</strong></td>
    <td colspan="2">application/problem+json</td>
  </tr>
  <tr>
    <td rowspan="14"><strong>STATUS CODE</strong></td>
    <td><strong>200</strong></td>
    <td>Validazione positiva a seguito dell'activity di verifica**</td>
  </tr>
  <tr>
    <td><strong>400</strong></td>
    <td>Bad Request</td>
  </tr>
  <tr>
    <td><strong>401</strong></td>
    <td>Unauthorized</td>
  </tr>
  <tr>
    <td><strong>403</strong></td>
    <td>Token JWT mancante o non valido</td>
  </tr>
  <tr>
    <td><strong>404</strong></td>
    <td>Not Found</td>
  </tr>
  <tr>
    <td><strong>409</strong></td>
    <td>Conflict</td>
  </tr>
  <tr>
    <td><strong>413</strong></td>
    <td>Payload Too Large</td>
  </tr>
  <tr>
    <td><strong>415</strong></td>
    <td>Unsupported Media Type</td>
  </tr>
  <tr>
    <td><strong>429</strong></td>
    <td>Too Many Requests</td>
  </tr>
  <tr>
    <td><strong>500</strong></td>
    <td>Internal Server Error</td>
  </tr>
  <tr>
    <td><strong>501</strong></td>
    <td>Not Implemented</td>
  </tr>
  <tr>
    <td><strong>502</strong></td>
    <td>Invalid response received from the API implementation</td>
  </tr>
  <tr>
    <td><strong>503</strong></td>
    <td>Service Unavailable</td>
  </tr>
  <tr>
    <td><strong>504</strong></td>
    <td>Endpoint request timed out</td>
  </tr>
</table>


_Tabella 12: Response Servizio di Validazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

** Allo stato attuale è prevista solo la validazione di un Bundle FHIR non finalizzato alla pubblicazione e per tale motivo non sarà consentita l'invocazione dell'api con il valore di activity pari a VALIDATION.
In risposta all'invocazione, verrà restituito dal gateway lo StatusCode 200  in caso di SUCCESS

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
   <td>Identificativo univoco assegnato alla richiesta dell'utente.
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


_Tabella 13: Campi Response sempre valorizzati_

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


_Tabella 14: Campi Response valorizzati in caso di warning_


### 4.2.1. Messaggio di risposta, esempio “Verifica con PDF” con esito Success 200 

``` json
{ 
 "traceID": "4e1cd92c6a406c4f", 
 "spanID": "4e1cd92c6a406c4f", 
 "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```


### 4.2.2. Messaggio di risposta, esempio “Validation con Attachment” con esito KO 400

``` json
{
  "traceID": "7fee3f3e2fc75b30",
  "spanID": "7fee3f3e2fc75b30",
  "type": "/msg/fhir-element",
  "title": "Errore in fase di estrazioneBundle FHIR.",
  "detail": "Errore in fase di estrazione del Bundle FHIR.",
  "status": 400,
  "instance": "/msg/fhir-extraction"
}
```


### 4.2.3. Messaggio di risposta, esempio “Verifica con Bundle” con esito Success 200 con warning

``` json
{
  "traceID": "96c6883856f9f887",
  "spanID": "96c6883856f9f887",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.847c307946d33d8f14876ebb7204f2018a9cbc230da855ac27ed5413a5e2f051.bcf54e7cb9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "warning": "Attenzione, non è stata selezionata la modalità di estrazione del CDA"
}
```


# 5. Servizio di Creazione 
Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Creazione Documento CDA2 si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents
```

Lo scopo di questa API è indicizzare un nuovo documento clinico sul FSE regionale, tradurre i dati clinici nel formato HL7 FHIR ed inviarli al Data Repository Centrale.


## 5.1. Request


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
   <td>true
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>
  
  
  
</table>


_Tabella 16: Parametri Richiesta di Creazione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

Il Request Body è di tipo **multipart/form-data**, al suo interno sono previsti due parametri:



* **file** che dovrà contenere un file PDF con iniettato un Clinical Document in formato XML in linea con quanto riportato nelle «Implementation Guide CDA R2» al link [1]


* **requestBody** che dovrà contenere l’oggetto json con i parameter di input

### 5.1.1. Messaggio di Richiesta, esempio “Pubblicazione con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti. 

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
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \

  -F 'file=@CDA_OK.pdf;type=application/pdf'
```

### 5.1.2. Messaggio di Richiesta, esempio “Pubblicazione con Resource”

Messaggio di richiesta con pdf con CDA innestato in modalità RESOURCE, tipo documento CDA e metadati formalmente corretti.

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
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
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
   <td rowspan="11" >STATUS CODE
   </td>
   <td>202
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


_Tabella 17: Response Servizio di Pubblicazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


### 5.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Pubblicazione con Attachment”

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 5.2.2. Messaggio di Risposta, esempio “Pubblicazione con Resource” con esito KO 400

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

# 6. Servizio di Eliminazione Documento

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 8.1 “Campi Contenuti nei JWT”.

L’Endpoint del caso d’uso di Eliminazione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>
```

Lo scopo di questa API Sincrona è eliminare le risorse FHIR precedentemente pubblicate, inclusi i metadati scritti su INI.

Il Gateway esegue preliminarmente una transazione ITI-18 di tipo LeafClass verso INI per recuperare il metadato **urn:ita:fse:2025:EDSpublished**. Qualora tale metadato risulti valorizzato a true, verrà effettuata l’eliminazione del Bundle FHIR associato al documento presente sul server FHIR regionale. Al contrario, se il valore del metadato è false, verrà eseguita un’operazione di cancellazione (ITI-63) esclusivamente nei confronti di INI.


## 6.1. Request


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


_Tabella 21: Parametri Richiesta di Eliminazione_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento da eliminare e al parametro _identificativoDoc_ utilizzato nel servizio di creazione.


### 6.1.1. Messaggio di Richiesta, esempio “Eliminazione Documento”

Messaggio di richiesta con identificativoDocUpdate presente e formalmente corretto. 

``` bash
curl -X 'DELETE' \
  'https://<HOST>:<PORT>/v1/documents/507f1f77bcf86cd799439011' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
```

## 6.2. Response


<table>
  <tr>
    <td>TIPO IN CASO DI SUCCESSO</td>
    <td colspan="2">application/json</td>
  </tr>
  <tr>
    <td>TIPO IN CASO DI ERRORE*</td>
    <td colspan="2">application/problem+json</td>
  </tr>
  <tr>
    <td rowspan="13">STATUS CODE</td>
    <td>200</td>
    <td>Cancellazione eseguita con successo</td>
  </tr>
  <tr>
    <td>202</td>
    <td>Presa in carico eseguita con successo</td>
  </tr>
  <tr>
    <td>400</td>
    <td>Bad request</td>
  </tr>
  <tr>
    <td>401</td>
    <td>Unauthorized</td>
  </tr>
  <tr>
    <td>403</td>
    <td>Token jwt mancante o non valido</td>
  </tr>
  <tr>
    <td>404</td>
    <td>Not found</td>
  </tr>
  <tr>
    <td>409</td>
    <td>Conflict</td>
  </tr>
  <tr>
    <td>413</td>
    <td>Payload too large</td>
  </tr>
  <tr>
    <td>429</td>
    <td>Too Many Requests</td>
  </tr>
  <tr>
    <td>500</td>
    <td>Internal server error</td>
  </tr>
  <tr>
    <td>502</td>
    <td>Invalid response received from the API Implementation</td>
  </tr>
  <tr>
    <td>503</td>
    <td>Service unavailable</td>
  </tr>
  <tr>
    <td>504</td>
    <td>Endpoint request timed-out</td>
  </tr>
</table>



_Tabella 22: Response Servizio di Pubblicazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


### 6.2.1. Esempio di Messaggio di Risposta con esito OK 200 - Delete eseguita con successo

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
  "type": "/msg/mandatory-element",
  "title": "Campo obbligatorio non presente",
  "detail": "Il campo identificativo documento deve essere valorizzato",
  "status": 400,
  "instance": "/msg/mandatory-element"
}
```

# 7. Servizio di Sostituzione Documento

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Sostituzione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>
```

Lo scopo di questa API asincrona è consentire la pubblicazione di un documento in modalità di sostituzione, sovrascrivendo una versione precedentemente pubblicata dello stesso.

A tale scopo, il Gateway invoca preliminarmente una transazione ITI-18 (LeafClass) verso INI per recuperare il metadato **urn:ita:fse:2025:EDSpublished**. L’esito di tale verifica viene propagato al flusso asincrono e utilizzato come criterio di instradamento dell’operazione. In particolare, se il documento risulta pubblicato anche nel contesto EDS, l’elaborazione verrà eseguita sia nei confronti di INI sia di EDS; diversamente, l’operazione verrà indirizzata esclusivamente verso INI.


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
   <td>true
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>

</table>


_Tabella 26: Parametri Richiesta di Pubblicazione Sostituzione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “mode” comporta la resituzione di un errore di tipo warning. 

Il Request Body coincide con la struttura utilizzata per il servizio di Pubblicazione Creazione Documento.

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento da sostituire e al parametro _identificativoDoc_ utilizzato precedentemente nel servizio di creazione.


### 7.1.1. Messaggio di Richiesta, esempio “Pubblicazione Sostituzione Documento con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti. 

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
   <td rowspan="11" >STATUS CODE
   </td>
   <td> 202
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


_Tabella 27: Response Servizio di Pubblicazione Sostituzione Documento_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


_Tabella 28: Campi Response sempre valorizzati_

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


_Tabella 29: Campi Response valorizzati in caso di warning_


### 7.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”

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
  "type": "/msg/cda-element",
  "title": "Errore in fase di recupero dell'esito della verifica.",
  "detail": "Il CDA non risulta validato",
  "status": 400,
  "instance": "/msg/cda-element"
}
```

# 8. Servizio di Aggiornamento Metadati

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Aggiornamento Metadati si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>/metadata
```

Lo scopo di questa API Sincrona è di aggiornare i metadati di un documento precedentemente pubblicato.

Prima di eseguire l’operazione di aggiornamento, il Gateway invoca una transazione ITI-18 (LeafClass) verso INI per recuperare il metadato urn:ita:fse:2025:EDSpublished. Se il valore restituito è true, il Gateway procede con l’aggiornamento della sola risorsa DocumentReference associata al documento presente sul server FHIR regionale, propagando contestualmente l’aggiornamento verso INI. Qualora invece il metadato risulti valorizzato a false, l’operazione di aggiornamento viene eseguita esclusivamente nei confronti di INI mediante una ITI-57.

In ambiente di validazione, è stato rilascio un ulteriore endpoint:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>/metadata-iti-57
```

Tale endpoint consentirà ai diversi attori di invocare la nuova transazione di aggiornamento metadati "IHE ITI-57" mediante il Gateway. Le interfacce esposte rispettano le stesse e identiche specifiche della precedente transazione. 

``` IMPORTANTE
Tale endpoint sarà esposto in ambiente di validazione per un tempo necessario da consentire a tutte le RDA di adeguarsi. Successivamente, previa comunicazione, verrà utilizzato l'endpoint /metadata per eseguire la transazione di ITI-57 attraverso il GTW

```

## 8.1. Request

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


_Tabella 30: Method, URL, Type_

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
   <td>/v1/documents/{identificativoDocUpdate}/metadata-iti-57
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>application/json
   </td>
  </tr>
</table>


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
   <td>true
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>
  
</table>


_Tabella 31: Parametri Richiesta di Pubblicazione Aggiornamento Metadati_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento di cui modificare i metadati e al parametro _identificativoDoc_ utilizzato nel servizio di creazione.


### 8.1.1. Esempio Messaggio di Richiesta

Messaggio di richiesta con metadati formalmente corretti, senza indicazione della priorità. 

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
}'
```

## 8.2. Response


<table>
  <tr>
    <td>TIPO IN CASO DI SUCCESSO</td>
    <td colspan="2">application/json</td>
  </tr>
  <tr>
    <td>TIPO IN CASO DI ERRORE*</td>
    <td colspan="2">application/problem+json</td>
  </tr>
  <tr>
    <td rowspan="11">STATUS CODE</td>
    <td>200</td>
    <td>Aggiornamento eseguito con successo</td>
  </tr>
  <tr>
    <td>202</td>
    <td>Presa in carico eseguita con successo</td>
  </tr>
  <tr>
    <td>400</td>
    <td>Bad request</td>
  </tr>
  <tr>
    <td>401</td>
    <td>Unauthorized</td>
  </tr>
  <tr>
    <td>403</td>
    <td>Token jwt mancante o non valido</td>
  </tr>
  <tr>
    <td>404</td>
    <td>Not found</td>
  </tr>
  <tr>
    <td>409</td>
    <td>Conflict</td>
  </tr>
  <tr>
    <td>413</td>
    <td>Payload too large</td>
  </tr>
  <tr>
    <td>429</td>
    <td>Too Many Requests</td>
  </tr>
  <tr>
    <td>500</td>
    <td>Internal server error</td>
  </tr>
  <tr>
    <td>502</td>
    <td>Invalid response received from the API Implementation</td>
  </tr>
  <tr>
    <td>503</td>
    <td>Service unavailable</td>
  </tr>
  <tr>
    <td>504</td>
    <td>Endpoint request timed-out</td>
  </tr>
</table>


_Tabella 32: Response Servizio di Pubblicazione Aggiornamento Documento_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


_Tabella 33: Campi Response sempre valorizzati_

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


_Tabella 34: Campi Response valorizzati in caso di warning_


### 8.2.1. Esempio di Messaggio di risposta con Esito Success 200

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 8.2.2. Esempio di Messaggio di Risposta con esito KO 400

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

### 8.2.3. Esempio Messaggio di Richiesta attraverso iti-57

Messaggio di richiesta  con metadati formalmente corretti, senza indicazione della priorità. 

``` bash
curl -X 'PUT' \
  'https://<HOST>:<PORT>/v1/documents/507f1f77bcf86cd799439011/metadata-iti-57' \
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
}'
```

Le risposte sono le medesime riportate per i casi precedenti.

# 9. Servizio di Aggiornamento Metadati per oscuramento a catena

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Aggiornamento Metadati per oscuramento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>/metadata-oscuramento-catena
```

Lo scopo di questa API sincrona è aggiornare i metadati di un documento precedentemente pubblicato, consentendo l’esecuzione delle operazioni necessarie all’oscuramento a catena del documento stesso.

In particolare, il flusso operativo si articola nelle seguenti fasi:

- Fase Preliminare: Viene eseguita una transazione ITI-18 (GetDocuments di tipo LeafClass) dal Gateway verso INI al fine di recuperare il metadato **urn:ita:fse:2025:EDSpublished** e il subset minimo di dati a eseguire successivamente la ITI-57. 
Sulla base del valore di questo metadato, la chiamata viene opportunamente dirottata verso EDS.

- Aggiornamento EDS: Qualora il flag urn:ita:fse:2025:EDSpublished risulti pari a TRUE, la chiamata di aggiornamento viene dirottata ed eseguita verso EDS. Nello specifico, si provvede al recupero della risorsa DocumentReference e al contestuale aggiornamento della proprietà securityLabel, impostandola al valore P99 ricevuto in input.

- Aggiornamento INI (ITI-57): Successivamente, viene eseguita la transazione ITI-57 verso INI mediante l'invio del subset minimo di metadati recuperati nella fase preliminare. L'operazione provvederà a veicolare verso la RDA il warning restituito da INI all'interno dell'apposita proprietà:
```
"warning": "R220 - The requestor is RDA for the patient"
```

in caso di messaggio diverso ottenuto da INI, il gateway sollverà un'eccezione

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
   <td>/v1/documents/{identificativoDocUpdate}/metadata-oscuramento-catena
   </td>
  </tr>
  <tr>
   <td>TYPE
   </td>
   <td>application/json
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
  </tr>
  <tr>
   <td>attiCliniciRegoleAccesso
   </td>
   <td>String[]
   </td>
   <td>true
   </td>
   <td>XDSDocumentEntry.eventCodeList
   </td> 
  </tr>  
  
</table>


_Tabella 31: Parametri Richiesta di Pubblicazione Aggiornamento Metadati_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.


### 9.1.1. Esempio Messaggio di Richiesta

Messaggio di richiesta con metadati formalmente corretti, senza indicazione della priorità. 

``` bash
curl -X 'PUT' \
  'https://<HOST>:<PORT>/v1/documents/ID_DOC_TEST/metadata-oscuramento-catena' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
  -H 'accept: application/json' \
  -d '{ 
  "attiCliniciRegoleAccesso": [
    "P99"
  ]
}'
```

## 9.2. Response


<table>
  <tr>
    <td>TIPO IN CASO DI SUCCESSO</td>
    <td colspan="2">application/json</td>
  </tr>
  <tr>
    <td>TIPO IN CASO DI ERRORE*</td>
    <td colspan="2">application/problem+json</td>
  </tr>
  <tr>
    <td rowspan="11">STATUS CODE</td>
    <td>200</td>
    <td>Aggiornamento eseguito con successo</td>
  </tr>
  <tr>
    <td>400</td>
    <td>Bad request</td>
  </tr>
  <tr>
    <td>401</td>
    <td>Unauthorized</td>
  </tr>
  <tr>
    <td>403</td>
    <td>Token jwt mancante o non valido</td>
  </tr>
  <tr>
    <td>404</td>
    <td>Not found</td>
  </tr>
  <tr>
    <td>409</td>
    <td>Conflict</td>
  </tr>
  <tr>
    <td>413</td>
    <td>Payload too large</td>
  </tr>
  <tr>
    <td>429</td>
    <td>Too Many Requests</td>
  </tr>
  <tr>
    <td>500</td>
    <td>Internal server error</td>
  </tr>
  <tr>
    <td>502</td>
    <td>Invalid response received from the API Implementation</td>
  </tr>
  <tr>
    <td>503</td>
    <td>Service unavailable</td>
  </tr>
  <tr>
    <td>504</td>
    <td>Endpoint request timed-out</td>
  </tr>
</table>


_Tabella 32: Response Servizio di Pubblicazione Aggiornamento Documento_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


_Tabella 33: Campi Response sempre valorizzati_

### 9.2.1. Esempio di Messaggio di risposta con Esito Success 200

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "warning": "The requestor is RDA for the patient"
}
```

### 9.2.2. Esempio di Messaggio di Risposta con esito KO 400

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

# 10. Servizio di validazione e pubblicazione creazione contestuale
Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l'invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti, è necessario fare riferimento al Capitolo 13 "Drilldown Parametri di Input.

L’Endpoint del caso d’uso di Validazione e pubblicazione creazione Documento CDA2 si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/validate-and-create
```

Lo scopo di questa API è validare (sintatticamente, semanticamente, terminologicamente) un documento CDA2. Nel caso di errore bloccante di validazione, il processo ritornerà all'utente il dettaglio relativo. Nel caso invece di errore non bloccante in validazione o di successo, si procederà all'indicizzazione sul FSE regionale, alla traduzione dei dati clinici nel formato HL7 FHIR e al successivo invio al Data Repository Centrale..


## 10.1. Request


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
   <td>true
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>
  
  
  
</table>


_Tabella 36: Parametri Richiesta di validazione pubblicazione creazione contestuale_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

Il Request Body è di tipo **multipart/form-data**, al suo interno sono previsti due parametri:



* **file** che dovrà contenere un file PDF con iniettato un Clinical Document in formato XML in linea con quanto riportato nelle «Implementation Guide CDA R2» al link [1]


* **requestBody** che dovrà contenere l’oggetto json con i parameter di input

### 10.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti. 

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
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \
  -F 'file=@CDA_OK.pdf;type=application/pdf'
```

### 10.1.2. Messaggio di Richiesta, esempio “Validazione Pubblicazione creazione con Resource”

Messaggio di richiesta con pdf con CDA innestato in modalità RESOURCE, tipo documento CDA e metadati formalmente corretti.

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
  "descriptions": [
    "019655^Bentelan^2.16.840.1.113883.2.9.6.1.5"
  ],
  "administrativeRequest": ["SSN"]
}' \

  -F 'file=@CDA_OK.pdf;type=application/pdf'
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
   <td rowspan="11" >STATUS CODE
   </td>
   <td>202
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


_Tabella 37: Response Servizio di Validazione Pubblicazione creazione contestuale_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


### 10.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Validazione Pubblicazione creazione contestuale con Attachment”

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" \
}
```

### 10.2.2. Esempio di Messaggio di Risposta con esito OK 400 - “Validazione Pubblicazione creazione contestuale con errore sintattico”


``` json
{ 
  "traceID": "20ec517920fd7f656a29381551f1f021",
  "spanID": "f80596f827cf991f",
  "type": "/msg/syntax",
  "title": "Errore di sintassi.",
  "detail": "Error while executing validation on xsd schema",
  "status": 400,
  "instance": "/validation/error",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.99b2bee0c9^^^^urn:ihe:iti:xdw:2013:workflowInstanceId"
}
```

### 10.2.3. Esempio di Messaggio di Risposta con esito OK 201 - “Validazione Pubblicazione creazione contestuale con warning semantico”


``` json
{
  "traceID": "b20d5f0f59d117ca",
  "spanID": "b20d5f0f59d117ca",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.10908.4.4.2.0d0002200a27e9ead4de0891c19736a630eab68fb09f7851561bbfeed7389948.9562421609^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "warning": "[W005 | Sezione Esame Eseguito: l'entry/act/code può essere valorizzato secondo i sistemi di codifica\n\t\t\tLOINC @codeSystem='2.16.840.1.113883.6.1'\n\t\t\tICD-9-CM @codeSystem='2.16.840.1.113883.6.103']"
}
```
 
# 11. Servizio di validazione pubblicazione sostituzione contestuale

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Validazione Pubblicazione Sostituzione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/validate-and-replace/<identificativoDocUpdate>
```

Lo scopo di questa API è validare (sintatticamente, semanticamente, terminologicamente) un documento CDA2. Nel caso di errore bloccante di validazione, il processo ritornerà all'utente il dettaglio relativo. Nel caso invece di errore non bloccante in validazione o di successo, si procederà all'indicizzazione sul FSE regionale sostituendo un documento precedentemente pubblicato, alla traduzione dei dati clinici nel formato HL7 FHIR e al successivo invio al Data Repository Centrale. 


## 11.1. Request


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


_Tabella 40: Method, URL, Type_


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
   <td>true
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>

</table>


_Tabella 41: Parametri Richiesta di Validazione Pubblicazione Sostituzione contestuale_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante. La non compilazione del parameter facoltativo “mode” comporta la resituzione di un errore di tipo warning. 

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento da sostituire e al parametro _identificativoDoc_ utilizzato precedentemente nel servizio di creazione.


### 11.1.1. Messaggio di Richiesta, esempio “Validazione Pubblicazione Sostituzione Documento con Attachment”

Messaggio di richiesta con pdf con CDA innestato in modalità ATTACHMENT, tipo documento CDA e metadati formalmente corretti. 
 

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

## 11.2. Response


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
   <td> 202
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


_Tabella 42: Response Servizio di Validazione pubblicazione Sostituzione Documento contestuale_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


_Tabella 43: Campi Response sempre valorizzati_

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


_Tabella 44: Campi Response valorizzati in caso di warning_


### 11.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”

``` json
{ 
 "traceID": "c2e1818fbf7aea7f", 
 "spanID": "c2e1818fbf7aea7f", 
 "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 11.2.2. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con warning semantico”

``` json
{
  "traceID": "b20d5f0f59d117ca",
  "spanID": "b20d5f0f59d117ca",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.10908.4.4.2.0d0002200a27e9ead4de0891c19736a630eab68fb09f7851561bbfeed7389948.9562421609^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "warning": "[W005 | Sezione Esame Eseguito: l'entry/act/code può essere valorizzato secondo i sistemi di codifica\n\t\t\tLOINC @codeSystem='2.16.840.1.113883.6.1'\n\t\t\tICD-9-CM @codeSystem='2.16.840.1.113883.6.103']"
}
```

### 11.2.3. Esempio di Messaggio di Risposta con esito OK 400, “Pubblicazione Sostituzione Documento con errore sintattico”

``` json
{ 
  "traceID": "79e2637736ad9bae", 
  "spanID": "79e2637736ad9bae", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.46a41df0ab0514f11c0811056832c3225e06c8e11824f27c7e5517ca5cfc57fe.ac05831184^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "type": "/msg/syntax", 
  "title": "Errore di sintassi.", 
  "detail": "Error while executing validation on xsd schema", 
  "instance": "/validation/error", 
  "status": "400" 
}
```

# 12. Servizio di Notifica Stato Transazione

Il Servizio di Notifica Stato Transazione, consente l’aggiornamento e la riconciliazione dello stato delle operazioni asincrone di **creazione** e **sostituzione** dei documenti avviate verso la UA-R (Unità di Archiviazione Regionale).

Il Gateway non interagisce mai direttamente con la UA-R per la gestione delle notifiche di stato, ma utilizza il **Broker** come unico punto di integrazione, sia in modalità **push** sia in modalità **pull**.

Il servizio opera secondo due modalità distinte:

- **push** (modalità primaria e da prediligere);
- **pull** (modalità residuale, utilizzata solo per il recupero dello stato in caso di notifiche non ricevute).

## 12.1. Modalità di Comunicazione e Paradigma di Sicurezza

Il processo di autenticazione rispetta il seguente pattern delle Linee Guida ModI:

* [ID_AUTH_CHANNEL_02] (Direct Trust mutual Transport-Level Security) 

Il canale di notifica tra infrastruttura centrale e livello regionale utilizza il protocollo HTTPS con Transport Layer Security in modalità mutuale (mTLS), garantendo a livello di canale confidenzialità, integrità, identificazione bilaterale delle organizzazioni e protezione da attacchi. 
In particolare:
Il Gateway FSE (server) espone un certificato X.509 emesso dalla CA del Ministero della Salute, il Touchpoint Regionale (client) presenta a sua volta un proprio certificato X.509 valido;
Entrambe le parti verificano i rispettivi certificati tramite i propri truststore di fiducia, realizzando un'autenticazione reciproca.

## 12.2. Modalità Push

In modalità **push**, il Gateway riceve dal **Broker** la notifica dello stato di una transazione asincrona precedentemente avviata.

La notifica è originata dalla UA-R a valle dell’esecuzione dell’operazione (sia in caso di successo sia in caso di errore) ed è inoltrata dal Broker al Gateway sulla base delle informazioni di routing associate alla RDE di competenza.

Alla ricezione della notifica, il Gateway:

- identifica il workflow tramite il `workflowInstanceId`;
- aggiorna il proprio stato interno;
- consente l’allineamento del workflow applicativo con l’esito finale restituito dalla UA-R.

Successivamente, il Gateway **provvede a notificare il chiamante finale** in base alle preferenze espresse dal client:

- qualora il client abbia fornito un **indirizzo di callback** tramite apposito header `X-Callback-Url` nella richiesta iniziale, il Gateway invia la notifica verso tale endpoint;
- In assenza di un indirizzo di callback, il Gateway utilizza l'issuer per recuperare dalla tabella di routing interna il relativo record contenente l'URL da invocare per la riconciliazione, inviando poi la notifica a tale endpoint.

In questa modalità, il Gateway ha un ruolo attivo di **propagazione dello stato verso il client finale**, mantenendo il Broker come unico punto di integrazione con i sistemi centrali e senza effettuare interrogazioni dirette verso la UA-R.

La notifica verso il touchpoint finale **non contiene esclusivamente l’ultimo stato**, ma una **lista ordinata degli eventi di stato** associati al medesimo `workflowInstanceId`, così da consentire al chiamante una visione completa dell’evoluzione del workflow.

### 12.2.1. Endpoint Push Broker verso Gateway

```
http://<HOST>:<PORT>/v<major>/ingestion/status
```

### 12.2.2. Request

| METHOD | URL                    | TYPE             |
| ------ | ---------------------- | ---------------- |
| POST   | `/v1/ingestion/status` | application/json |

### 12.2.3. Parametri Body

| KEY                | TYPE   | REQUIRED |
| ------------------ | ------ | -------- |
| workflowInstanceId | String | true     |
| type               | String | true     |
| insertionDate      | Date   | true     |
| status             | String | true     |
| rde                | String | true     |

#### Esempio di richiesta

```bash
curl -X POST "http://<HOST>:<PORT>/v1/ingestion/status" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -H "Agid-JWT-Signature: <signed-jwt>" \
  -d '{
    "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.df3ea8b89f^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
    "type": "CREATE",
    "insertionDate": "2025-12-09T08:45:12Z",
    "status": "SUCCESS",
    "rde": "120"
  }'
```

#### Response

| STATUS | SIGNIFICATO                                | TIPO                     |
| ------ | ------------------------------------------ | ------------------------ |
| 200    | Stato transazione recepito correttamente   | application/json         |
| 400    | Errore di validazione                      | application/problem+json |
| 500    | Errore interno del server                  | application/problem+json |

#### Esempio risposta 200

```json
{
  "traceID": "c2e1818fbf7aea7f",
  "spanID": "c2e1818fbf7aea7f",
  "success": true
}
```

## 12.3. Notifica verso l’Utente Finale

Il Gateway invia la notifica verso il touchpoint finale secondo le preferenze espresse in fase di invocazione iniziale, come riportato in precedenza.

La notifica inviata dal Gateway include una **lista di eventi di stato** riferiti allo stesso workflow, ciascuno dei quali rappresenta una transizione significativa del processo (ad esempio validazione, pubblicazione, invio a sistemi esterni).

Le specifiche OpenAPI di tale endpoint sono disponibili nella repository GitHub al seguente percorso:

https://github.com/ministero-salute/it-fse-support/tree/main/openapi/gateway/swagger_status.yaml

### 12.3.1. Endpoint (Gateway verso touchpoint)

```
POST http://<CALLBACK_HOST>/v1/workflow/status
```

### 12.3.2. Payload di Notifica in caso di success

```json
{
  "workflowInstanceId": "urn:ietf:rfc:39861.be5b64eeecec0d4a506128c879f867f1bdde8c489d454371abd37875e8fbdc18.f335b5ebd3^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "events": [
    {
      "eventType": "VALIDATION",
      "eventDate": "2025-10-10T13:48:38.425Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "PUBLICATION",
      "eventDate": "2025-10-10T14:48:45.469Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "SEND_TO_INI",
      "eventDate": "2025-10-10T15:48:45.469Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "SEND_TO_UAR",
      "eventDate": "2025-10-10T16:48:45.469Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "UAR_FINAL_STATUS",
      "eventDate": "2025-10-10T16:48:45.480Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    }
  ]
}
```

### 12.3.3. Payload di Notifica in caso di errore verso INI

```json
{
  "workflowInstanceId": "urn:ietf:rfc:39861.be5b64eeecec0d4a506128c879f867f1bdde8c489d454371abd37875e8fbdc18.f335b5ebd3^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "events": [
    {
      "eventType": "VALIDATION",
      "eventDate": "2025-10-10T13:48:38.425Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "PUBLICATION",
      "eventDate": "2025-10-10T14:48:45.469Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "SEND_TO_INI",
      "eventDate": "2025-10-10T15:48:45.469Z",
      "eventStatus": "BLOCKING_ERROR",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    }
  ]
}
```

### 12.3.4. Payload di Notifica in caso di errore verso UAR

```json
{
  "workflowInstanceId": "urn:ietf:rfc:39861.be5b64eeecec0d4a506128c879f867f1bdde8c489d454371abd37875e8fbdc18.f335b5ebd3^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "events": [
    {
      "eventType": "VALIDATION",
      "eventDate": "2025-10-10T13:48:38.425Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "PUBLICATION",
      "eventDate": "2025-10-10T14:48:45.469Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "SEND_TO_INI",
      "eventDate": "2025-10-10T15:48:45.469Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "SEND_TO_UAR",
      "eventDate": "2025-10-10T16:48:45.469Z",
      "eventStatus": "SUCCESS",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    },
    {
      "eventType": "UAR_FINAL_STATUS",
      "eventDate": "2025-10-10T16:48:45.480Z",
      "eventStatus": "BLOCKING_ERROR",
      "issuer": "integrity:S1#111#TEST-CRASH-2"
    }
  ]
}
```

Il Gateway garantisce che gli eventi siano restituiti in ordine cronologico e che includano tutte le informazioni utili alla diagnosi e al monitoraggio del processo.

## 12.4. Comportamento della Tabella di Routing del Gateway

La **tabella di routing del Gateway** ha lo scopo di determinare il corretto endpoint di notifica verso il client finale quando non viene fornito un indirizzo di callback esplicito.

Ogni entry della tabella associa:

- una RDE;
- l’endpoint di notifica da utilizzare.

Il comportamento è il seguente:

1. il Gateway verifica la presenza dell’header di callback nella richiesta iniziale;
2. se presente, l’endpoint indicato ha priorità assoluta;
3. se assente, il Gateway interroga la tabella di routing interna;
4. se viene trovata una corrispondenza, l’endpoint associato viene utilizzato per la notifica;
5. in assenza di una corrispondenza valida, la notifica viene considerata non recapitabile e gestita secondo le policy di errore e retry del Gateway.

Questo meccanismo consente al Gateway di supportare sia integrazioni dinamiche basate su callback, sia integrazioni statiche basate su configurazione, garantendo flessibilità e controllo centralizzato dei touchpoint di uscita.

## 12.5. Modalità Pull

La modalità **pull** è prevista esclusivamente per scenari eccezionali in cui il Gateway non abbia ricevuto la notifica in modalità push.

In questo scenario, il Gateway attiva una **schedulazione periodica** che invoca il Broker fornendo il `workflowInstanceId` della transazione di interesse. Il Broker, grazie alle proprie informazioni di correlazione, provvede a interrogare la UA-R di riferimento e a restituire al Gateway lo stato aggiornato.

Il Gateway utilizza la risposta ricevuta per aggiornare il proprio stato interno e completare la riconciliazione del workflow.

Dopo aver completato la riconciliazione, un consumer può ottenere lo stato della saga invocando l'endpoint documentato al capitolo 12 (Servizio di Recupero Stato Transazione per WorkflowInstanceId) che consente di ottenere la lista dei diversi stati della saga del Gateway

### 12.5.1. Endpoint Pull Gateway verso Broker

```
http://<HOST>:<PORT>/v<major>/status/{workflowInstanceId}
```

#### Request

| METHOD | URL                                         | TYPE |
| ------ | ------------------------------------------- | ---- |
| GET    | `/v1/status/{workflowInstanceId}` | –    |

##### Parametri Path

| KEY                | TYPE   | REQUIRED |
| ------------------ | ------ | -------- |
| workflowInstanceId | String | true     |

#### Esempio di richiesta

```bash
curl -X GET "http://<HOST>:<PORT>/v1/status/2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.df3ea8b89f^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" \
  -H "Authorization: Bearer <token>" \
  -H "FSE-JWT-Signature: <signed-jwt>"
```

### 12.5.2. Response

| STATUS | SIGNIFICATO                                | TIPO                     |
| ------ | ------------------------------------------ | ------------------------ |
| 200    | Stato transazione recuperato correttamente | application/json         |
| 404    | Workflow non trovato                       | application/problem+json |
| 500    | Errore interno del server                  | application/problem+json |

### 12.5.3. Esempio risposta 200

```json
{
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.df3ea8b89f^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
  "type": "CREATE",
  "status": "SUCCESS",
  "insertionDate": "2025-12-09T08:47:30Z",
  "rde": "120"
}
```

## 12.6. Stati transazione
Di seguito sono riportati i diversi stati che possono essere ottenuti in seguito ad una richiesta asincrona 

| Event Type         | Event Status|
|------------------ |--------------|
| VALIDATION         | SUCCESS/BLOCKING_ERROR     |
| PUBLICATION        | SUCCESS/BLOCKING_ERROR     |
| SEND_TO_INI        | SUCCESS/BLOCKING_ERROR     |
| SEND_TO_UAR        | SUCCESS/BLOCKING_ERROR     |
| UAR_FINAL_STATUS   | SUCCESS/BLOCKING_ERROR     |

# 13. Servizio di Recupero Stato Transazione per WorkflowInstanceId

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Recupero Stato Transazione per WorkflowInstanceId si compone come segue:

```
https://<HOST>:<PORT>/v<major>/status/<workflowInstanceId>
```

Lo scopo di questa API Sincrona è di recuperare la lista di tutti gli eventi di una transazione associati ad un workflowInstanceId. In particolare per tutti gli attori che sono abilitati ad invocare tramite il Gateway la componente INI, sarà possibile anche recuperare un ulteriore stato che mostra la request e la response SOAP per tutte le operazioni di creazione, sostituzione, aggiornamento e cancellazione.
Tale funzionalità sara presente solo ed esclusivamente in ambiente di validazione.


## 13.1. Request


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


_Tabella 45: Method, URL, Type_


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


_Tabella 46: Parametri Richiesta di Recupero Stato Transazioni per WorkflowInstanceId_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.


### 13.1.1. Esempio Messaggio di Richiesta stato Transazioni

Messaggio di richiesta con workflowInstanceId valorizzato

``` bash
curl -X 'GET' \
'https://<HOST>:<PORT>/v1/status/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'accept: application/json' 
```

## 13.2. Response


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
   <td>Invalid response received from the API Implementation
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


_Tabella 47: Response Servizio di Recupero Stato Transazione per WorkflowInstanceId_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


_Tabella 48: Campi Response sempre valorizzati_

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


_Tabella 49: Campi Response sempre valorizzati_


### 13.2.1. Esempio messaggio di risposta ad una creazione con Esito Success 200

Di seguito viene mostrato un esempio di risposta ad una creazione per un issuer abilitato alla comunicazione verso INI con esito 200

``` json
{
  "traceID": "3f67b89ba72ed40b",
  "spanID": "81bad71c3ffea6d0",
  "transactionData": [
    {
      "eventType": "VALIDATION",
      "eventDate": "2024-10-23T12:26:06.971+02:00",
      "eventStatus": "SUCCESS",
      "subject": "PROVAX00X00X000Y^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO",
      "organizzazione": "120",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.440d410bf0^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "13dfc4b489d37ca3",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T12:26:07.470+02:00"
    },
    {
      "eventType": "PUBLICATION",
      "eventDate": "2024-10-23T12:26:25.266+02:00",
      "eventStatus": "SUCCESS",
      "identificativoDocumento": "2.16.840.1.113883.2.9.2.110.4.4^UAT_GTW_ID1729679184067",
      "subject": "PROVAX00X00X000Y^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO",
      "tipoAttivita": "PHR",
      "organizzazione": "120",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.440d410bf0^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "cc5783a359316a87",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T12:26:25.328+02:00"
    },
    
    {
      "eventType": "INI_CREATE_SOAP",
      "eventDate": "2024-10-23T12:26:25.812+0200",
      "message": "SOAP_REQUEST:<S:Envelope><S:Header>...</S:Header><S:Body>...</S:Body></S:Envelope> SOAP_RESPONSE:<soapenv:Envelope><soapenv:Header>...</soapenv:Header><soapenv:Body>...</soapenv:Body></soapenv:Envelope>",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.440d410bf0^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T12:26:26.155+0200"
    },
    {
      "eventType": "SEND_TO_INI",
      "eventDate": "2024-10-23T12:26:27.295+02:00",
      "eventStatus": "SUCCESS",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.440d410bf0^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T12:26:27.530+02:00"
    }

  ]

}
```

### 13.2.2. Esempio messaggio di risposta ad una cancellazione con Esito Success 200

Di seguito viene mostrato un esempio di risposta ad una cancellazione per un issuer abilitato alla comunicazione verso INI con esito 200

``` json
{
  "traceID": "96f988e9a3f6d449",
  "spanID": "53b7886d2a3acb85",
  "transactionData": [
    {
      "eventType": "INI_RIFERIMENTO_SOAP",
      "eventDate": "2024-10-23T12:39:13.959+0200",
      "message": "SOAP_REQUEST:<S:Envelope> <S:Header>...</S:Header><S:Body>...</S:Body></S:Envelope> SOAP_RESPONSE:<soapenv:Envelope><soapenv:Header>...</soapenv:Header><soapenv:Body>...</soapenv:Body></soapenv:Envelope>",
      "workflowInstanceId": "256b6fc0848497fd6a3fb63e2ff82db7ac8402766ad00291eecd9fc47d966a3e.c7cf8ce14f^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T12:39:14.002+0200"
    },
    {
      "eventType": "RIFERIMENTI_INI",
      "eventDate": "2024-10-23T12:39:14.304+02:00",
      "eventStatus": "SUCCESS",
      "message": "Riferimenti trovati: urn:uuid:62e9a58c-79cb-48fd-88f1-4a5fdaa5b0ed",
      "identificativoDocumento": "2.16.840.1.113883.2.9.2.110.4.4^UAT_GTW_ID1729679950959",
      "subject": "SSSMNN75B01F257L^^^&2.16.840.1.113883.2.9.4.3.2&ISO",
      "tipoAttivita": "PHR",
      "organizzazione": "120",
      "workflowInstanceId": "256b6fc0848497fd6a3fb63e2ff82db7ac8402766ad00291eecd9fc47d966a3e.c7cf8ce14f^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "88a9f590939e2b2e",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T12:39:14.345+02:00"
    },
    {
      "eventType": "INI_DELETE_SOAP",
      "eventDate": "2024-10-23T12:39:14.353+0200",
      "message": "SOAP_REQUEST:<S:Envelope><S:Header>....</S:Header><S:Body>...</S:Body></S:Envelope> \n SOAP_RESPONSE:<soapenv:Envelope><soapenv:Header>...</soapenv:Header><soapenv:Body>...</soapenv:Body></soapenv:Envelope>",
      "workflowInstanceId": "256b6fc0848497fd6a3fb63e2ff82db7ac8402766ad00291eecd9fc47d966a3e.c7cf8ce14f^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T12:39:14.379+0200"
    },
    {
      "eventType": "INI_DELETE",
      "eventDate": "2024-10-23T12:39:14.917+02:00",
      "eventStatus": "SUCCESS",
      "message": "Delete effettuata su ini",
      "identificativoDocumento": "2.16.840.1.113883.2.9.2.110.4.4^UAT_GTW_ID1729679950959",
      "subject": "SSSMNN75B01F257L^^^&2.16.840.1.113883.2.9.4.3.2&ISO",
      "tipoAttivita": "PHR",
      "organizzazione": "120",
      "workflowInstanceId": "256b6fc0848497fd6a3fb63e2ff82db7ac8402766ad00291eecd9fc47d966a3e.c7cf8ce14f^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "88a9f590939e2b2e",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T12:39:14.946+02:00"
    }
  ]
}
```

### 13.2.3. Esempio messaggio di risposta ad una sostituzione con Esito Success 200
Di seguito viene mostrato un esempio di risposta ad una sostituzione per un issuer abilitato alla comunicazione verso INI con esito 200

``` json
{
  "traceID": "ffaac0bad18ab232",
  "spanID": "b63453ce857318da",
  "transactionData": [
    {
      "eventType": "VALIDATION",
      "eventDate": "2024-10-23T12:46:44.425+02:00",
      "eventStatus": "SUCCESS",
      "subject": "SSSMNN75B01F257L^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO",
      "organizzazione": "120",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.8d9957eb69^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "4df615555b1ca812",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T12:46:44.450+02:00"
    },
    {
      "eventType": "INI_RIFERIMENTO_SOAP",
      "eventDate": "2024-10-23T12:46:47.148+0200",
      "message": "SOAP_REQUEST:<S:Envelope><S:Header>...</S:Header><S:Body>...</S:Body></S:Envelope> \n SOAP_RESPONSE:<soapenv:Envelope><soapenv:Header xmlns:wsa=\"http://www.w3.org/2005/08/addressing\">...</soapenv:Header><soapenv:Body>...</soapenv:Body></soapenv:Envelope>",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.8d9957eb69^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T12:46:47.172+0200"
    },
    {
      "eventType": "REPLACE",
      "eventDate": "2024-10-23T12:46:47.597+02:00",
      "eventStatus": "SUCCESS",
      "identificativoDocumento": "2.16.840.1.113883.2.9.2.110.4.4^UAT_GTW_ID1729680401519",
      "subject": "SSSMNN75B01F257L^^^&amp;2.16.840.1.113883.2.9.4.3.2&amp;ISO",
      "tipoAttivita": "PHR",
      "organizzazione": "120",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.8d9957eb69^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "be920b993364ec0a",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T12:46:47.653+02:00"
    },
    {
      "eventType": "INI_REPLACE_SOAP",
      "eventDate": "2024-10-23T12:46:47.673+0200",
      "message": "SOAP_REQUEST:<S:Envelope><S:Header>...</S:Header><S:Body>...</S:Body></S:Envelope> \n SOAP_RESPONSE:<soapenv:Envelope><soapenv:Header xmlns:wsa=\"http://www.w3.org/2005/08/addressing\">...</soapenv:Header><soapenv:Body>...</soapenv:Body></soapenv:Envelope>",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.8d9957eb69^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T12:46:47.724+0200"
    },
    {
      "eventType": "SEND_TO_INI",
      "eventDate": "2024-10-23T12:46:48.071+02:00",
      "eventStatus": "SUCCESS",
      "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.b0f3ffcf25ce2aafc7dc901e2febc51f43837f4ca0fe3b6d1b02194e9047b6db.8d9957eb69^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T12:46:48.102+02:00"
    }
  ]
}
```

### 13.2.4. Esempio messaggio di risposta ad una update con Esito Success 200

``` json
{
  "traceID": "e43e769a2a815203",
  "spanID": "e65b754508379297",
  "transactionData": [
    {
      "eventType": "INI_GET_METADATI_SOAP",
      "eventDate": "2024-10-23T13:01:10.185+0200",
      "message": "SOAP_REQUEST:<S:Envelope><S:Header>...</S:Header><S:Body>...</S:Body></S:Envelope> \n SOAP_RESPONSE:<soapenv:Envelope><soapenv:Header xmlns:wsa=\"http://www.w3.org/2005/08/addressing\">...</soapenv:Header><soapenv:Body>...</soapenv:Body></soapenv:Envelope>",
      "workflowInstanceId": "97fcdd6c0f5e003511104c7633fde2547ed4c973378b6686a33652c557a38b8f.7ba5fcfebf^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T13:01:10.201+0200"
    },
    {
      "eventType": "RIFERIMENTI_INI",
      "eventDate": "2024-10-23T13:01:10.871+02:00",
      "eventStatus": "SUCCESS",
      "message": "Merge metadati effettuato correttamente",
      "identificativoDocumento": "2.16.840.1.113883.2.9.2.140.4.4^UAT_GTW_ID1728471418703",
      "subject": "SSSMNN75B01F257L^^^&2.16.840.1.113883.2.9.4.3.2&ISO",
      "organizzazione": "140",
      "workflowInstanceId": "97fcdd6c0f5e003511104c7633fde2547ed4c973378b6686a33652c557a38b8f.7ba5fcfebf^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "6db24f996e15f507",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T13:01:10.892+02:00"
    },
    {
      "eventType": "INI_UPDATE_SOAP",
      "eventDate": "2024-10-23T13:01:10.907+0200",
      "message": "SOAP_REQUEST:<S:Envelope><S:Header>...</S:Header><S:Body>...</S:Body></S:Envelope> \n SOAP_RESPONSE:<soapenv:Envelope><soapenv:Header>...</soapenv:Header><soapenv:Body>...</soapenv:Body></soapenv:Envelope>",
      "workflowInstanceId": "97fcdd6c0f5e003511104c7633fde2547ed4c973378b6686a33652c557a38b8f.7ba5fcfebf^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "expiringDate": "2025-10-23T13:01:10.922+0200"
    },
    {
      "eventType": "INI_UPDATE",
      "eventDate": "2024-10-23T13:01:11.432+02:00",
      "eventStatus": "SUCCESS",
      "message": "Update ini effettuato correttamente",
      "identificativoDocumento": "2.16.840.1.113883.2.9.2.140.4.4^UAT_GTW_ID1728471418703",
      "subject": "SSSMNN75B01F257L^^^&2.16.840.1.113883.2.9.4.3.2&ISO",
      "organizzazione": "140",
      "workflowInstanceId": "97fcdd6c0f5e003511104c7633fde2547ed4c973378b6686a33652c557a38b8f.7ba5fcfebf^^^^urn:ihe:iti:xdw:2013:workflowInstanceId",
      "traceId": "6db24f996e15f507",
      "issuer": "integrity:S1#110201234567XX",
      "expiringDate": "2025-10-23T13:01:11.455+02:00"
    }
  ]
}
```

### 13.2.5. Esempio di Messaggio di Risposta con esito KO 404

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

# 14. Servizio di Recupero Stato Transazione per TraceId

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 16 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Recupero Stato Transazione per WorkflowInstanceId si compone come segue:

```
https://<HOST>:<PORT>/v<major>/status/search/<traceId>
```

Lo scopo di questa API Sincrona è di recuperare la lista di tutti gli eventi di una transazione associati ad un traceId. 


## 14.1. Request


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


_Tabella 50: Method, URL, Type_


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


_Tabella 51: Parametri Richiesta di Recupero Stato Transazioni per traceId_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.


### 14.1.1. Esempio Messaggio di Richiesta stato Transazioni

Messaggio di richiesta con workflowInstanceId valorizzato

``` bash
curl -X 'GET' \
  'https://<HOST>:<PORT>/v1/status/search/3f67b89ba72ed40b’ \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \ \
  -H 'accept: application/json' 
```

## 14.2. Response

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
   <td>Invalid response received from the API Implementation
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


_Tabella 47: Response Servizio di Recupero Stato Transazione per WorkflowInstanceId_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 13 “Drilldown Error Response”.

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


_Tabella 48: Campi Response sempre valorizzati_

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


_Tabella 49: Campi Response sempre valorizzati_


# 15. Drilldown Response in caso di Errore

Il Gateway genererà due tipologie di errore distinte, entrambe aderenti alla specifica RFC 7807.


## 15.1. Errori Applicativi

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


_Tabella 52: Campi Response valorizzati in caso di errore_


### 15.1.1. Esempi di errore generati dal Gateway


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



## 15.2. Errori provenienti da Apparati di Frontiera

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


_Tabella 53: Campi Response valorizzati in caso di errore govWay_


# 16. Drilldown Parametri di Input

Come riportato nel documento "Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Framework e dataset dei servizi base - Versione 2.5” l’interoperabilità fra i differenti sistemi di FSE a livello nazionale è assicurata tramite INI. 

INI rappresenta un mediatore per le comunicazioni tra i diversi sistemi regionali che appartengono allo stesso Affinity Domain, in grado di garantire ad un sistema di FSE di una regione diversa da quella di assistenza l’accesso ai documenti.

Per individuare i parametri di input dei servizi di pubblicazione relativi alla creazione è necessario quindi fare riferimento al dataset del servizio base di comunicazione metadati presentato al paragrafo 3.3 del documento citato in precedenza.

I campi dei messaggi di richiesta comunicazione metadati riportati nella tabella 9 sono suddivisi per tipologia, in particolare possiamo individuare:



* I campi “asserzione attributo”  
Campi aventi una natura tale da richiedere una certificazione da parte di Sistemi preposti; proprio per rispettare tale vincolo, i campi in questione dovranno essere inviati al Gateway attraverso il JWT fornito nell’header della chiamata.



* I campi “specifici per messaggio”  
Campi che possono essere forniti al Gateway direttamente tramite la request body.

Nella parte restante di questo paragrafo saranno descritti puntualmente i campi recuperati dal JWT (che coincidono con i campi “asserzione attributo”) e quelli recuperati dalla request body (che nascono dall’unione dei campi “specifici per messaggio” che non possono essere dedotti dal contesto di invocazione).


## 16.1. Campi Contenuti nei JWT

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
   <td>Codice Fiscale dell’utente o partita iva dell'azienda che fa richiesta del servizio di interoperabilità
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


_Tabella 54: Campi contenuti in Authentication Bearer Token_



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
   <td>Codice Fiscale dell’utente o partita iva dell'organizzazione che fa richiesta del servizio di interoperabilità
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
   <td>Tale attributo, univoco, identifica la struttura a cui appartiene l’utente.
L’elemento è sottoposto alle validazioni come da sezione "VALIDAZIONE" e viene utilizzato dal Gateway per il colloquio con INI come riportato nella sezione "NOTE".
Per maggiori informazioni sulla valorizzazione di tipo XON si può far riferimento ad AuthorInstitution nell'Affinity Domain Italia v.2.6.1 par. 2.1.2.
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>
   Il valore del custom claim <code>locality</code> deve essere unico e coerente per tutte le operazioni supportate dal Gateway 
  (<strong>CREATE, REPLACE, UPDATE, DELETE</strong>) e deve essere conforme al formato <strong>XON</strong> come mostrato dall'esempio che segue:
  <ul> 
      <li> <strong>LABORATORIO DI PROVA^^^^^&2.16.840.1.113883.2.9.4.1.3&ISO^^^^111101123456</strong> (tipo XON) – Questo valore appartiene al catalogo **STS.11/STS.11(6)** e rappresenta la struttura "LABORATORIO DI PROVA" della Regione “111”, ASL “101” e codice STS “123456”. 
      </li> 
      <li> <strong>OSPEDALI RIUNITI PINEROLO^^^^^&2.16.840.1.113883.2.9.4.1.2&ISO^^^^010030</strong> (tipo XON) – Questo valore appartiene al catalogo **HSP/HSP.11bis** e rappresenta l’ospedale “OSPEDALI RIUNITI PINEROLO”. 
      </li> 
      <li> <em>Altri valori possono appartenere ad ulteriori cataloghi, ciascuno con il proprio OID e codice specifico, purché rispettino il formato XON. Per maggiori dettali è possibile consultare l'Affinity domain</em> 
      </li> 
  </ul>
</br>
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Per i servizi di CREATE ,REPLACE (anche con validazione contestuale), DELETE e UPDATE il Gateway fa un controllo bloccante per verificare che il popolamento rispetti lo standard XON (in cui XON.1 contiene il nome della struttura, XON.6.2 rappresenta l’OID del sistema di codifica, XON.6.3 è obbligatoriamente “ISO” e XON.10 rappresenta il codice della struttura); </br>
   </td>
  </tr>
  <tr>
  <td><strong>CAMPO JWT</strong></td>
  <td><code>locality</code></td>
</tr>
<tr>
  <td><strong>NOTE</strong></td>
  <td>
    Il campo <code>locality</code> rappresenta l’identificativo della struttura utente e viene utilizzato dal Gateway in base al servizio richiesto. 
Su questo campo viene eseguito un controllo bloccante nelle operazioni di <strong>CREATE, REPLACE, UPDATE, DELETE</strong>, affinché rispetti la forma <code>XON</code>.
<p>Nelle operazioni di <strong>CREATE</strong> e <strong>REPLACE</strong> (anche con validazione contestuale), il Gateway utilizza il valore del claim <code>locality</code> per valorizzare verso INI:</p> 
<ul>
    <li>il metadato <code>Author.AuthorInstitution</code></li>
    <li>l'asserzione di attributo <code>locality</code></li>
</ul>
<p>Ad esempio, se il claim <code>locality</code> è valorizzato come:</p>
<code>LABORATORIO DI PROVA^^^^^&2.16.840.1.113883.2.9.4.1.3&ISO^^^^111101123456</code>
<p>, il valore verrà ribaltato così com'è sia per il metadato che per l'asserzione.</p>

<p>Nelle operazioni di <strong>DELETE</strong> e <strong>UPDATE</strong>, il Gateway utilizza il claim <code>locality</code> 
per popolare l'asserzione di attributo <code>locality</code> verso INI. Anche in questo caso se il metadato è conforme al formato XON viene ribaltato.</p>
<p>Il metadato <code>Author.AuthorInstitution</code>:</p>
    <ul><li>Non è richiesto nelle operazioni di DELETE.</li>
       <li>In UPDATE viene valorizzato con il valore ottenuto tramite l’operazione di recupero metadati (<code>FindDocuments</code>).</li>
    </ul>
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
   <td>Non Obbligatorio per il servizio di Eliminazione Documento
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

  <tr>
   <td colspan="2"  style="text-align:center"><strong>SUBJECT AS AUTHOR</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Tale campo se valorizzato con true consente di aggiungere nelle ITI-18 eseguite al Gateway lo slot $XDSDocumentEntry.author valorizzato con il medesimo valore del claim subject-id
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
   <td>Non obbligatorio
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td><code>use_subject_as_author</code>
   </td>
  </tr>
</table>


_Tabella 55: Campi contenuti in FSE-JWT-Signature_



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
  "locality": "LABORATORIO DI PROVA^^^^^&2.16.840.1.113883.2.9.4.1.3&ISO^^^^190111123456",
  "subject_organization": "Regione Sicilia", 
  "subject_organization_id": "190", 
  "aud": "https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/gateway/v1", 
  "patient_consent": true, 
  "action_id": "CREATE", 
  "resource_hl7_type": "('11502-2^^2.16.840.1.113883.6.1')",
  "exp": 1656541352925, 
  "iat": 1656454952925, 
  "jti": "1234", 
  "attachment_hash": "d04f5f5d34c7bbb77e27fba4edb2c49d16ca90193d89a47117e892387c7ee466", 
  "person_id": "PROVAX00X00X000Y^^^&2.16.840.1.113883.2.9.4.3.2&ISO" 
}
```

N.B: Il campo **locality** nell'esempio fa riferimento al **LABORATORIO DI PROVA** della Regione Sicilia **190**, ASL **111** e codice STS.11 **123456**


## 16.2. Campi Contenuti nella Request Body

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


_Tabella 56: Campi contenuti nella Request Body_

	




## 16.3. Tabelle di Riferimento

Nella sezione presente vengono riportate le Tabelle di Riferimento per i Parametri di Input: se specificato in “Fonte” queste sono riconducibili alle “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”, laddove non specificato si tratta di tabelle custom create ad uso dei servizi di questo documento.

Le informazioni riportate nelle tabelle con Fonte Affinity Domain, rispetto alle medesime specifiche di riferimento (versione 2.5), sono esclusivamente quelle necessarie all’utilizzo dei servizi di validazione e di pubblicazione.

Eventuali variazioni normative e/o ad Affinity Domain implicano l’aggiornamento delle tabelle referenziate.


### 16.3.1. Attività Clinica Enum

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


_Tabella 57:  _




### 16.3.2. Healthcare Facility Type Code

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


_Tabella 58: _Value set per il metadato XDSDocumentEntry.healthcareFacilityTypeCode_


### 16.3.3. Tipo Documento Alto Livello

**Fonte:**  
“Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.5”


| Codice | DisplayName | Descrizione utilizzo |
|--------|------------|---------------------|
| WOR | Documento di workflow | Questa classe di documenti deve essere utilizzata per i documenti di workflow. |
| REF | Referto | Questa classe di documenti deve essere utilizzata per ogni tipologia di referto. |
| LDO | Lettera di dimissione sia ospedaliera, sia non ospedaliera | Questa classe di documenti deve essere utilizzata per le lettere di dimissione ospedaliera e non ospedaliera. |
| RIC | Richiesta | Questa classe di documenti deve essere utilizzata per ogni tipologia di richiesta (prescrizioni, richieste di consulto, ecc.). |
| SUM | Sommario | Questa classe di documenti deve essere utilizzata per ogni tipologia di sommario (ad es. profilo sanitario sintetico). |
| TAC | Taccuino | Questa classe deve essere utilizzata per indicare documenti trasmessi nel taccuino dall’assistito. |
| PRS | Prescrizione | Questa classe specifica che le informazioni riguardano le prescrizioni condivise dal Sistema TS. |
| PRE | Prestazioni | Questa classe specifica che le informazioni riguardano le prestazioni erogate condivise dal Sistema TS. |
| ESE | Esenzione | Questa classe indica che le informazioni riguardano le esenzioni. |
| PDC | Piano di cura | Questa classe specifica che le informazioni riguardano i piani terapeutici condivisi dal Sistema TS. |
| VAC | Vaccino | Questa classe di documenti deve essere utilizzata per ogni tipologia di vaccino (scheda della singola vaccinazione, certificato vaccinale). |
| CER | Certificato per DGC | Questa classe di documenti deve essere utilizzata per i documenti associati al Digital Green Certificate (certificazione verde Covid-19, certificazione di guarigione da Covid-19). |
| VRB | Verbale | Questa classe di documenti deve essere utilizzata per ogni tipologia di verbale (ad es. verbale di pronto soccorso). |
| CON | Documento di consenso | Questa classe di documenti deve essere utilizzata per ogni tipologia di documento di consenso (ad es. consenso informato anestesia). |
| CNT | Documento di controllo | Questa classe di documenti deve essere utilizzata per ogni tipologia di documento che descrive un controllo clinico (ad es. bilanci di salute). |
| CRT | Certificato Amministrativo Generico | Questa classe di documenti deve essere utilizzata per i documenti di tipo Certificato amministrativo generico (ad es. certificato di malattia). |
| LET | Lettera | Questa classe di documenti deve essere utilizzata per comunicazioni formali di tipo sanitario. |
| PRO | Promemoria | Questa classe di documenti deve essere utilizzata per promemoria (es. promemoria di prescrizione o appuntamenti). |
| COL | Collezione documentale | Questa classe deve essere utilizzata per rappresentare un insieme aggregato di documenti correlati. |

_Tabella 44: _Value set per il metadato XDSDocumentEntry.classCode


### 16.3.4. Event Code

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.6”

## Tabella dei codici

## Tabella dei codici

| Codice | DisplayName | Descrizione |
|--------|-------------|-------------|
| 1001000221103 | 1001000221103 | Inactivated whole Vibrio cholerae antigen only vaccine product in oral dose form |
| 1011000221100 | 1011000221100 | Live attenuated Vibrio cholerae antigen only vaccine product in oral dose form |
| 1031000221108 | 1031000221108 | Human poliovirus antigen-containing vaccine product |
| 1051000221104 | 1051000221104 | Live attenuated Human poliovirus serotypes 1 and 3 antigens only vaccine product in oral dose form |
| 1052328007 | 1052328007 | Streptococcus pneumoniae Danish serotype 4, 6B, 9V, 14, 18C, 19F, and 23F capsular polysaccharide antigens conjugated only vaccine product |
| 1081000221109 | 1081000221109 | Live attenuated Rotavirus antigen only vaccine product |
| 1101000221104 | 1101000221104 | Clostridium tetani toxoid antigen-containing vaccine product |
| 1119254000 | 1119254000 | Streptococcus pneumoniae Danish serotype 1, 3, 4, 5, 6A, 6B, 7F, 9V, 14, 18C, 19A, 19F, and 23F capsular polysaccharide antigens only vaccine product |
| 1119305005 | 1119305005 | SARS-CoV-2 antigen vaccine |
| 1119349007 | 1119349007 | SARS-CoV-2 mRNA vaccine |
| 1121000221106 | 1121000221106 | Live attenuated Yellow fever virus antigen only vaccine product |
| 1131000221109 | 1131000221109 | Vaccine product containing only inactivated whole Rabies lyssavirus antigen |
| 1157024006 | 1157024006 | Inactivated whole SARS-CoV-2 antigen vaccine |
| 1162643001 | 1162643001 | SARS-CoV-2 recombinant spike protein antigen vaccine |
| 1181000221105 | 1181000221105 | Influenza virus antigen only vaccine product |
| 1801000221105 | 1801000221105 | Streptococcus pneumoniae capsular polysaccharide antigen conjugated only vaccine product |
| 1861000221106 | 1861000221106 | Bacillus Calmette-Guerin antigen only vaccine product |
| 1981000221108 | 1981000221108 | Neisseria meningitidis serogroup B antigen only vaccine product |
| 2171000221104 | 2171000221104 | Salmonella enterica subspecies enterica serovar Typhi capsular polysaccharide unconjugated antigen only vaccine product in parenteral dose form |
| 2221000221107 | 2221000221107 | Live attenuated Human alphaherpesvirus 3 only vaccine product |
| 28531000087107 | 28531000087107 | COVID-19 vaccine |
| 29061000087103 | 29061000087103 | COVID-19 non-replicating viral vector vaccine |
| 37146000 | 37146000 | Typhus vaccine |
| 409568008 | 409568008 | Pentavalent botulinum toxoid vaccine |
| 428601009 | 428601009 | Paratyphoid vaccine |
| 601000221108 | 601000221108 | Bordetella pertussis antigen-containing vaccine product |
| 774618008 | 774618008 | Whole cell Bordetella pertussis and Clostridium tetani toxoid adsorbed and Corynebacterium diphtheriae toxoid antigens only vaccine product |
| 775641005 | 775641005 | Clostridium tetani toxoid adsorbed and Corynebacterium diphtheriae toxoid antigens only vaccine product |
| 777725002 | 777725002 | Clostridium tetani toxoid antigen adsorbed only vaccine product |
| 836368004 | 836368004 | Bacteria antigen-containing vaccine product |
| 836369007 | 836369007 | Virus antigen-containing vaccine product |
| 836374004 | 836374004 | Hepatitis B virus antigen-containing vaccine product |
| 836375003 | 836375003 | Hepatitis A virus antigen-containing vaccine product |
| 836377006 | 836377006 | Influenza virus antigen-containing vaccine product |
| 836378001 | 836378001 | Japanese encephalitis virus antigen-containing vaccine product |
| 836379009 | 836379009 | Human papillomavirus antigen-containing vaccine product |
| 836380007 | 836380007 | Haemophilus influenzae type B antigen-containing vaccine product |
| 836381006 | 836381006 | Corynebacterium diphtheriae antigen-containing vaccine product |
| 836382004 | 836382004 | Measles morbillivirus antigen-containing vaccine product |
| 836383009 | 836383009 | Vibrio cholerae antigen-containing vaccine product |
| 836384003 | 836384003 | Bacillus anthracis antigen-containing vaccine product |
| 836385002 | 836385002 | Yellow fever virus antigen-containing vaccine product |
| 836387005 | 836387005 | Rotavirus antigen-containing vaccine product |
| 836388000 | 836388000 | Rubella virus antigen-containing vaccine product |
| 836389008 | 836389008 | Vaccinia virus antigen-containing vaccine product |
| 836390004 | 836390004 | Salmonella enterica subspecies enterica serovar Typhi antigen-containing vaccine product |
| 836393002 | 836393002 | Rabies lyssavirus antigen-containing vaccine product |
| 836397001 | 836397001 | Coxiella burnetii antigen-containing vaccine product |
| 836398006 | 836398006 | Streptococcus pneumoniae antigen-containing vaccine product |
| 836401009 | 836401009 | Neisseria meningitidis antigen-containing vaccine product |
| 836402002 | 836402002 | Bacillus Calmette-Guerin antigen-containing vaccine product |
| 836403007 | 836403007 | Tick-borne encephalitis virus antigen-containing vaccine product |
| 836495005 | 836495005 | Human alphaherpesvirus 3 antigen-containing vaccine product |
| 836498007 | 836498007 | Mumps orthorubulavirus antigen-containing vaccine product |
| 836500008 | 836500008 | Haemophilus influenzae type B and Neisseria meningitidis serogroup C antigens only vaccine product |
| 840549009 | 840549009 | Yersinia pestis antigen-containing vaccine product |
| 840563003 | 840563003 | Dengue virus antigen-containing vaccine product |
| 840599008 | 840599008 | Borrelia burgdorferi antigen-containing vaccine product |
| 863911006 | 863911006 | Clostridium tetani antigen-containing vaccine product |
| 871726005 | 871726005 | Rabies lyssavirus antigen only vaccine product |
| 871737006 | 871737006 | Mumps orthorubulavirus antigen only vaccine product |
| 871738001 | 871738001 | Live attenuated Mumps orthorubulavirus antigen only vaccine product |
| 871739009 | 871739009 | Human poliovirus antigen only vaccine product |
| 871740006 | 871740006 | Inactivated whole Human poliovirus antigen only vaccine product |
| 871742003 | 871742003 | Clostridium tetani antigen only vaccine product |
| 871751006 | 871751006 | Hepatitis A virus antigen only vaccine product |
| 871759008 | 871759008 | Acellular Bordetella pertussis only vaccine product |
| 871764007 | 871764007 | Haemophilus influenzae type b antigen only vaccine product |
| 871765008 | 871765008 | Measles morbillivirus antigen only vaccine product |
| 871768005 | 871768005 | Influenza virus antigen only vaccine product in nasal dose form |
| 871772009 | 871772009 | Influenza A virus subtype H1N1 antigen only vaccine product |
| 871803007 | 871803007 | Hepatitis A and Hepatitis B virus antigens only vaccine product |
| 871804001 | 871804001 | Hepatitis A virus and Salmonella enterica subspecies enterica serovar Typhi antigens only vaccine product |
| 871806004 | 871806004 | Haemophilus influenzae type B and Hepatitis B virus antigens only vaccine product |
| 871826000 | 871826000 | Clostridium tetani and Corynebacterium diphtheriae antigens only vaccine product |
| 871831003 | 871831003 | Measles morbillivirus and Mumps orthorubulavirus and Rubella virus antigens only vaccine product |
| 871837004 | 871837004 | Clostridium tetani and Corynebacterium diphtheriae and Human poliovirus antigens only vaccine product |
| 871839001 | 871839001 | Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Haemophilus influenzae type B antigens only vaccine product |
| 871866001 | 871866001 | Neisseria meningitidis serogroup C only vaccine product |
| 871871008 | 871871008 | Neisseria meningitidis serogroup A and C only vaccine product |
| 871873006 | 871873006 | Neisseria meningitidis serogroup A, C, W135 and Y only vaccine product |
| 871875004 | 871875004 | Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae antigens only vaccine product |
| 871876003 | 871876003 | Acellular Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae antigens only vaccine product |
| 871878002 | 871878002 | Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Human poliovirus antigens only vaccine product |
| 871887006 | 871887006 | Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Haemophilus influenzae type B and Human poliovirus antigens only vaccine product |
| 871889009 | 871889009 | Acellular Bordetella pertussis and Corynebacterium diphtheriae and Hepatitis B virus and inactivated whole Human poliovirus antigens only vaccine product |
| 871895005 | 871895005 | Bordetella pertussis and Clostridium tetani and Corynebacterium diphtheriae and Haemophilus influenzae type B and Hepatitis B virus and Human poliovirus antigens only vaccine product |
| 871908002 | 871908002 | Human alphaherpesvirus 3 and Measles morbillivirus and Mumps orthorubulavirus and Rubella virus antigens only vaccine product |
| 871918007 | 871918007 | Rickettsia antigen-containing vaccine product |
| 871921009 | 871921009 | Staphylococcus toxoid vaccine |
| 921000221108 | 921000221108 | Neisseria meningitidis antigen only vaccine product |
| 971000221109 | 971000221109 | Live attenuated Salmonella enterica subspecies enterica serovar Typhi antigen only vaccine product in oral dose form |
| 981000221107 | 981000221107 | Streptococcus pneumoniae antigen only vaccine product |
| J07AC | J07AC | Anthrax vaccines |
| J07AC01 | J07AC01 | anthrax antigen |
| J07AD | J07AD | Brucellosis vaccines |
| J07AD01 | J07AD01 | brucella antigen |
| J07AE | J07AE | Cholera vaccines |
| J07AE01 | J07AE01 | cholera, inactivated, whole cell |
| J07AE02 | J07AE02 | cholera, live attenuated |
| J07AE51 | J07AE51 | cholera, combinations with typhoid vaccine, inactivated, whole cell |
| J07AF | J07AF | Diphtheria vaccines |
| J07AF01 | J07AF01 | diphtheria toxoid |
| J07AG | J07AG | Haemophilus influenzae B vaccines |
| J07AG01 | J07AG01 | haemophilus influenzae B, purified antigen conjugated |
| J07AG51 | J07AG51 | haemophilus influenzae B, combinations with toxoids |
| J07AG52 | J07AG52 | haemophilus influenzae B, combinations with pertussis and toxoids |
| J07AG53 | J07AG53 | haemophilus influenzae B, combinations with meningococcus C, conjugated |
| J07AG54 | J07AG54 | haemophilus influenza B, combinations with meningococcus C,Y, conjugated |
| J07AH | J07AH | Meningococcal vaccines |
| J07AH01 | J07AH01 | meningococcus A, purified polysaccharides antigen |
| J07AH02 | J07AH02 | other meningococcal monovalent purified polysaccharides antigen |
| J07AH03 | J07AH03 | meningococcus A,C, bivalent purified polysaccharides antigen |
| J07AH04 | J07AH04 | meningococcus A,C,Y,W-135, tetravalent purified polysaccharides antigen |
| J07AH05 | J07AH05 | other meningococcal polyvalent purified polysaccharides antigen |
| J07AH06 | J07AH06 | meningococcus B, outer membrane vesicle vaccine |
| J07AH07 | J07AH07 | meningococcus C, purified polysaccharides antigen conjugated |
| J07AH08 | J07AH08 | meningococcus A,C,Y,W-135, tetravalent purified polysaccharides antigen conjugated |
| J07AH09 | J07AH09 | meningococcus B, multicomponent vaccine |
| J07AH10 | J07AH10 | meningococcus A, purified polysaccharides antigen conjugated |
| J07AH11 | J07AH11 | meningococcus A,B,C,Y,W-135, pentavalent purified polysaccharides antigen conjugated and factor H binding protein |
| J07AJ | J07AJ | Pertussis vaccines |
| J07AJ01 | J07AJ01 | pertussis, inactivated, whole cell |
| J07AJ02 | J07AJ02 | pertussis, purified antigen |
| J07AJ51 | J07AJ51 | pertussis, inactivated, whole cell, combinations with toxoids |
| J07AJ52 | J07AJ52 | pertussis, purified antigen, combinations with toxoids |
| J07AK | J07AK | Plague vaccines |
| J07AK01 | J07AK01 | plague, inactivated, whole cell |
| J07AL | J07AL | Pneumococcal vaccines |
| J07AL01 | J07AL01 | pneumococcus, purified polysaccharides antigen |
| J07AL02 | J07AL02 | pneumococcus, purified polysaccharides antigen conjugated |
| J07AL52 | J07AL52 | pneumococcus purified polysaccharides antigen and haemophilus influenzae, conjugated |
| J07AM | J07AM | Tetanus vaccines |
| J07AM01 | J07AM01 | tetanus toxoid |
| J07AM51 | J07AM51 | tetanus toxoid, combinations with diphtheria toxoid |
| J07AM52 | J07AM52 | tetanus toxoid, combinations with tetanus immunoglobulin |
| J07AN | J07AN | Tuberculosis vaccines |
| J07AN01 | J07AN01 | tuberculosis, live attenuated |
| J07AP | J07AP | Typhoid vaccines |
| J07AP01 | J07AP01 | typhoid, oral, live attenuated |
| J07AP02 | J07AP02 | typhoid, inactivated, whole cell |
| J07AP03 | J07AP03 | typhoid, purified polysaccharide antigen |
| J07AP10 | J07AP10 | typhoid, combinations with paratyphi types |
| J07AR | J07AR | Typhus (exanthematicus) vaccines |
| J07AR01 | J07AR01 | typhus exanthematicus, inactivated, whole cell |
| J07AX | J07AX | Other bacterial vaccines |
| J07AX01 | J07AX01 | leptospira vaccines |
| J07BA | J07BA | Encephalitis vaccines |
| J07BA01 | J07BA01 | encephalitis, tick borne, inactivated, whole virus |
| J07BA02 | J07BA02 | encephalitis, Japanese, inactivated, whole virus |
| J07BA03 | J07BA03 | encephalitis, Japanese, live attenuated |
| J07BB | J07BB | Influenza vaccines |
| J07BB01 | J07BB01 | influenza, inactivated, whole virus |
| J07BB02 | J07BB02 | influenza, inactivated, split virus or surface antigen |
| J07BB03 | J07BB03 | influenza, live attenuated |
| J07BB04 | J07BB04 | influenza, virus like particles |
| J07BB05 | J07BB05 | influenza, RNA-based vaccine |
| J07BC | J07BC | Hepatitis vaccines |
| J07BC01 | J07BC01 | hepatitis B, purified antigen |
| J07BC02 | J07BC02 | hepatitis A, inactivated, whole virus |
| J07BC20 | J07BC20 | combinations |
| J07BD | J07BD | Measles vaccines |
| J07BD01 | J07BD01 | measles, live attenuated |
| J07BD51 | J07BD51 | measles, combinations with mumps, live attenuated |
| J07BD52 | J07BD52 | measles, combinations with mumps and rubella, live attenuated |
| J07BD53 | J07BD53 | measles, combinations with rubella, live attenuated |
| J07BD54 | J07BD54 | measles, combinations with mumps, rubella and varicella, live attenuated |
| J07BE | J07BE | Mumps vaccines |
| J07BE01 | J07BE01 | mumps, live attenuated |
| J07BF | J07BF | Poliomyelitis vaccines |
| J07BF01 | J07BF01 | poliomyelitis oral, monovalent, live attenuated |
| J07BF02 | J07BF02 | poliomyelitis oral, trivalent, live attenuated |
| J07BF03 | J07BF03 | poliomyelitis, trivalent, inactivated, whole virus |
| J07BF04 | J07BF04 | poliomyelitis oral, bivalent, live attenuated |
| J07BG | J07BG | Rabies vaccines |
| J07BG01 | J07BG01 | rabies, inactivated, whole virus |
| J07BH | J07BH | Rota virus diarrhea vaccines |
| J07BH01 | J07BH01 | rota virus, live attenuated |
| J07BH02 | J07BH02 | rota virus, pentavalent, live, reassorted |
| J07BJ | J07BJ | Rubella vaccines |
| J07BJ01 | J07BJ01 | rubella, live attenuated |
| J07BJ51 | J07BJ51 | rubella, combinations with mumps, live attenuated |
| J07BK | J07BK | Varicella zoster vaccines |
| J07BK01 | J07BK01 | varicella, live attenuated |
| J07BK02 | J07BK02 | zoster, live attenuated |
| J07BK03 | J07BK03 | zoster, purified antigen |
| J07BL | J07BL | Yellow fever vaccines |
| J07BL01 | J07BL01 | yellow fever, live attenuated |
| J07BM | J07BM | Papillomavirus vaccines |
| J07BM01 | J07BM01 | papillomavirus (human types 6, 11, 16, 18) |
| J07BM02 | J07BM02 | papillomavirus (human types 16, 18) |
| J07BM03 | J07BM03 | papillomavirus (human types 6, 11, 16, 18, 31, 33, 45, 52, 58) |
| J07BN | J07BN | Covid-19 vaccines |
| J07BN01 | J07BN01 | covid-19, RNA-based vaccine |
| J07BN02 | J07BN02 | covid-19, viral vector, non-replicating |
| J07BN03 | J07BN03 | covid-19, inactivated virus |
| J07BN04 | J07BN04 | covid-19, protein subunit |
| J07BN05 | J07BN05 | covid-19, virus-like particles |
| J07BX | J07BX | Other viral vaccines |
| J07BX01 | J07BX01 | smallpox and monkeypox vaccines |
| J07BX02 | J07BX02 | ebola vaccines |
| J07BX04 | J07BX04 | dengue virus vaccines |
| J07BX05 | J07BX05 | respiratory syncytial virus vaccines |
| J07BX06 | J07BX06 | enterovirus 71 vaccines |
| J07CA | J07CA | Bacterial and viral vaccines, combined |
| J07CA01 | J07CA01 | diphtheria-poliomyelitis-tetanus |
| J07CA02 | J07CA02 | diphtheria-pertussis-poliomyelitis-tetanus |
| J07CA03 | J07CA03 | diphtheria-rubella-tetanus |
| J07CA04 | J07CA04 | haemophilus influenzae B and poliomyelitis |
| J07CA05 | J07CA05 | diphtheria-hepatitis B-pertussis-tetanus |
| J07CA06 | J07CA06 | diphtheria-haemophilus influenzae B-pertussis-poliomyelitis-tetanus |
| J07CA07 | J07CA07 | diphtheria-hepatitis B-tetanus |
| J07CA08 | J07CA08 | haemophilus influenzae B and hepatitis B |
| J07CA09 | J07CA09 | diphtheria-haemophilus influenzae B-pertussis-poliomyelitis-tetanus-hepatitis B |
| J07CA10 | J07CA10 | typhoid-hepatitis A |
| J07CA11 | J07CA11 | diphtheria-haemophilus influenzae B-pertussis-tetanus-hepatitis B |
| J07CA12 | J07CA12 | diphtheria-pertussis-poliomyelitis-tetanus-hepatitis B |
| J07CA13 | J07CA13 | diphtheria-haemophilus influenzae B-pertussis-tetanus-hepatitis B-meningococcus A + C |
| J07XA | J07XA | Parasitic vaccines |
| J07XA01 | J07XA01 | malaria vaccines |
| P99 | P99 | Oscuramento del documento |
| P00 | P00 | De-Oscuramento in alimentazione |
| P97 | P97 | Oscuramento al genitore |
| P98 | P98 | Oscuramento all’assistito |
| P81 | P81 | Versioni precedenti Profilo Sanitario Sintetico |
| LP418019-8 | LP418019-8 | Tampone antigenico per Covid-19 |
| LP417541-2 | LP417541-2 | Tampone molecolare per Covid-19 |
| 96118-5 | 96118-5 | Test Sierologico qualitativo |
| 94503-0 | 94503-0 | Test Sierologico quantitativo |
| pay | pay | Prescrizione farmaceutica non a carico SSN |
| PUBLICPOL | PUBLICPOL | Prescrizione farmaceutica SSN |
| LP267463-0 | LP267463-0 | Reddito |
| LP199190-2 | LP199190-2 | Patologia |
| 90768-3 | 90768-3 | Analisi sangue donatore |
 
_Tabella 45: Value set per il metadato XDSDocumentEntry.eventCodeList_


### 16.3.5. Ruolo

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.6”

| Valore | Descrizione | Mappatura con ruoli del DPCM sul FSE |
|--------|------------|-------------------------------------|
| AAS | Personale di assistenza ad alta specializzazione | Medico / Dirigente sanitario |
| APR | Medico Medicina Generale / Pediatra di Libera Scelta | Medico di Medicina Generale / Pediatra di Libera Scelta |
| PSS | Professionista del sociale | Professionista del sociale |
| INF | Personale infermieristico | Infermiere o altro Professionista Sanitario |
| FAR | Farmacista | Farmacista |
| DSA | Direttore sanitario | Direttore sanitario |
| DAM | Direttore amministrativo | Direttore amministrativo |
| OAM | Operatore amministrativo | Operatore Amministrativo |
| ASS | Assistito | Assistito |
| TUT | Tutore | Tutore |
| ING | Informal giver (Assistito) | Informal giver (Assistito) |
| GEN | Genitore Assistito | Genitore Assistito |
| NOR | Nodo regionale | Nodo regionale |
| DRS | Dirigente sanitario | Medico / Dirigente sanitario |
| RSA | Medico RSA | Medico RSA |
| MRP | Medico Rete di Patologia | Medico Rete di Patologia |
| INI | Infrastruttura Nazionale per l’Interoperabilità | Ruolo di sistema (non indicato nel DPCM perché non rappresenta una professione) |
| OGC | Operatore per la gestione dei consensi | Operatore per la gestione dei consensi |
| OPI | Operatore di informativa | Operatore di informativa |
| MDS | Ruolo del Ministero della Salute per la gestione del DGC | Non indicato nel DPCM perché non rappresenta una professione |
| GTW | Gateway | Ruolo per il Gateway EDS |
| DAP | Dispositivo azienda produttrice | Dispositivo azienda produttrice |

_Tabella 46: Value set per l’attributo urn:oasis:names:tc:xacml:2.0:subject:role_


### 16.3.6. Contesto Operativo

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
   <tr>
   <td>ACCESS UPDATE
   </td>
   <td>Aggiornamento di un documento e della politica di oscuramento P99
   </td>
   <td>Il valore deve essere utilizzato per il servizio di Aggiornamento Metadati.
   </td>
  </tr>
</table>


_Tabella 47: Value set per l’attributo urn:oasis:names:tc:xspa:1.0:subject:purposeofuse


### 16.3.7. Organizzazione

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.6”


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
   <td>GTW
   </td>
  </tr>
  <tr>
   <td><p style="text-align: right">
950</p>

   </td>
   <td>MDS
   </td>
  </tr>
</table>


_Tabella 48: _Value set per l’attributo urn:oasis:names:tc:xspa:1.0:subject:organization-id




### 16.3.8. Practice Setting Code

Fonte: “Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Affinity Domain Italia - Versione 2.6”

<table>
  <tr>
    <td><strong>Code</strong></td>
    <td><strong>CodingScheme</strong></td>
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
    <td>AD_PSC004</td>
    <td>Osservazione breve intensiva (OBI) e Pronto Soccorso</td>
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
    <td>AD_PSC041</td>
    <td>Medicina termale</td>
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
    <td>Dermatologia</td>
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
    <td>AD_PSC067</td>
    <td>Pensionato</td>
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
    <td>AD_PSC072</td>
    <td>Terapia Intensiva pediatrica</td>
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
    <td>AD_PSC094</td>
    <td>Terapia Intensiva</td>
  </tr>
  <tr>
    <td>AD_PSC096</td>
    <td>Terapia del dolore</td>
  </tr>
  <tr>
    <td>AD_PSC097</td>
    <td>Detenuti</td>
  </tr>
  <tr>
    <td>AD_PSC098</td>
    <td>Day Surgery</td>
  </tr>
  <tr>
    <td>AD_PSC099</td>
    <td>Cure palliative</td>
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

_Tabella 49: Value set per il metadato XDSDocumentEntry.practiceSettingCode_


### 16.3.9. Activity Enum


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


_Tabella 59: ActivityEnum_


### 16.3.10. Injection Mode Enum


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


_Tabella 60: InjectionModeEnum_


### 16.3.11. Health Data Format Enum


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


_Tabella 61: HealthDataFormatEnum_


### 16.3.12. Tipo Attività

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


_Tabella 62: action-id_


### 16.3.13. Administrative Request

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
        <td>Documenti prodotti in: regime di ricovero ad eccezione di ricoveri in libera professione completamente a
            carico del cittadino, pronto soccorso ad eccezione dei pazienti che non hanno copertura SSN.</td>
    </tr>
    <tr>
        <td>NOSSN</td>
        <td>Regime privato</td>
        <td>Documento prodotto in regime privato per cui il cittadino paga tutte le spese sanitarie (es. ricoveri in
            libera professione, prestazioni intramoenia, etc.</td>
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
    <tr>
        <td>AUTO</td>
        <td>Autoprodotto</td>
        <td>Documento prodotto a partire da dati di Taccuino o Documenti autoprodotti dal cittadino</td>
    </tr>
</table>

_Tabella 63: Value set per il metadato XDSDocumentEntry.Slot - Administrative Request_

## 16.4. Correlazione tra classCode e typeCode

Questo controllo verifica che esista una **correlazione valida** nelle operazioni di Creazione, Sostituzione e Aggiornamento tra:

- il **tipo documento**, estratto dal JWT (`resource_hl7_type`)
- il **tipo documento di alto livello** (`TipoDocAltoLivEnum`)

La validazione avviene tramite una mappa statica predefinita.

### 16.4.1. Tabella dei controlli

| Tipo Documento (`DocumentTypeEnum`) | Tipo Alto Livello ammesso (`TipoDocAltoLivEnum`) |
|-------------------------------------|--------------------------------------------------------|
| 57833_6 | PRS |
| 60591_5 | SUM |
| 11502_2 | REF |
| 57829_4 | PRS |
| 34105_7 | LDO |
| 18842_5 | LDO |
| 59258_4 | VRB |
| 68604_8 | REF |
| 11526_1 | REF |
| 59284_0 | CON |
| 104531_9 | CRT |
| 57832_8 | PRS |
| 60593_1 | PRE |
| 11488_4 | REF |
| 57827_8 | ESE |
| 81223_0 | PRE |
| 18776_5 | PDC |
| 97500_3 | CER |
| 87273_9 | VAC |
| 82593_5 | VAC |
| 97499_8 | CER |
| 55750_4 | SUM |
| 68814_3 | CNT |
| 103140_0 | TAC |
| 103144_2 | PRE |
| 103145_9 | PRE |
| 103146_7 | PRE |
| 103147_5 | PRE |
| 101136_0 | LET |
| 101134_5 | PRO |
| 101133_7 | CON |
| 53576_5 | TAC |
| 100971_1 | COL |
| 101881_1 | SUM |
| 108276_7 | LET |
| 111490_9 | LET |
| 112062_5 | CNT |
| 75496_0 | REF |
| 85208_7 | REF |
| 112063_3 | REF |
| 111827_2 | CNT |

# 17. Notes

[^1]: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità