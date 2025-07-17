**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST UAR**


<table>
  <tr>
   <td>Versione
   </td>
   <td>:
   </td>
   <td>ver 1.0
   </td>
  </tr>
</table>



**INDICE**

- [1. Introduzione](#1-introduzione)
  - [1.1. Riferimenti](#11-riferimenti)
  - [1.2. Acronimi e Definizioni](#12-acronimi-e-definizioni)
  - [1.3. Registro modifiche](#13-registro-modifiche)
- [2. Contesto di Riferimento](#2-contesto-di-riferimento)
  - [2.1. Pattern di Interazione](#21-pattern-di-interazione)
  - [2.2. Processo di Autenticazione\[^3\]](#22-processo-di-autenticazione3)
  - [2.3. Note su autenticazione e token JWT](#23-note-su-autenticazione-e-token-jwt)
- [3. Servizio di Creazione](#3-servizio-di-creazione)
    - [3.1. Request](#31-request)
    - [Parametri Path](#parametri-path)
    - [Parametri Body (DocumentDTO)](#parametri-body-documentdto)
    - [3.1.1. Messaggio di Richiesta”](#311-messaggio-di-richiesta)
  - [3.2. Response](#32-response)
    - [3.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Pubblicazione con Attachment”](#321-esempio-di-messaggio-di-risposta-con-esito-ok-200---pubblicazione-con-attachment)
    - [3.2.2. Messaggio di Risposta, esempio “Pubblicazione con Resource” con esito KO 400](#322-messaggio-di-risposta-esempio-pubblicazione-con-resource-con-esito-ko-400)
- [4. Servizio di Eliminazione Documento](#4-servizio-di-eliminazione-documento)
  - [4.1. Request](#41-request)
    - [4.1.1. Messaggio di Richiesta, esempio “Eliminazione Documento”](#411-messaggio-di-richiesta-esempio-eliminazione-documento)
  - [4.2. Response](#42-response)
    - [4.2.1. Esempio di Messaggio di Risposta con esito OK 200 - Delete eseguita con successo](#421-esempio-di-messaggio-di-risposta-con-esito-ok-200---delete-eseguita-con-successo)
    - [4.2.2. Esempio di Messaggio di Risposta con esito KO 400](#422-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [5. Servizio di Sostituzione Documento](#5-servizio-di-sostituzione-documento)
  - [5.1. Request](#51-request)
    - [5.1.1. Messaggio di Richiesta, esempio “Pubblicazione Sostituzione Documento con Attachment”](#511-messaggio-di-richiesta-esempio-pubblicazione-sostituzione-documento-con-attachment)
  - [5.2. Response](#52-response)
    - [56.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”](#5621-esempio-di-messaggio-di-risposta-con-esito-ok-200-pubblicazione-sostituzione-documento-con-attachment)
    - [5.2.2. Esempio di Messaggio di Risposta con esito KO 400](#522-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [6. Servizio di Aggiornamento Metadati](#6-servizio-di-aggiornamento-metadati)
  - [6.1. Request](#61-request)
    - [6.1.1. Esempio Messaggio di Richiesta](#611-esempio-messaggio-di-richiesta)
  - [6.2. Response](#62-response)
    - [6.2.1. Esempio di Messaggio di risposta con Esito Success 200](#621-esempio-di-messaggio-di-risposta-con-esito-success-200)
    - [6.2.2. Esempio di Messaggio di Risposta con esito KO 400](#622-esempio-di-messaggio-di-risposta-con-esito-ko-400)
- [8. Drilldown Response in caso di Errore](#8-drilldown-response-in-caso-di-errore)
  - [8.1. Errori Applicativi](#81-errori-applicativi)
    - [8.3.1. Esempi di errore generati dal Gateway](#831-esempi-di-errore-generati-dal-gateway)
  - [8.1. Errori provenienti da Apparati di Frontiera](#81-errori-provenienti-da-apparati-di-frontiera)
- [9. Drilldown Parametri di Input](#9-drilldown-parametri-di-input)
  - [9.1. Campi Contenuti nei JWT](#91-campi-contenuti-nei-jwt)
  - [9.2. Campi Contenuti nella Request Body](#92-campi-contenuti-nella-request-body)
  - [13.3. Tabelle di Riferimento](#133-tabelle-di-riferimento)
  - [Notes](#notes)



# 1. Introduzione


## 1.1. Riferimenti

| Rif. | Documento                          | Descrizione                                                                                                          |
| ---- | ---------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| [1](https://developers.italia.it/it/fse/) | Fascicolo Sanitario Elettronico | Un nuovo ecosistema digitale, basato su dati e documenti, per offrire prestazioni di qualità a favore di cittadini e operatori sanitari |
| [2](https://github.com/ministero-salute/it-fse-support/tree/main/doc/integrazione-gateway) | Specifiche Integrazione Gateway | Documento delle specifiche di integrazione con la componente Gateway FSE2.0 |
| [3](https://www.gazzettaufficiale.it/eli/id/2025/03/05/25A01321/SG) | Decreto ministeriale EDS | Decreto 31 dicembre 2024 — Ecosistema dati sanitari |

_Tabella 1: Riferimenti Esterni_


## 1.2. Acronimi e Definizioni
| Acronimo    | Descrizione                                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------------------------ |
| FSE         | Fascicolo Sanitario Elettronico                                                                                    |
| GTW         | Gateway                                                                                                            |
| RDE         | Regione di erogazione                                                                                              |
| RDA         | Regione di assistenza                                                                                              |
| API         | Application Programming Interface                                                                                  |
| EDS         | Ecosistema dati sanitari                                                                                           |
| FHIR        | FHIR (Fast Healthcare Interoperability Resources) è uno standard sviluppato da [HL7](https://www.hl7.it/) per lo scambio di dati sanitari |
| UA-R        | Unità di archiviazione dati regionale                                                                              |
| UD-P        | Unità di archiviazione dati pseduonimizzati                                                                        |
| FPE         | [Format Preserving Encryption](https://en.wikipedia.org/wiki/Format-preserving_encryption)                         |

_Tabella 2: Acronimi e Definizioni_

## 1.3. Registro modifiche
| Versione | Data           | Descrizione modifiche                                                                  |
| -------- | -------------- | -------------------------------------------------------------------------------------- |
| 1.0      | 2025-07-17     | Creazione del documento                                                                |

_Tabella 3: Registro Modifiche_


# 2. Contesto di Riferimento
La nuova architettura del FSE prevede la presenza di un componente dell'EDS, denominato UA-R, finalizzata alla gestione dei dati in chiaro,utilizzando il formato FHIR, degli assistiti estratti dai documenti sanitari prodotti dalla Regione/ Provincia Autonoma.
In questo documento verranno indicate le modalità per usufruire dei servizi esposti dalla UAR: il documento sarà redatto in modo incrementale e di volta in volta ulteriori API saranno integrate ed illustrate.

In questa fase vengono illustrate le funzionalità principali:
- Memorizzazione sicura dei documenti clinici in formato FHIR
- Cancellazione dei documenti clinici in formato FHIR
- Sostituzione dei documenti clinici in formato FHIR
- Aggiornamento dei documenti clinici in formato FHIR

| Endpoint URL | Metodo | Descrizione |
|--------|----------|-------------|
| `/v1/document/workflowinstanceid/{wii}/rda/{rda}` | POST | Acquisisce un nuovo documento per la creazione sul server FHIR.. |
| `/v1/document/workflowinstanceid/{wii}/rda/{rda}` | PUT | Acquisisce un documento per sostituirne uno esistente sul server FHIR.|
| `/v1/document/metadata/{rda}` | PUT | Acquisisce e aggiorna la risorsa DocumentReference all'interno del Bundle FHIR.|
| `/v1/document/identifier/{identifier}/rda/{rda}` | DELETE | Elimina un documento, identificato dall'identificativoDocumento, dal server FHIR. |

_Tabella 4: Endpoint/Funzionalità_

L'endpoint del **sistema di test** è: 

    TBD

**Creazione Documento**
Il flusso di creazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

**Sostituzione Documento FHIR**
Il flusso di sostizuone consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, verrà eseguita una ricerca rispetto al master identifier che assicura che il documento si trova effettivamente sul server FHIR e poi tale documento viene rimpiazzato.

**Cancellazione Documento FHIR**

Il flusso di cancellazione consente la rimozione di un documento pubblicato, identificato tramite identifier (XDSDocumentEntry.uniqueId), sia dal server FHIR (EDS) che dai metadati registrati su INI.
L’eliminazione delle risorse avviene in modalità sincrona su entrambi i sistemi.
Il servizio restituisce un acknowledgment di presa in carico, anche in caso di errore durante l’operazione.

**Aggiornamento Document FHIR**

Questa funzionalità consente di aggiornare i metadati associati a un documento già pubblicato su FSE, senza modificarne il contenuto clinico.
L’operazione aggiorna la risorsa DocumentReference all’interno del Bundle FHIR, sia su EDS che su INI, in modalità completamente sincrona.
Anche in questo caso, il documento viene identificato tramite XDSDocumentEntry.uniqueId. In caso di errore, il servizio restituisce un acknowledgment di presa in carico.

## 2.1. Pattern di Interazione

Le API sono esposte secondo i pattern definiti nelle Linee Guida Modello di Interoperabilità[^1] definite da Agid.

Come scenario di interazione per i servizi esposti dall'UAR viene utilizzato il pattern [BLOCK_REST] Blocking REST[^2]<sup>.</sup>

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

# 3. Servizio di Creazione

Lo scopo di questa API è indicizzare un nuovo documento clinico sul FSE regionale, tradurre i dati clinici nel formato HL7 FHIR ed inviarli al Data Repository Centrale.

L’Endpoint del caso d’uso di Creazione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/{wii}/rda/{rda}
```

Lo scopo di questa API è indicizzare un nuovo documento clinico sul FSE regionale, tradurre i dati clinici nel formato HL7 FHIR ed inviarli al Data Repository Centrale.


### 3.1. Request

| METHOD | URL | TYPE |
|--------|-----|------|
| POST | `/v1/document/workflowinstanceid/{wii}/rda/{rda}` | application/json |

### Parametri Path

| KEY | IN | TYPE | REQUIRED |
|-----|----|------|----------|
| wii | path | string | True |
| rda | path | string | True |

### Parametri Body (DocumentDTO)

| KEY | TYPE |
|-----|------|
| fhirServerUrl | string |
| identifier | string |
| operation | string |
| jsonString | string |
| insertionDate | string |
| fiscalCode | string |

_Tabella 11: Parametri Richiesta di Creazione_

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

* **requestBody** che dovrà contenere l’oggetto json con i parameter di input

### 3.1.1. Messaggio di Richiesta”

Messaggio di richiesta con pdf con CDA innestato in modalità RESOURCE, tipo documento CDA e metadati formalmente corretti, con indicazione della priorità.

In questo caso, il workflowInstanceId non esiste nel gateway.

``` bash
curl -X 'POST' \
  'http://<HOST>:<PORT>/v1/document/workflowinstanceid/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed/rda/RDA001' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <JWT_TOKEN>' \
  -H 'FSE-JWT-Signature: <JWT_SIGNATURE>' \
  -H 'Content-Type: application/json' \
  -d '{
    "fhirServerUrl": "https://fhirserver.example.com",
    "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
    "operation": "PUBLISH",
    "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}",
    "insertionDate": "2024-04-01T10:00:00Z",
    "fiscalCode": "RSSMRA85M01H501Z"
}'

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


### 3.2.1. Esempio di Messaggio di Risposta con esito OK 200 - “Pubblicazione con Attachment”

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f", 
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 3.2.2. Messaggio di Risposta, esempio “Pubblicazione con Resource” con esito KO 400

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

# 4. Servizio di Eliminazione Documento

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 8.1 “Campi Contenuti nei JWT”.

L’Endpoint del caso d’uso di Eliminazione Documento si compone come segue:


```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>
```

Lo scopo di questa API Sincrona è eliminare le risorse FHIR precedentemente pubblicate, inclusi i metadati scritti su INI.


## 4.1. Request


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


### 4.1.1. Messaggio di Richiesta, esempio “Eliminazione Documento”

Messaggio di richiesta con identificativoDocUpdate presente e formalmente corretto. 

``` bash
curl -X 'DELETE' \
  'https://<HOST>:<PORT>/v1/documents/507f1f77bcf86cd799439011' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg' \
  -H 'FSE-JWT-Signature: eyJdWIiOiIxMjM0NTY3ODkw … Ok6yJV_adQssw5c' \
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

### 4.2.1. Esempio di Messaggio di Risposta con esito OK 200 - Delete eseguita con successo

``` json
{ 
  "traceID": "c2e1818fbf7aea7f", 
  "spanID": "c2e1818fbf7aea7f",
  "workflowInstanceId": "2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed.3c55cfd276^^^^urn:ihe:iti:xdw:2013:workflowInstanceId" 
}
```

### 4.2.2. Esempio di Messaggio di Risposta con esito KO 400

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

# 5. Servizio di Sostituzione Documento

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Sostituzione Documento si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>
```

Lo scopo di questa API Asincrona è pubblicare un documento sovrascrivendo il documento che era stato precedentemente pubblicato. 


## 5.1. Request


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


### 5.1.1. Messaggio di Richiesta, esempio “Pubblicazione Sostituzione Documento con Attachment”

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


### 56.2.1. Esempio di Messaggio di Risposta con esito OK 200, “Pubblicazione Sostituzione Documento con Attachment”

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
  "type": "/msg/cda-element",
  "title": "Errore in fase di recupero dell'esito della verifica.",
  "detail": "Il CDA non risulta validato",
  "status": 400,
  "instance": "/msg/cda-element"
}
```

# 6. Servizio di Aggiornamento Metadati

Nei sottoparagrafi della presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. Per ulteriori dettagli sui campi esposti è necessario fare riferimento al Capitolo 13 “Drilldown Parametri di Input”.

L’Endpoint del caso d’uso di Pubblicazione Aggiornamento Metadati si compone come segue:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>/metadata
```

Lo scopo di questa API Sincrona è di aggiornare i metadati di un documento precedentemente pubblicato.

In ambiente di validazione, è stato rilascio un ulteriore endpoint:

```
https://<HOST>:<PORT>/v<major>/documents/<identificativoDocUpdate>/metadata-iti-57
```

Tale endpoint consentirà ai diversi attori di invocare la nuova transazione di aggiornamento metadati "IHE ITI-57" mediante il Gateway. Le interfacce esposte rispettano le stesse e identiche specifiche della precedente transazione. 

``` IMPORTANTE
Tale endpoint sarà esposto in ambiente di validazione per un tempo necessario da consentire a tutte le RDA di adeguarsi. Successivamente, previa comunicazione, verrà utilizzato l'endpoint /metadata per eseguire la transazione di ITI-57 attraverso il GTW

```



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
   <td>false
   </td>
   <td>XDSDocumentEntry.Slot - administrativeRequest
   </td>
  </tr>
  
</table>


_Tabella 26: Parametri Richiesta di Pubblicazione Aggiornamento Metadati_

La compilazione errata dei parametri oppure la non compilazione dei parametri “required” comporta un errore di tipo bloccante.

Il parametro _identificativoDocUpdate_ corrisponde all’OID (Object Identifier) del documento di cui modificare i metadati e al parametro _identificativoDoc_ utilizzato nel servizio di creazione.


### 6.1.1. Esempio Messaggio di Richiesta

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


### 6.2.1. Esempio di Messaggio di risposta con Esito Success 200

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

# 8. Drilldown Response in caso di Errore

Il Gateway genererà due tipologie di errore distinte, entrambe aderenti alla specifica RFC 7807.


## 8.1. Errori Applicativi

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


### 8.3.1. Esempi di errore generati dal Gateway


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



## 8.1. Errori provenienti da Apparati di Frontiera

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


# 9. Drilldown Parametri di Input

Come riportato nel documento "Specifiche tecniche per l’interoperabilità tra i sistemi regionali di FSE - Framework e dataset dei servizi base - Versione 2.5” l’interoperabilità fra i differenti sistemi di FSE a livello nazionale è assicurata tramite INI. 

INI rappresenta un mediatore per le comunicazioni tra i diversi sistemi regionali che appartengono allo stesso Affinity Domain, in grado di garantire ad un sistema di FSE di una regione diversa da quella di assistenza l’accesso ai documenti.

Per individuare i parametri di input dei servizi di pubblicazione relativi alla creazione è necessario quindi fare riferimento al dataset del servizio base di comunicazione metadati presentato al paragrafo 3.3 del documento citato in precedenza.

I campi dei messaggi di richiesta comunicazione metadati riportati nella tabella 9 sono suddivisi per tipologia, in particolare possiamo individuare:



* I campi “asserzione attributo”  
Campi aventi una natura tale da richiedere una certificazione da parte di Sistemi preposti; proprio per rispettare tale vincolo, i campi in questione dovranno essere inviati al Gateway attraverso il JWT fornito nell’header della chiamata.



* I campi “specifici per messaggio”  
Campi che possono essere forniti al Gateway direttamente tramite la request body.

Nella parte restante di questo paragrafo saranno descritti puntualmente i campi recuperati dal JWT (che coincidono con i campi “asserzione attributo”) e quelli recuperati dalla request body (che nascono dall’unione dei campi “specifici per messaggio” che non possono essere dedotti dal contesto di invocazione).


## 9.1. Campi Contenuti nei JWT

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
   <li>LABORATORIO DI PROVA^^^^^&2.16.840.1.113883.2.9.4.1.3&ISO^^^^111101123456 (tipo XON), che indica la struttura "LABORATORIO DI PROVA” della Regione “111”, ASL “101” e codice STS.11(6) “123456".</li>
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
  "locality": "LABORATORIO DI PROVA^^^^^&2.16.840.1.113883.2.9.4.1.3&ISO^^^^190111123456",
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

N.B: Il campo **locality** nell'esempio fa riferimento al **LABORATORIO DI PROVA** della Regione Sicilia **190**, ASL **111** e codice STS.11 **123456**


## 9.2. Campi Contenuti nella Request Body

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

<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità