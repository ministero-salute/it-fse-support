**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST UAR**


| Versione | : | 1.0 |
|----------|---|---------|

## INDICE

- [1. Introduzione](#1-introduzione)
  - [1.1. Riferimenti](#11-riferimenti)
  - [1.2. Acronimi e Definizioni](#12-acronomi-e-definizioni)
  - [1.3. Registro modifiche](#13-registro-modifiche)
- [2. Contesto di Riferimento](#2-contesto-di-riferimento)
  - [2.1. Pattern di Interazione](#21-pattern-di-interazione)
  - [2.2. Processo di Autenticazione](#22-processo-di-autenticazione3)
  - [2.3. Note su autenticazione e token JWT](#23-note-su-autenticazione-e-token-jwt)
- [3. Servizio di Memorizzazione Documento](#3-servizio-di-memorizzazione-documento)
  - [3.1. Request](#31-request)
  - [3.2. Response](#32-response)
- [4. Servizio di Eliminazione Documento](#4-servizio-di-eliminazione-documento)
  - [4.1. Request](#41-request)
  - [4.2. Response](#42-response)
- [5. Servizio di Sostituzione Documento](#5-servizio-di-sostituzione-documento)
  - [5.1. Request](#51-request)
  - [5.2. Response](#52-response)
- [6. Servizio di Aggiornamento Metadati](#6-servizio-di-aggiornamento-metadati)
  - [6.1. Request](#61-request)
  - [6.2. Response](#62-response)
- [7. Drilldown Response in caso di Errore](#7-drilldown-response-in-caso-di-errore)
  - [7.1. Errori Applicativi](#71-errori-applicativi)
    - [7.1.1. Esempi di errore generati da UA-R](#711-esempi-di-errore-generati-da-ua-r)
- [8. Drilldown Parametri di Input](#8-drilldown-parametri-di-input)
  - [8.1. Campi Contenuti nei JWT](#81-campi-contenuti-nei-jwt)
  - [8.2. Campi Contenuti nella Request Body](#82-campi-contenuti-nella-request-body)
  - [8.3. Tabelle di Riferimento](#83-tabelle-di-riferimento)
    - [8.3.1. RDA](#831-rda)
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
| 1.0      | 2025-07-21     | Creazione del documento                                                                |

_Tabella 3: Registro Modifiche_


# 2. Contesto di Riferimento
La nuova architettura del FSE prevede la presenza di un componente dell'EDS, denominato UA-R, finalizzata alla gestione dei dati in chiaro degli assistiti,utilizzando il formato FHIR, estratti dai documenti sanitari prodotti dalla Regione/ Provincia Autonoma.
In questo documento verranno indicate le modalità per usufruire dei servizi esposti dalla UAR: il documento sarà redatto in modo incrementale e di volta in volta ulteriori API saranno integrate ed illustrate.

In questa fase vengono illustrate le funzionalità principali:
- Memorizzazione sicura dei documenti clinici in formato FHIR
- Cancellazione dei documenti clinici in formato FHIR
- Sostituzione dei documenti clinici in formato FHIR
- Aggiornamento dei documenti clinici in formato FHIR

| Endpoint URL | Metodo | Descrizione |
|--------|----------|-------------|
| `/v1/document/workflowinstanceid/{wii}/rda/{rda}` | POST | Acquisisce un nuovo documento per la memorizzazione di un Bundle di tipo Transaction sul server FHIR. |
| `/v1/document/workflowinstanceid/{wii}/rda/{rda}` | PUT | Acquisisce un documento per sostituirne uno esistente di tipo Transaction sul server FHIR.|
| `/v1/document/metadata/{rda}` | PUT | Acquisisce e aggiorna la risorsa DocumentReference all'interno del Bundle FHIR.|
| `/v1/document/identifier/{identifier}/rda/{rda}` | DELETE | Elimina un documento, identificato dall'identificativoDocumento, dal server FHIR. |

_Tabella 4: Endpoint/Funzionalità_

**Memorizzazione Documento**
Il flusso di memorizzazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

**Sostituzione Documento FHIR**
Il flusso di sostituzione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla sostituzione del documento stesso in modalità asincrona.

**Cancellazione Documento FHIR**

Il flusso di cancellazione consente la rimozione di un documento pubblicato. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla cancellazione del documento stesso.
L’eliminazione delle risorse avviene in modalità sincrona.

**Aggiornamento Document FHIR**

Questa funzionalità consente di aggiornare i metadati associati a un documento già pubblicato sul FHIR Server, senza modificarne il contenuto clinico. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà all'aggiornamento dei metadati del documento stesso.
L’aggiornamento delle risorse avviene in modalità sincrona.

## 2.1. Pattern di Interazione

Le API sono esposte secondo i pattern definiti nelle Linee Guida Modello di Interoperabilità[^1] definite da Agid.

Come scenario di interazione per i servizi esposti dall'UAR viene utilizzato il pattern [BLOCK_REST] Blocking REST[^2]<sup>.</sup>

## 2.2. Processo di Autenticazione[^3]

Il processo di autenticazione rispetta i seguenti pattern delle suddette Linee Guida:

* ID_AUTH_CHANNEL_02 [^4]

* ID_AUTH_REST_01 [^5]

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

# 3. Servizio di Memorizzazione Documento

Il flusso di memorizzazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/workflowinstanceid/{wii}/rda/{rda}
```

### 3.1. Request

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| POST   | `/v1/document/workflowinstanceid/{wii}/rda/{rda}` | application/json |

#### Parametri Path

| KEY | IN   | TYPE   | REQUIRED |
|-----|------|--------|----------|
| wii | path | string | true     |
| rda | path | string | true     |

#### Parametri Body

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| fhirServerUrl | string | true     |
| identifier    | string | true     |
| jsonString    | string | true     |

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

#### Esempio di richiesta

```bash
curl -X 'POST' \
  'http://<HOST>:<PORT>/v1/document/workflowinstanceid/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed/rda/120' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <JWT_TOKEN>' \
  -H 'FSE-JWT-Signature: <JWT_SIGNATURE>' \
  -H 'Content-Type: application/json' \
  -d '{
    "fhirServerUrl": "https://fhirserver.example.com",
    "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
    "operation": "PUBLISH",
    "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}"
}'
```

---

## 3.2. Response

| STATUS | SIGNIFICATO                               | TIPO                   |
|--------|-------------------------------------------|------------------------|
| 201    | Documento preso in carico                 | application/json       |
| 500    | Errore interno del server                 | application/problem+json |

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
  "type": "string",
  "title": "string",
  "detail": "string",
  "status": 500,
  "instance": "string"
}
```

# 4. Servizio di Eliminazione Documento

Il flusso di cancellazione consente la rimozione di un documento pubblicato. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla cancellazione del documento stesso.
L’eliminazione delle risorse avviene in modalità sincrona.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/identifier/{identifier}/rda/{rda}?fhirServerUrl={url}
```

## 4.1. Request

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| DELETE | `/v1/document/identifier/{identifier}/rda/{rda}` | application/json |

#### Parametri Path

| KEY        | IN   | TYPE   | REQUIRED |
|------------|------|--------|----------|
| identifier | path | string | true     |
| rda        | path | string | true     |

#### Parametri Query

| KEY           | IN     | TYPE   | REQUIRED |
|---------------|--------|--------|----------|
| fhirServerUrl | query  | string | true     |

#### Esempio di richiesta

```bash
curl -X 'DELETE' \
  'http://<HOST>:<PORT>/v1/document/identifier/2.16.840.1.113883.2.9.2.120.4.4^290700/rda/120?fhirServerUrl=https://fhir.example.it' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <JWT_TOKEN>' \
  -H 'FSE-JWT-Signature: <JWT_SIGNATURE>'
```

---

## 4.2. Response

| STATUS | SIGNIFICATO                          | TIPO                     |
|--------|--------------------------------------|--------------------------|
| 200    | Documento eliminato con successo     | application/json         |
| 404    | Documento non trovato                | application/problem+json |
| 500    | Errore interno del server            | application/problem+json |

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
  "type": "string",
  "title": "string",
  "detail": "string",
  "status": 404,
  "instance": "string"
}
```

# 5. Servizio di Sostituzione Documento

Il flusso di sostituzione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla sostituzione del documento stesso in modalità asincrona.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/workflowinstanceid/{wii}/rda/{rda}
```

## 5.1. Request

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| PUT    | `/v1/document/workflowinstanceid/{wii}/rda/{rda}`  | application/json |

#### Parametri Path

| KEY | IN   | TYPE   | REQUIRED |
|-----|------|--------|----------|
| wii | path | string | true     |
| rda | path | string | true     |

#### Parametri Body

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| fhirServerUrl | string | true     |
| identifier    | string | true     |
| jsonString    | string | true     |

#### Esempio di richiesta

```bash
curl -X 'PUT' \
  'http://<HOST>:<PORT>/v1/document/workflowinstanceid/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed/rda/120' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <JWT_TOKEN>' \
  -H 'FSE-JWT-Signature: <JWT_SIGNATURE>' \
  -H 'Content-Type: application/json' \
  -d '{
    "fhirServerUrl": "https://fhir.example.it",
    "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
    "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}",
}'
```

---

## 5.2. Response

| STATUS | SIGNIFICATO                              | TIPO                     |
|--------|------------------------------------------|--------------------------|
| 200    | Documento sostituito con successo         | application/json         |
| 404    | Documento non trovato                    | application/problem+json |
| 500    | Errore interno del server                | application/problem+json |

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
  "type": "string",
  "title": "string",
  "detail": "string",
  "status": 404,
  "instance": "string"
}
```

# 6. Servizio di Aggiornamento Metadati

Questa funzionalità consente di aggiornare i metadati associati a un documento già pubblicato sul FHIR Server, senza modificarne il contenuto clinico. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà all'aggiornamento dei metadati del documento stesso.
L’aggiornamento delle risorse avviene in modalità sincrona.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/metadata/{rda}
```

## 6.1. Request

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| PUT    | `/v1/document/metadata/{rda}` |application/json |

#### Parametri Path

| KEY | IN   | TYPE   | REQUIRED |
|-----|------|--------|----------|
| rda | path | string | true     |

#### Parametri Body

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| fhirServerUrl | string | true     |
| identifier    | string | true     |
| jsonString    | string | true     |

#### Esempio di richiesta

```bash
curl -X 'PUT' \
  'http://<HOST>:<PORT>/v1/document/metadata/120' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <JWT_TOKEN>' \
  -H 'FSE-JWT-Signature: <JWT_SIGNATURE>' \
  -H 'Content-Type: application/json' \
  -d '{
    "fhirServerUrl": "https://fhir.example.it",
    "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
    "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}"
}'
```

---

## 6.2. Response

| STATUS | SIGNIFICATO                               | TIPO                     |
|--------|-------------------------------------------|--------------------------|
| 200    | Metadati aggiornati con successo          | application/json         |
| 404    | Documento non trovato                     | application/problem+json |
| 500    | Errore interno del server                 | application/problem+json |

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
  "type": "string",
  "title": "string",
  "detail": "string",
  "status": 404,
  "instance": "string"
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
    <td>/err/validation</td>
    <td>Validation error</td>
    <td>Validation failed for one or more fields</td>
    <td>400</td>
    <td>/err/validation</td>
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

# 8. Drilldown Parametri di Input
## 8.1. Campi Contenuti nei JWT

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

## 8.2 Campi Contenuti nella Request Body

### Parametri obbligatori

| PARAMETRO       | TIPO    | OBBLIGATORIO | DESCRIZIONE                                                                 |
|------------------|---------|--------------|-----------------------------------------------------------------------------|
| `fhirServerUrl`  | string  | Sì           | URL del server FHIR su cui pubblicare i dati.                              |
| `identifier`     | string  | Sì           | Identificativo univoco del Bundle FHIR.       |
| `jsonString`     | string  | Sì           | Rappresentazione JSON del Bundle FHIR.                     |


## 8.3 Tabelle di Riferimento
### 8.3.1. RDA

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

</table>


_Tabella 48: _Value set per il campo rda

<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità