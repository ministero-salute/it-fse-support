   **FASCICOLO SANITARIO ELETTRONICO 2.0**

   **INTERFACCE REST UAR**


   | Versione | :   | 1.0 |
   | -------- | --- | --- |

## INDICE

- [1. Introduzione](#1-introduzione)
  - [1.1. Riferimenti](#11-riferimenti)
  - [1.2. Acronimi e Definizioni](#12-acronimi-e-definizioni)
  - [1.3. Registro modifiche](#13-registro-modifiche)
- [2. Contesto di Riferimento](#2-contesto-di-riferimento)
  - [2.1. Pattern di Interazione](#21-pattern-di-interazione)
  - [2.2. Processo di Autenticazione\[^3\]](#22-processo-di-autenticazione3)
  - [2.3. Note su autenticazione e token JWT](#23-note-su-autenticazione-e-token-jwt)
- [3. Servizio di Memorizzazione Bundle FHIR](#3-servizio-di-memorizzazione-bundle-fhir)
    - [Endpoint](#endpoint)
    - [3.1. Request](#31-request)
      - [Parametri Path](#parametri-path)
      - [Parametri Body](#parametri-body)
      - [Esempio di richiesta](#esempio-di-richiesta)
  - [3.2. Response](#32-response)
      - [Esempio risposta 201](#esempio-risposta-201)
      - [Messaggio di Risposta con esito KO](#messaggio-di-risposta-con-esito-ko)
- [4. Servizio di Eliminazione Bundle FHIR](#4-servizio-di-eliminazione-bundle-fhir)
    - [Endpoint](#endpoint-1)
  - [4.1. Request](#41-request)
      - [Parametri Path](#parametri-path-1)
      - [Esempio di richiesta](#esempio-di-richiesta-1)
  - [4.2. Response](#42-response)
      - [Esempio risposta 200](#esempio-risposta-200)
      - [Esempio di Messaggio di Risposta con esito KO](#esempio-di-messaggio-di-risposta-con-esito-ko)
- [5. Servizio di Sostituzione Bundle FHIR](#5-servizio-di-sostituzione-bundle-fhir)
    - [Endpoint](#endpoint-2)
  - [5.1. Request](#51-request)
      - [Parametri Path](#parametri-path-2)
      - [Parametri Body](#parametri-body-1)
      - [Esempio di richiesta](#esempio-di-richiesta-2)
  - [5.2. Response](#52-response)
      - [Esempio risposta 200](#esempio-risposta-200-1)
      - [Esempio di Messaggio di Risposta con esito KO](#esempio-di-messaggio-di-risposta-con-esito-ko-1)
- [6. Servizio di Aggiornamento Metadati](#6-servizio-di-aggiornamento-metadati)
    - [Endpoint](#endpoint-3)
  - [6.1. Request](#61-request)
      - [Parametri Body](#parametri-body-2)
      - [Esempio di richiesta](#esempio-di-richiesta-3)
  - [6.2. Response](#62-response)
      - [Esempio risposta 200](#esempio-risposta-200-2)
      - [Esempio di Messaggio di Risposta con esito KO](#esempio-di-messaggio-di-risposta-con-esito-ko-2)
- [7. Drilldown Response in caso di Errore](#7-drilldown-response-in-caso-di-errore)
  - [7.1. Errori Applicativi](#71-errori-applicativi)
    - [7.1.1. Esempi di errore generati da UA-R](#711-esempi-di-errore-generati-da-ua-r)
- [8. Drilldown parametri di input](#8-drilldown-parametri-di-input)
  - [8.1. Campi Contenuti nei JWT](#81-campi-contenuti-nei-jwt)
  - [8.2 Campi Contenuti nella Request Body](#82-campi-contenuti-nella-request-body)
    - [Parametri obbligatori](#parametri-obbligatori)
  - [8.3. Campi contenuti nel Path](#83-campi-contenuti-nel-path)
- [9.  Politiche di Accesso e Matrice dei Ruoli Utente](#9--politiche-di-accesso-e-matrice-dei-ruoli-utente)
  - [9.1. Matrice di Accesso per Tipologia Documentale](#91-matrice-di-accesso-per-tipologia-documentale)
  - [9.2. Ruoli e Categorie Professionali](#92-ruoli-e-categorie-professionali)
- [10. Servizi di Consultazione FHIR](#10-servizi-di-consultazione-fhir)
  - [10.1. Consultazione Dati Clinici](#101-consultazione-dati-clinici)
  - [10.1.1. Condition](#1011-condition)
    - [Parametri di Ricerca](#parametri-di-ricerca)
  - [10.1.2. AllergyIntolerance](#1012-allergyintolerance)
    - [Parametri di Ricerca](#parametri-di-ricerca-1)
  - [10.1.3. MedicationStatement](#1013-medicationstatement)
    - [Parametri di Ricerca](#parametri-di-ricerca-2)
  - [10.1.4. MedicationDispense](#1014-medicationdispense)
    - [Parametri di Ricerca](#parametri-di-ricerca-3)
  - [10.1.5. Observation](#1015-observation)
    - [Parametri di Ricerca](#parametri-di-ricerca-4)
  - [10.1.6. Procedure](#1016-procedure)
    - [Parametri di Ricerca](#parametri-di-ricerca-5)
  - [10.1.7. DiagnosticReport](#1017-diagnosticreport)
    - [Parametri di Ricerca](#parametri-di-ricerca-6)
  - [10.1.8. Encounter](#1018-encounter)
    - [Parametri di Ricerca](#parametri-di-ricerca-7)
  - [10.1.9. Immunization (Assistito)](#1019-immunization-assistito)
    - [Parametri di Ricerca](#parametri-di-ricerca-8)
  - [10.1.10. Immunization (Professionista)](#10110-immunization-professionista)
    - [Parametri di Ricerca](#parametri-di-ricerca-9)
  - [10.1.11. AuditEvent](#10111-auditevent)
    - [Parametri di Ricerca](#parametri-di-ricerca-10)
  - [10.1.12. Subscription](#10112-subscription)
    - [Corpo della Richiesta (Request Body)](#corpo-della-richiesta-request-body)
  - [10.1.13. OperationDefinition](#10113-operationdefinition)
    - [10.1.13.1 Ricerca OperationDefinition](#101131-ricerca-operationdefinition)
      - [Parametri di Ricerca](#parametri-di-ricerca-11)
    - [10.1.13.2 Creazione OperationDefinition](#101132-creazione-operationdefinition)
      - [Corpo della Richiesta (Request Body)](#corpo-della-richiesta-request-body-1)
  - [Notes](#notes)

# 1. Introduzione


## 1.1. Riferimenti

   | Rif.                                                                | Documento                       | Descrizione                                                                                                                             |
   | ------------------------------------------------------------------- | ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
   | [1](https://developers.italia.it/it/fse/)                           | Fascicolo Sanitario Elettronico | Un nuovo ecosistema digitale, basato su dati e documenti, per offrire prestazioni di qualità a favore di cittadini e operatori sanitari |
   | [2](https://www.gazzettaufficiale.it/eli/id/2025/03/05/25A01321/SG) | Decreto ministeriale EDS        | Decreto 31 dicembre 2024 — Ecosistema dati sanitari                                                                                     |

   _Tabella 1: Riferimenti Esterni_


## 1.2. Acronimi e Definizioni
   | Acronimo | Descrizione                                                                                                                               |
   | -------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
   | FSE      | Fascicolo Sanitario Elettronico                                                                                                           |
   | GTW      | Gateway                                                                                                                                   |
   | RDE      | Regione di erogazione                                                                                                                     |
   | RDA      | Regione di assistenza                                                                                                                     |
   | API      | Application Programming Interface                                                                                                         |
   | EDS      | Ecosistema dati sanitari                                                                                                                  |
   | FHIR     | FHIR (Fast Healthcare Interoperability Resources) è uno standard sviluppato da [HL7](https://www.hl7.it/) per lo scambio di dati sanitari |
   | UA-R     | Unità di archiviazione dati regionale                                                                                                     |
   | UD-P     | Unità di archiviazione dati pseduonimizzati                                                                                               |
   | FPE      | [Format Preserving Encryption](https://en.wikipedia.org/wiki/Format-preserving_encryption)                                                |

   _Tabella 2: Acronimi e Definizioni_

## 1.3. Registro modifiche
   | Versione | Data       | Descrizione modifiche   |
   | -------- | ---------- | ----------------------- |
   | 1.0      | 2025-07-23 | Creazione del documento |

   _Tabella 3: Registro Modifiche_

   ---

# 2. Contesto di Riferimento
   La nuova architettura del FSE prevede la presenza di un componente dell'EDS, denominato **UA-R**, finalizzata alla gestione dei dati in chiaro degli assistiti, utilizzando il formato FHIR, estratti dai documenti sanitari prodotti dalla Regione/ Provincia Autonoma.
   In questo documento vengono illustrate le modalità per usufruire dei servizi esposti dalla UA-R e i servizi di consultazione (Srv Broker).

   In questa fase le funzionalità principali dell'UA-R sono:
   - Memorizzazione sicura dei dati clinici in formato FHIR
   - Cancellazione dei dati clinici in formato FHIR
   - Sostituzione dei dati clinici in formato FHIR
   - Aggiornamento dei dati clinici in formato FHIR

   | Endpoint URL                            | Metodo | Descrizione                                                                                           |
   | --------------------------------------- | ------ | ----------------------------------------------------------------------------------------------------- |
   | `/v1/document/workflowinstanceid/{wii}` | POST   | Acquisisce un nuovo documento per la memorizzazione di un Bundle di tipo Transaction sul server FHIR. |
   | `/v1/document/workflowinstanceid/{wii}` | PUT    | Acquisisce un documento per sostituirne uno esistente di tipo Transaction sul server FHIR.            |
   | `/v1/document/metadata/`                | PUT    | Acquisisce e aggiorna la risorsa DocumentReference all'interno del Bundle FHIR.                       |
   | `/v1/document/identifier/{identifier}`  | DELETE | Elimina un documento, identificato dall'identificativoDocumento, dal server FHIR.                     |

   _Tabella 4: Endpoint/Funzionalità UA-R_

   **Memorizzazione Bundle FHIR**
   Il flusso di memorizzazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UA-R. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

   **Sostituzione Bundle FHIR**
   Il flusso di sostituzione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UA-R. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla sostituzione del documento stesso in modalità asincrona.

   **Cancellazione Bundle FHIR**
   Il flusso di cancellazione consente la rimozione di un documento pubblicato. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla cancellazione del documento stesso. L’eliminazione delle risorse avviene in modalità sincrona.

   **Aggiornamento Bundle FHIR**
   Questa funzionalità consente di aggiornare i metadati associati a un documento già pubblicato sul FHIR Server, senza modificarne il contenuto clinico. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà all'aggiornamento dei metadati del documento stesso. L’aggiornamento delle risorse avviene in modalità sincrona.

## 2.1. Pattern di Interazione

   Le API sono esposte secondo i pattern definiti nelle Linee Guida Modello di Interoperabilità[^1] definite da Agid.

   Come scenario di interazione per i servizi esposti dal UA-R viene utilizzato il pattern **[BLOCK_REST] Blocking REST**[^2]<sup>.</sup>


## 2.2. Processo di Autenticazione[^3]

   Il processo di autenticazione rispetta i seguenti pattern delle suddette Linee Guida:

   * ID_AUTH_CHANNEL_02 [^4]
   * ID_AUTH_REST_01 [^5]

   Di seguito un diagramma che descrive un esempio di interazione per il servizio di creazione Bundle FHIR:


## 2.3. Note su autenticazione e token JWT

   Per l’interazione con la componente UA-R, il sistema Broker opera come consumer dei servizi esposti, nel rispetto del profilo di interoperabilità **[PROFILE_NON_REPUDIATION_01]**. Tale profilo garantisce:
   * integrità del messaggio;
   * autenticazione del fruitore (organizzazione o unità organizzativa mittente del contenuto);
   * conferma da parte dell’erogatore della ricezione del contenuto;
   * opponibilità ai terzi;
   * robustezza della trasmissione.

   Per tale interazione, è necessario disporre di due certificati X.509 e delle relative chiavi private:

   * Certificato di **autenticazione**: utilizzato esclusivamente come certificato client per le chiamate HTTPS;
   * Certificato di **firma (signature)**: utilizzato esclusivamente per la firma digitale dei token JWT.
   
   Ogni invocazione delle API deve avvenire:
   * tramite **HTTPS** autenticato con il certificato client;
   * includendo negli header **Agid-JWT-Signature**, firmato con il certificato di signature.
      
   Per i dettagli sui campi dei token si consulti l’apposito paragrafo (8.1).

   ---

# 3. Servizio di Memorizzazione Bundle FHIR

   Il flusso di memorizzazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UA-R. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

   ### Endpoint

   ```
   http://<HOST>:<PORT>/v<major>/document/workflowinstanceid/{wii}
   ```

### 3.1. Request

   | METHOD | URL                                     | TYPE             |
   | ------ | --------------------------------------- | ---------------- |
   | POST   | `/v1/document/workflowinstanceid/{wii}` | application/json |

   #### Parametri Path

   | KEY | IN   | TYPE   | REQUIRED |
   | --- | ---- | ------ | -------- |
   | wii | path | string | true     |

   #### Parametri Body

   | KEY        | TYPE   | REQUIRED | DESCRIPTION                                                                                |
   | ---------- | ------ | -------- | ------------------------------------------------------------------------------------------ |
   | identifier | string | true     | Tale campo rappresenta il valore del master identifier del documento oggetto di creazione. |
   | jsonString | string | true     | Tale campo contiene il FHIR Bundle del documento da creare.                                |

   Nel caso di creazione, il campo `identifier` verrà utilizzato per eseguire un'operazione di check-exist preliminare sul server FHIR e garantire l'idempotenza. La compilazione errata dei parametri o la non compilazione dei parametri `required` comporta un errore di tipo bloccante.

   #### Esempio di richiesta

   ```bash
   curl -X 'POST' \
   'http://<HOST>:<PORT>/v1/document/workflowinstanceid/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed' \
   -H 'accept: application/json' \
   -H 'Authorization: Bearer <JWT_TOKEN>' \
   -H 'Agid-JWT-Signature: <JWT_SIGNATURE>' \
   -H 'Content-Type: application/json' \
   -d '{
      "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
      "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}"
   }'
   ```

   ---

## 3.2. Response

   | STATUS | SIGNIFICATO               | TIPO                     |
   | ------ | ------------------------- | ------------------------ |
   | 201    | Documento preso in carico | application/json         |
   | 500    | Errore interno del server | application/problem+json |

   #### Esempio risposta 201

   ```json
   {
   "traceID": "c2e1818fbf7aea7f",
   "spanID": "c2e1818fbf7aea7f",
   "result": true
   }
   ```

   #### Messaggio di Risposta con esito KO 

   ``` json
   {
   "traceID": "61d8123fb20e2afc",
   "spanID": "61d8123fb20e2afc",
   "type": "/err/server",
   "title": "Server error",
   "detail": "An unexpected error occurred on the server",
   "status": 500,
   "instance": "/err/server"
   }
   ```

# 4. Servizio di Eliminazione Bundle FHIR

   Il flusso di cancellazione consente la rimozione di un Bundle FHIR pubblicato. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del Bundle sul server FHIR e successivamente si procederà alla cancellazione del Bundle FHIR stesso.
   L’eliminazione delle risorse avviene in modalità sincrona.

   ### Endpoint

   ```
   http://<HOST>:<PORT>/v<major>/document/identifier/{identifier}
   ```

## 4.1. Request

   | METHOD | URL                                    | TYPE             |
   | ------ | -------------------------------------- | ---------------- |
   | DELETE | `/v1/document/identifier/{identifier}` | application/json |

   #### Parametri Path

   | KEY        | IN   | TYPE   | REQUIRED | DESCRIPTION                                                                                    |
   | ---------- | ---- | ------ | -------- | ---------------------------------------------------------------------------------------------- |
   | identifier | path | string | true     | Tale campo rappresenta il valore del master identifier del documento oggetto di cancellazione. |


   Nel caso di cancellazione, il campo identifier verrà utilizzato per eseguire un'operazione di check-exist preliminare sul server fhir e in caso di assenza dello stesso verrà sollevata un'eccezione di documento non trovato.
   La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

   #### Esempio di richiesta

   ```bash
   curl -X 'DELETE' \
   'http://<HOST>:<PORT>/v1/document/identifier/2.16.840.1.113883.2.9.2.120.4.4^290700' \
   -H 'accept: application/json' \
   -H 'Authorization: Bearer <JWT_TOKEN>' \
   -H 'Agid-JWT-Signature: <JWT_SIGNATURE>'
   ```

   ---

## 4.2. Response

   | STATUS | SIGNIFICATO                      | TIPO                     |
   | ------ | -------------------------------- | ------------------------ |
   | 200    | Documento eliminato con successo | application/json         |
   | 404    | Documento non trovato            | application/problem+json |
   | 500    | Errore interno del server        | application/problem+json |

   #### Esempio risposta 200

   ```json
   {
   "traceID": "c2e1818fbf7aea7f",
   "spanID": "c2e1818fbf7aea7f",
   "result": true
   }
   ```

   #### Esempio di Messaggio di Risposta con esito KO

   ``` json
   {
   "traceID": "61d8123fb20e2afc",
   "spanID": "61d8123fb20e2afc",
   "type": "/err/server",
   "title": "Server error",
   "detail": "An unexpected error occurred on the server",
   "status": 500,
   "instance": "/err/server"
   }
   ```

# 5. Servizio di Sostituzione Bundle FHIR

   Il flusso di sostituzione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del Bundle sul server FHIR e successivamente si procederà alla sostituzione del Bundle FHIR stesso in modalità asincrona.

   ### Endpoint

   ```
   http://<HOST>:<PORT>/v<major>/document/workflowinstanceid/{wii}
   ```

## 5.1. Request

   | METHOD | URL                                     | TYPE             |
   | ------ | --------------------------------------- | ---------------- |
   | PUT    | `/v1/document/workflowinstanceid/{wii}` | application/json |

   #### Parametri Path

   | KEY | IN   | TYPE   | REQUIRED |
   | --- | ---- | ------ | -------- |
   | wii | path | string | true     |

   #### Parametri Body

   | KEY        | TYPE   | REQUIRED | DESCRIPTION                                                                                                                                                                                                  |
   | ---------- | ------ | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
   | identifier | string | true     | Tale campo rappresenta il valore del master identifier del documento oggetto di sostituzione.                                                                                                                |
   | jsonString | string | true     | Tale campo contiene il FHIR Bundle del nuovo documento. È importante notare che il nuovo id documento deve essere presente nel campo masterIdentifier della risorsa DocumentReference del nuovo FHIR Bundle. |

   Nel caso di sostituzione, il campo identifier verrà utilizzato per eseguire un'operazione di check-exist preliminare sul server fhir del documento che si intende sostituire e in caso di assenza dello stesso verrà sollevata un'eccezione di documento non trovato.
   La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

   #### Esempio di richiesta

   ```bash
   curl -X 'PUT' \
   'http://<HOST>:<PORT>/v1/document/workflowinstanceid/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed' \
   -H 'accept: application/json' \
   -H 'Authorization: Bearer <JWT_TOKEN>' \
   -H 'Agid-JWT-Signature: <JWT_SIGNATURE>' \
   -H 'Content-Type: application/json' \
   -d '{
      "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
      "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}",
   }'
   ```

   ---

## 5.2. Response

   | STATUS | SIGNIFICATO                       | TIPO                     |
   | ------ | --------------------------------- | ------------------------ |
   | 200    | Documento sostituito con successo | application/json         |
   | 404    | Documento non trovato             | application/problem+json |
   | 500    | Errore interno del server         | application/problem+json |

   #### Esempio risposta 200

   ```json
   {
   "traceID": "c2e1818fbf7aea7f",
   "spanID": "c2e1818fbf7aea7f",
   "result": true
   }
   ```

   #### Esempio di Messaggio di Risposta con esito KO

   ``` json
   {
   "traceID": "61d8123fb20e2afc",
   "spanID": "61d8123fb20e2afc",
   "type": "/err/server",
   "title": "Server error",
   "detail": "An unexpected error occurred on the server",
   "status": 500,
   "instance": "/err/server"
   }
   ```

# 6. Servizio di Aggiornamento Metadati

   Questa funzionalità consente di aggiornare i metadati associati a un Bundle FHIR già pubblicato sul FHIR Server, senza modificarne il contenuto clinico. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del Bundle sul server FHIR e successivamente si procederà all'aggiornamento dei metadati del Bundle FHIR stesso.
   L’aggiornamento delle risorse avviene in modalità sincrona.

   ### Endpoint

   ```
   http://<HOST>:<PORT>/v<major>/document/metadata
   ```

## 6.1. Request

   | METHOD | URL                     | TYPE             |
   | ------ | ----------------------- | ---------------- |
   | PUT    | `/v1/document/metadata` | application/json |


   #### Parametri Body

   | KEY        | TYPE   | REQUIRED |
   | ---------- | ------ | -------- |
   | identifier | string | true     |
   | jsonString | string | true     |

   #### Esempio di richiesta

   ```bash
   curl -X 'PUT' \
   'http://<HOST>:<PORT>/v1/document/metadata' \
   -H 'accept: application/json' \
   -H 'Authorization: Bearer <JWT_TOKEN>' \
   -H 'Agid-JWT-Signature: <JWT_SIGNATURE>' \
   -H 'Content-Type: application/json' \
   -d '{
      "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
      "jsonString": "{ 
         \"body\": {
         \"tipologiaStruttura\": \"Prevenzione\",
         \"attiCliniciRegoleAccesso\": [\"PUBLICPOL\"],
         \"tipoDocumentoLivAlto\": \"PRS\",
         \"assettoOrganizzativo\": \"AD_PSC021\",
         \"dataInizioPrestazione\": \"20241020110012\",
         \"dataFinePrestazione\": \"20241020110012\",
         \"conservazioneANorma\": \"CONS^^^&2.16.840.1.113883.2.9.3.3.6.1.7&ISO\",
         \"tipoAttivitaClinica\": \"ERP\",
         \"identificativoSottomissione\": \"2.16.840.1.113883.2.9.2.110.4.3.X\"
         }
      }"
   }'

   ```

   ---

## 6.2. Response

   | STATUS | SIGNIFICATO                      | TIPO                     |
   | ------ | -------------------------------- | ------------------------ |
   | 200    | Metadati aggiornati con successo | application/json         |
   | 404    | Documento non trovato            | application/problem+json |
   | 500    | Errore interno del server        | application/problem+json |

   #### Esempio risposta 200

   ```json
   {
   "traceID": "c2e1818fbf7aea7f",
   "spanID": "c2e1818fbf7aea7f",
   "result": true
   }
   ```
   #### Esempio di Messaggio di Risposta con esito KO

   ``` json
   {
   "traceID": "61d8123fb20e2afc",
   "spanID": "61d8123fb20e2afc",
   "type": "/err/server",
   "title": "Server error",
   "detail": "An unexpected error occurred on the server",
   "status": 500,
   "instance": "/err/server"
   }
   ```

   # 7. Drilldown Response in caso di Errore

## 7.1. Errori Applicativi

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
      <td>URI opzionale che identifica la specifica occorrenza del problema. Può differire dal type in caso sia necessario specificare il problema con maggiore dettaglio
      </td>
   </tr>
   </table>


   _Tabella 37: Campi Response valorizzati in caso di errore_


   ### 7.1.1. Esempi di errore generati da UA-R


   <table>
   <tr>
      <td><strong>TYPE</strong></td>
      <td><strong>TITLE</strong></td>
      <td><strong>DETAIL</strong></td>
      <td><strong>STATUS</strong></td>
      <td><strong>INSTANCE</strong></td>
   </tr>
   <tr>
      <td>/err/resource</td>
      <td>Resource error</td>
      <td>The requested resource could not be found or accessed</td>
      <td>404</td>
      <td>/err/resource</td>
   </tr>
   <tr>
      <td>/err/client</td>
      <td>Client error</td>
      <td>Request contains invalid syntax or cannot be fulfilled</td>
      <td>400</td>
      <td>/err/client</td>
   </tr>
   <tr>
      <td>/err/server</td>
      <td>Server error</td>
      <td>An unexpected error occurred on the server</td>
      <td>500</td>
      <td>/err/server</td>
   </tr>
   </table>


   # 8. Drilldown parametri di input

## 8.1. Campi Contenuti nei JWT

   * **Agid-JWT-Signature**: token JWT contenente custom claims necessari ai fini applicativi

   <table border="1" cellspacing="0" cellpadding="6" style="border-collapse:collapse; width:100%;">
      <tr>
         <td colspan="2" style="text-align:center; background-color:#d9edf7;"><strong>HEADER</strong></td>
      </tr>

      <!-- ALG -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>ALG</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Algoritmo utilizzato per la firma del token. Valori ammessi: RS256, RS384, RS512.</td>
      </tr>
      <tr>
         <td><strong>ESEMPIO</strong></td>
         <td>RS256</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>alg</code></td>
      </tr>

      <!-- TYPE -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>TYPE</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Tipologia di token. DEVE essere valorizzato con il valore 'JWT'.</td>
      </tr>
      <tr>
         <td><strong>VALORE</strong></td>
         <td>JWT</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>typ</code></td>
      </tr>

      <!-- X5C -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>X5C</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Certificato X.509 utilizzato per la firma del token. Valore in formato DER, codificato in base64.</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>x5c</code></td>
      </tr>
   </table>

   <br>

   <table border="1" cellspacing="0" cellpadding="6" style="border-collapse:collapse; width:100%;">
      <tr>
         <td colspan="2" style="text-align:center; background-color:#dff0d8; border-top:3px solid black;"><strong>BODY</strong></td>
      </tr>

      <!-- ISS -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>ISSUER</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Stringa che contiene il nome identificativo dell’entità che ha generato il token. Valorizzato con “integrity:” seguito dal “Common Name del certificato di firma”.</td>
      </tr>
      <tr>
         <td><strong>ESEMPIO</strong></td>
         <td>integrity:190201123456XX</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>iss</code></td>
      </tr>

      <!-- JTI -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>JWT ID</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Identificativo univoco del token, serve per prevenire la generazione accidentale di token uguali.</td>
      </tr>
      <tr>
         <td><strong>ESEMPIO</strong></td>
         <td>0a12b3cd-45e6-789f-0123-456789abcdef</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>jti</code></td>
      </tr>

      <!-- AUD -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>AUDIENCE</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Indica il destinatario per cui è stato creato il token, da valorizzare con la base URL del servizio.</td>
      </tr>
      <tr>
         <td><strong>ESEMPIO</strong></td>
         <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/uar/v1</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>aud</code></td>
      </tr>

      <!-- IAT -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>ISSUED AT</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Numero intero (timestamp in secondi) che indica il momento in cui il token è stato generato.</td>
      </tr>
      <tr>
         <td><strong>ESEMPIO</strong></td>
         <td>1740307200</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>iat</code></td>
      </tr>

      <!-- EXP -->
      <tr>
         <td colspan="2" style="text-align:center"><strong>EXPIRATION</strong></td>
      </tr>
      <tr>
         <td><strong>DESCRIZIONE</strong></td>
         <td>Numero intero (timestamp in secondi) che indica fino a quando il token sarà valido.</td>
      </tr>
      <tr>
         <td><strong>ESEMPIO</strong></td>
         <td>1740310800</td>
      </tr>
      <tr>
         <td><strong>VALIDAZIONE</strong></td>
         <td>Obbligatorio</td>
      </tr>
      <tr>
         <td><strong>CAMPO JWT</strong></td>
         <td><code>exp</code></td>
      </tr>
   
   </table>



   **Custom Claims**

   I campi personalizzati verranno definiti e aggiunti in una fase successiva.

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

## 8.2 Campi Contenuti nella Request Body

   ### Parametri obbligatori

   | PARAMETRO                                                                                                                                                           | TIPO   | OBBLIGATORIO | DESCRIZIONE                                                                                                               |
   | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | ------------ | ------------------------------------------------------------------------------------------------------------------------- |
   | `identifier`                                                                                                                                                        | string | Sì           | Valore del master identifier del documento da sostituire.                                                                 |
   | `jsonString`                                                                                                                                                        | string | Sì           | Per le operazioni di creazione e sostituzione il contenuto di tale campo coincide con il Bundle FHIR del nuovo documento. |
   | Per l'oprazione di aggiornamento tale campo coincide con il valore della request body come mostrato nel paragrafo 6 di aggiornamento metadati serializzata in json. |

## 8.3. Campi contenuti nel Path

   | PARAMETRO            | TIPO   | DESCRIZIONE                                       |
   | -------------------- | ------ | ------------------------------------------------- |
   | `workflowInstanceId` | string | Identificativo operazione restituito dal Gateway. |
   
   # 9.  Politiche di Accesso e Matrice dei Ruoli Utente
   Questo capitolo definisce le politiche di accesso ai documenti clinici del Fascicolo Sanitario Elettronico (FSE) in base ai ruoli degli operatori sanitari e delle altre figure coinvolte nel sistema.
   
## 9.1. Matrice di Accesso per Tipologia Documentale
   
   | Tipologia Documento                                   | Codice   | Medico | Infermiere e Ostetrica | Farmacista |
   | ----------------------------------------------------- | -------- | ------ | ---------------------- | ---------- |
   | Referto di laboratorio                                | 11502-2  | ✓      | ✓                      | ✗          |
   | Referto di radiologia                                 | 68604-8  | ✓      | ✓                      | ✗          |
   | Referto di specialistica ambulatoriale                | 11488-4  | ✓      | ✓                      | ✗          |
   | Referto di anatomia patologica                        | 11526-1  | ✓      | ✗                      | ✗          |
   | Verbale di pronto soccorso                            | 59258-4  | ✓      | ✓                      | ✗          |
   | Lettera di dimissione                                 | 34105-7  | ✓      | ✓                      | ✗          |
   | Profilo sanitario sintetico                           | 60591-5  | ✓      | ✓                      | ✗          |
   | Prescrizione farmaceutica                             | 57833-6  | ✓      | ✗                      | ✓          |
   | Prescrizione specialistica                            | 57832-8  | ✓      | ✓                      | ✗          |
   | Cartella clinica                                      | 100971-1 | ✓      | ✓                      | ✗          |
   | Erogazione farmaci a carico SSN e non a carico SSN    | 60593-1  | ✓      | ✓                      | ✓          |
   | Scheda singola vaccinazione                           | 87273-9  | ✓      | ✓                      | ✗          |
   | Certificato vaccinale                                 | 82593-5  | ✓      | ✓                      | ✗          |
   | Erogazione di prestazioni di assistenza specialistica | 81223-0  | ✓      | ✓                      | ✗          |
   | Tessera portatore di impianto                         | 101881-1 | ✓      | ✗                      | ✗          |
   | Lettera di invito per screening                       | 108278-7 | ✓      | ✓                      | ✗          |

## 9.2. Ruoli e Categorie Professionali
   **Categoria Medici**:

   I seguenti ruoli appartengono alla categoria medica e hanno accesso ai documenti contrassegnati come accessibili al Medico:
   - APR - Medico Medicina Generale / Pediatra di Libera Scelta
   - DRS - Dirigente sanitario
   - RSA - Medico RSA
   - MRP - Medico Rete di Patologia

   **Categoria Infermieri**:

   I seguenti ruoli appartengono alla categoria infermieristica e hanno accesso ai documenti contrassegnati come accessibili a Infermiere / Ostetrica:
   - INF - Personale infermieristico

   **Categoria Farmacisti**:

   I seguenti ruoli appartengono alla categoria farmaceutica e hanno accesso ai documenti contrassegnati come accessibili a Farmacista:
   - FAR - Farmacista

   **Categoria Assistiti**:

   I seguenti ruoli appartengono alla categoria degli assistiti e hanno accesso completo al proprio FSE:
   - ASS - Assistito
   - TUT - Tutore
   - ING - Informal giver (Delegato volontario)
   - GEN - Genitore


   # 10. Servizi di Consultazione FHIR
   Questa sezione descrive gli endpoint esposti dalla UAR per le operazioni di consultazione dei dati clinici, basate sullo standard FHIR, e per i servizi correlati.
   Tutti gli endpoint richiedono l'autenticazione tramite bearerAuth (JWT Token) e l'header di firma Agid-JWT-Signature, come dettagliato nel Paragrafo 2.3.

## 10.1. Consultazione Dati Clinici
   I seguenti endpoint consentono la ricerca (search-type) di risorse FHIR specifiche relative ai dati clinici di un assistito.

## 10.1.1. Condition
   Consente la ricerca di istanze della risorsa **Condition** (problemi clinici, diagnosi) associate a un paziente. L'operazione esegue una ricerca FHIR per recuperare le condizioni registrate, utilizzando parametri di ricerca standard.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/Condition
   ```

   ### Parametri di Ricerca

   Di seguito sono elencati tutti i parametri di ricerca supportati dall'endpoint, con l'indicazione se sono obbligatori (true) o opzionali (false).

   | PARAMETRO           | DESCRIZIONE                               | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD        |
   | ------------------- | ----------------------------------------- | ------------ | --------------- | ------------------------------ |
   | patient.identifier  | Identificativo del paziente.              | true         | string          | Dinamico                       |
   | _sort               | Criteri di ordinamento per i risultati.   | true         | string          | -onset-date oppure onset-date. |
   | code                | Codice della condizione in formato system | true         | string          | [SystemCode]\|[Code]           |
   | _revInclude         | Risorse da includere nella risposta.      | true         | string          | Composition:entry              |
   | _revInclude:iterate | Risorse correlate su cui iterare.         | true         | string          | DocumentReference:related      |
   | onset-date          | Lista di date nel formato `YYYY-MM-DD`.   | false        | array of string | Dinamico                       |
   | _count              | Numero di risultati per pagina.           | false        | integer         | 10                             |
   | _offset             | Offset dei risultati impaginati.          | false        | integer         | Dinamico                       |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)       | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | ----------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.6.103 | ICD-9-CM                        | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint Condition.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/Condition?patient.identifier=FISCAL_CODE&_sort=onset-date&code=CODE&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.2. AllergyIntolerance

   Consente la ricerca di istanze della risorsa **AllergyIntolerance** (allergie e intolleranze) associate a un paziente.  
   L'operazione esegue una ricerca FHIR per recuperare allergie o intolleranze note registrate per un assistito, come farmaci, alimenti o sostanze ambientali.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/AllergyIntolerance
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                   | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | --------------------------------------------- | ------------ | --------------- | ------------------------- |
   | code                | Codice dell’allergia/intolleranza.            | true         | string          | [SystemCode]\|[Code]      |
   | patient.identifier  | Identificativo del paziente.                  | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati.       | true         | string          | -date o date              |
   | _revInclude         | Risorse da includere nella risposta.          | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare.             | true         | string          | DocumentReference:related |
   | date                | Lista di date nel formato `YYYY-MM-DD`.       | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina. | false        | integer         | 10                        |
   | _offset             | Offset per i risultati impaginati.            | false        | integer         | Dinamico                  |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)           | DOMINIO IDENTIFICATIVO CONCETTO              | VALORE   |
   | --------------------------- | -------------------------------------------- | -------- |
   | 2.16.840.1.113883.6.73      | WHO ATC                                      | Dinamico |
   | 2.16.840.1.113883.2.9.6.1.5 | AIC (Autorizzazione Immissione in Commercio) | Dinamico |
   | 2.16.840.1.113883.11.22.9   | IPSNoAllergiesInfo (allergie non farmaci)    | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint AllergyIntolerance.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/AllergyIntolerance?patient.identifier=FISCAL_CODE&_sort=date&code=ALG001&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.3. MedicationStatement

   Consente la ricerca di istanze della risorsa **MedicationStatement** (dichiarazioni sull'uso di farmaci) per un paziente.  
   L’operazione esegue una ricerca FHIR per recuperare informazioni sui farmaci assunti o dichiarati, incluse prescrizioni, uso auto-riferito e aderenza terapeutica.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/MedicationStatement
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                  | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | -------------------------------------------- | ------------ | --------------- | ------------------------- |
   | code                | Codice del farmaco (medication code).        | true         | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente.                 | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati.      | true         | string          | -effective o effective    |
   | _revInclude         | Risorse da includere nella risposta.         | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare             | true         | string          | DocumentReference:related |
   | effective           | Lista di date nel formato `YYYY-MM-DD`.      | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina | false        | integer         | 10                        |
   | _offset             | Offset dei risultati impaginati (1–100).     | false        | integer         | Dinamico                  |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)            | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | ---------------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.6.73       | ATC                             | Dinamico |
   | 2.16.840.1.113883.2.9.6.1.5  | AIC                             | Dinamico |
   | 2.16.840.1.113883.2.9.6.1.51 | GE                              | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint MedicationStatement.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/MedicationStatement?patient.identifier=FISCAL_CODE&_sort=date&code=CODE&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.4. MedicationDispense

   Consente la ricerca di istanze della risorsa **MedicationDispense** (farmaci dispensati) per un paziente.  
   L’operazione esegue una ricerca FHIR per recuperare informazioni sui farmaci dispensati, supportando attività di tracciamento e riconciliazione terapeutica.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/MedicationDispense
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                  | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | -------------------------------------------- | ------------ | --------------- | ------------------------- |
   | code                | Codice del farmaco dispensato                | true         | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente                  | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati       | true         | string          | whenhandedover            |
   | _revInclude         | Risorse da includere nella risposta          | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare             | true         | string          | DocumentReference:related |
   | whenhandedover      | Lista di date nel formato `YYYY-MM-DD`       | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina | false        | integer         | 10                        |
   | _offset             | Offset dei risultati impaginati (1–100)      | false        | integer         | Dinamico                  |


   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)           | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | --------------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.2.9.6.1.5 | AIC                             | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint MedicationDispense.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/MedicationDispense?patient.identifier=FISCAL_CODE&_sort=date&code=CODE&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.5. Observation

   Consente la ricerca di istanze della risorsa **Observation** (misurazioni cliniche, esami, segni vitali) per un paziente.  
   L’operazione esegue una ricerca FHIR per recuperare osservazioni cliniche rilevanti, supportando attività di monitoraggio e decisione clinica.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/Observation
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                                    | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | -------------------------------------------------------------- | ------------ | --------------- | ------------------------- |
   | code                | Codice dell’osservazione (laboratorio, parametro vitale, ecc.) | true         | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente                                    | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati                         | true         | string          | -date o date              |
   | _revInclude         | Risorse da includere nella risposta                            | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare                               | true         | string          | DocumentReference:related |
   | date                | Lista di date nel formato `YYYY-MM-DD`                         | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina                   | false        | integer         | 10                        |
   | _offset             | Offset dei risultati impaginati (1–100)                        | false        | integer         | Dinamico                  |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)       | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | ----------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.6.1   | LOINC                           | Dinamico |
   | 2.16.840.1.113883.6.103 | ICD-9-CM                        | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint Observation.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/Observation?patient.identifier=FISCAL_CODE&_sort=date&code=CODE&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.6. Procedure

   Consente la ricerca di istanze della risorsa **Procedure** (procedure cliniche o interventi) per un paziente.  
   L’operazione esegue una ricerca FHIR per recuperare procedure cliniche o interventi registrati, supportando la documentazione clinica e il monitoraggio del paziente.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/Procedure
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                  | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | -------------------------------------------- | ------------ | --------------- | ------------------------- |
   | code                | Codice della procedura clinica/intervento    | true         | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente                  | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati       | true         | string          | -date o date              |
   | _revInclude         | Risorse da includere nella risposta          | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare             | true         | string          | DocumentReference:related |
   | date                | Lista di date nel formato `YYYY-MM-DD`       | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina | false        | integer         | 10                        |
   | _offset             | Offset dei risultati impaginati (1–100)      | false        | integer         | Dinamico                  |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)       | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | ----------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.6.104 | ICD-9-CM                        | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint Procedure.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/Procedure?patient.identifier=FISCAL_CODE&_sort=date&code=CODE&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.7. DiagnosticReport

   Consente la ricerca di istanze della risorsa **DiagnosticReport** (referti diagnostici) per un paziente.  
   L’operazione esegue una ricerca FHIR per recuperare risultati e interpretazioni di test diagnostici, come esami di laboratorio o referti di imaging, supportando la documentazione clinica e il monitoraggio del paziente.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/DiagnosticReport
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                  | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | -------------------------------------------- | ------------ | --------------- | ------------------------- |
   | code                | Codice del referto diagnostico.              | true         | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente.                 | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati.      | true         | string          | -date o date              |
   | _revInclude         | Risorse da includere nella risposta.         | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare             | true         | string          | DocumentReference:related |
   | date                | Lista di date nel formato `YYYY-MM-DD`.      | true         | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina | false        | integer         | 10                        |
   | _offset             | Offset dei risultati impaginati (1–100).     | false        | integer         | Dinamico                  |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)     | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | --------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.6.1 | LOINC                           | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint DiagnosticReport.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/DiagnosticReport?patient.identifier=FISCAL_CODE&_sort=date&code=CODE&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" 
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.8. Encounter

   Consente la ricerca di istanze della risorsa **Encounter** (interazioni con operatori sanitari) per un paziente.  
   L’operazione esegue una ricerca FHIR per recuperare incontri clinici, come visite ospedaliere, consulti o altri eventi di cura.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/Encounter
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                                | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | ---------------------------------------------------------- | ------------ | --------------- | ------------------------- |
   | type                | Tipo di incontro clinico (es: visita, consulto, ricovero). | true         | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente.                               | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati.                    | true         | string          | -date o date              |
   | _revInclude         | Risorse da includere nella risposta.                       | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare.                          | true         | string          | DocumentReference:related |
   | _include            | Risorse aggiuntive da includere nella risposta.            | false        | string          | Dinamico                  |
   | date                | Lista di date nel formato `YYYY-MM-DD` (max 2 valori).     | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina (1–10).       | false        | integer         | 10                        |
   | _offset             | Offset dei risultati impaginati (1–100).                   | false        | integer         | Dinamico                  |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)     | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | --------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.6.1 | LOINC                           | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint Encounter.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/Encounter?patient.identifier=FISCAL_CODE&_sort=date&type=INP&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.9. Immunization (Assistito)

   Consente la ricerca di istanze della risorsa **Immunization** (vaccinazioni) per un paziente, nell'ambito della consultazione da parte dell'Assistito.  
   L’operazione esegue una ricerca FHIR per recuperare le vaccinazioni somministrate, supportando il tracciamento della storia vaccinale e della copertura immunitaria.

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-clinici/Immunization
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                  | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD   |
   | ------------------- | -------------------------------------------- | ------------ | --------------- | ------------------------- |
   | vaccine-code        | Codice del vaccino somministrato.            | false        | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente.                 | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati.      | true         | string          | -date o date              |
   | _revInclude         | Risorse da includere nella risposta.         | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare             | true         | string          | DocumentReference:related |
   | date                | Lista di date nel formato `YYYY-MM-DD`.      | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina | false        | integer         | 10                        |
   | _offset             | Offset per i risultati impaginati (1–100).   | false        | integer         | Dinamico                  |
   
   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)           | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | --------------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.2.9.6.1.5 | AIC                             | Dinamico |
   | 2.16.840.1.113883.6.73      | ATC                             | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint Immunization(Assistito).

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-clinici/Immunization?patient.identifier=FISCAL_CODE&_sort=date&vaccine-code=VAX001&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"

   ```

## 10.1.10. Immunization (Professionista)

   Consente la ricerca di istanze della risorsa **Immunization** (vaccinazioni) per un paziente, nell'ambito della consultazione da parte del Professionista Sanitario.  
   L’operazione esegue una ricerca FHIR per recuperare le vaccinazioni somministrate, supportando il tracciamento della storia vaccinale e della copertura immunitaria.

   ```
   Endpoint: GET BASE_PATH/v1/professionista-consultazione-dati-vaccinazioni/Immunization
   ```

   ### Parametri di Ricerca

   | PARAMETRO           | DESCRIZIONE                                    | OBBLIGATORIO | TIPO            | VALORI STANDARD           |
   | ------------------- | ---------------------------------------------- | ------------ | --------------- | ------------------------- |
   | vaccine-code        | Codice del vaccino somministrato               | false        | string          | [SystemCode][Code]        |
   | patient.identifier  | Identificativo del paziente                    | true         | string          | Dinamico                  |
   | _sort               | Criteri di ordinamento per i risultati         | true         | string          | -date o date              |
   | _revInclude         | Risorse da includere nella risposta            | true         | string          | Composition:entry         |
   | _revInclude:iterate | Risorse correlate su cui iterare               | true         | string          | DocumentReference:related |
   | date                | Lista di date nel formato `YYYY-MM-DD`         | false        | array of string | Dinamico                  |
   | _count              | Numero di risultati da restituire per pagina   | false        | integer         | 10                        |
   | _offset             | Offset per i risultati impaginati (1–100)      | false        | integer         | Dinamico                  |
   | _include            | Risorse aggiuntive da includere nella risposta | false        | string          | Dinamico                  |

   SystemCode ammessi per il parametro code

   | SYSTEM CODE (OID)           | DOMINIO IDENTIFICATIVO CONCETTO | VALORE   |
   | --------------------------- | ------------------------------- | -------- |
   | 2.16.840.1.113883.2.9.6.1.5 | AIC                             | Dinamico |
   | 2.16.840.1.113883.6.73      | ATC                             | Dinamico |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint Immunization(Professionista).

   ```bash
   curl -X GET "BASE_PATH/v1/professionista-consultazione-dati-vaccinazioni/Immunization?patient.identifier=FISCAL_CODE&_sort=date&vaccine-code=VAX001&_revInclude=Composition:entry&_revInclude:iterate=DocumentReference:related" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.11. AuditEvent

   Consente la ricerca di istanze della risorsa **AuditEvent** (eventi di sicurezza/accesso ai dati) per un paziente.  
   L’operazione esegue una ricerca FHIR per recuperare eventi rilevanti per la sicurezza, come accessi, creazioni, modifiche o trasmissioni di dati nel sistema.

   **Nota sui Parametri di Ricerca:** oltre ai parametri obbligatori, sono previsti parametri specifici per la risorsa (es. `entity`, `date`) e parametri di paginazione (`_count`, `_offset`).

   ```
   Endpoint: GET BASE_PATH/v1/assistito-consultazione-dati-accesso/AuditEvent
   ```

   ### Parametri di Ricerca

   | PARAMETRO          | IN    | DESCRIZIONE                                  | OBBLIGATORIO | TIPO            | VALORI AMMESSI STANDARD                      |
   | ------------------ | ----- | -------------------------------------------- | ------------ | --------------- | -------------------------------------------- |
   | entity             | query | Tipo di entità coinvolta nell’evento         | true         | string          | Dinamico (es: utente, sistema, applicazione) |
   | patient.identifier | query | Identificativo del paziente.                 | true         | string          | Dinamico                                     |
   | _sort              | query | Criteri di ordinamento per i risultati.      | true         | string          | -date o date                                 |
   | date               | query | Lista di date nel formato `YYYY-MM-DD`.      | false        | array of string | Dinamico                                     |
   | _count             | query | Numero di risultati da restituire per pagina | false        | integer         | 10                                           |
   | _offset            | query | Offset per i risultati impaginati.           | false        | integer         | Dinamico                                     |

   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint AuditEvent.

   ```bash
   curl -X GET "BASE_PATH/v1/assistito-consultazione-dati-accesso/AuditEvent?patient.identifier=FISCAL_CODE&_sort=date&entity=USER" \
      -H "Authorization: Bearer <token_JWT>" \
      -H "Agid-JWT-Signature: <token_firmato>" \
      -H "Accept: application/json"
   ```

## 10.1.12. Subscription

   Consente la creazione di una nuova risorsa **Subscription** FHIR (sottoscrizione). L'operazione registra un canale di notifica che permette al sistema di inviare avvisi relativi a una condizione specifica.

   ```
   Endpoint: POST BASE_PATH/v1/assistito-servizio-notifiche/Subscription
   ```

   ### Corpo della Richiesta (Request Body)
   | Campo    | Tipo   | Descrizione                                                                                   | Obbligatorio | Vincoli                                                                                                                                                                                          |
   | -------- | ------ | --------------------------------------------------------------------------------------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
   | channel  | object | Riferimento allo schema *Channel*, definisce il canale tramite cui verrà inviata la notifica. | Sì           | —                                                                                                                                                                                                |
   | status   | string | Stato della Subscription.                                                                     | Sì           | Valori ammessi: `active`, `off`.                                                                                                                                                                 |
   | reason   | string | Descrizione testuale che spiega il motivo della Subscription.                                 | Sì           | - Notifica AuditEvent al cittadino tramite canale 01 - PUSH<br>- Notifica AuditEvent al cittadino tramite canale 02 - MAIL<br>- Notifica AuditEvent al cittadino tramite canale 03 - PUSH + MAIL |
   | criteria | string | Query FHIR che definisce le condizioni che attivano l’invio di una notifica.                  | Sì           | —                                                                                                                                                                                                |

   Di seguito si riporta il dettaglio dell'oggetto Channel

   | Campo    | Tipo   | Descrizione                                                    | Obbligatorio | Vincoli                             |
   | -------- | ------ | -------------------------------------------------------------- | ------------ | ----------------------------------- |
   | type     | string | Il valore deve essere impostato su: `rest-hook`.               | Sì           | Pattern: `^rest-hook$`              |
   | endpoint | string | URL HTTP/HTTPS dell’endpoint su cui inviare le notifiche.      | Sì           |                                     |
   | payload  | string | Valore opzionale che indica il tipo di payload della notifica. | No           | Pattern: `^application/fhir\+json$` |


   Di seguito è riportato un esempio generico di richiesta `curl` per l'endpoint Subscription.

   ```bash  
curl -X POST "BASE_PATH/v1/assistito-servizio-notifiche/Subscription" \
   -H "Authorization: Bearer <token_JWT>" \
   -H "Agid-JWT-Signature: <token_firmato>" \
   -H "Content-Type: application/json" \
   -d '{
    "status": "active",
    "reason": "Notifica AuditEvent al cittadino tramite canale 03 - PUSH + MAIL",
    "criteria": "AuditEvent?patient.identifier=CODICEFISCALE&type=ACCESS",
    "channel": {
        "type": "rest-hook",
        "endpoint": "https://api.provider.it/notifications/fse_callback",
        "payload": "application/fhir+json"
    }
   }'
   ```

## 10.1.13. OperationDefinition
   Il servizio mette a disposizione due endpoint dedicati alla gestione delle risorse FHIR OperationDefinition, utilizzate per definire operazioni personalizzate 
   collegate ai processi di consultazione.
   Gli endpoint permettono di:
   ricercare OperationDefinition già presenti (GET)
   crearne delle nuove (POST)

### 10.1.13.1 Ricerca OperationDefinition
   Questa operazione consente di effettuare una ricerca delle risorse OperationDefinition filtrandole tramite parametro publisher.

   ```
   Endpoint: GET /v1/assistito-consultazione-cerca-pacchetto/OperationDefinition
   ```

   #### Parametri di Ricerca
   | Nome      | Tipo   | Descrizione                                             | Obbligatorio | Vincoli |
   | --------- | ------ | ------------------------------------------------------- | ------------ | ------- |
   | publisher | string | Nome del publisher da utilizzare come filtro di ricerca | Sì           | Nessuno |

### 10.1.13.2 Creazione OperationDefinition
   Questa operazione permette la creazione di una nuova risorsa FHIR OperationDefinition.
   L'oggetto registrato può rappresentare, ad esempio, un’operazione personalizzata collegata a un evento clinico.

   ```
   Endpoint: POST /v1/assistito-consultazione-cerca-pacchetto/OperationDefinition
   ```

   #### Corpo della Richiesta (Request Body)
   | Campo                     | Tipo   | Descrizione                                                | Obbligatorio | Vincoli                     |
   |---------------------------|--------|----------------------------------------------------------- |--------------|------------------------------|
   | $nome-operation-definition | string | Nome dell’OperationDefinition da creare o invocare.       | Sì           | Non vuoto                    |
   | observation-code          | string | Codice dell’osservazione clinica oggetto dell’operazione.  | Sì           | Codice FHIR validato         |
   | _type                     | string | Tipo di risorsa FHIR su cui si applica l’operazione.       | Sì           | Esempi: `Observation`, `Patient`, `Encounter` |
   | patient-identifier        | string | Identificativo univoco del paziente.                       | Sì           | Pattern identificativo (es. codice fiscale) |


## Notes
   [^1]: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf
   [^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 
   [^3]: Par. 4.3.1 del documento rif [2]
   [^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità
   [^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità