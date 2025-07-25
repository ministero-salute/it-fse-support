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
- [3. Servizio di Memorizzazione Bundle FHIR](#3-servizio-di-memorizzazione-bundle-fhir)
  - [3.1. Request](#31-request)
  - [3.2. Response](#32-response)
- [4. Servizio di Eliminazione Bundle FHIR](#4-servizio-di-eliminazione-bundle-fhir)
  - [4.1. Request](#41-request)
  - [4.2. Response](#42-response)
- [5. Servizio di Sostituzione Bundle FHIR](#5-servizio-di-sostituzione-bundle-fhir)
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
  - [8.3. Campi contenuti nel Path](#83-campi-contenuti-nel-path)
- [Notes](#notes)



# 1. Introduzione


## 1.1. Riferimenti

| Rif. | Documento                          | Descrizione                                                                                                          |
| ---- | ---------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| [1](https://developers.italia.it/it/fse/) | Fascicolo Sanitario Elettronico | Un nuovo ecosistema digitale, basato su dati e documenti, per offrire prestazioni di qualità a favore di cittadini e operatori sanitari |
| [2](https://www.gazzettaufficiale.it/eli/id/2025/03/05/25A01321/SG) | Decreto ministeriale EDS | Decreto 31 dicembre 2024 — Ecosistema dati sanitari |

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
| 1.0      | 2025-07-23     | Creazione del documento                                                                |

_Tabella 3: Registro Modifiche_


# 2. Contesto di Riferimento
La nuova architettura del FSE prevede la presenza di un componente dell'EDS, denominato UA-R, finalizzata alla gestione dei dati in chiaro degli assistiti,utilizzando il formato FHIR, estratti dai documenti sanitari prodotti dalla Regione/ Provincia Autonoma.
In questo documento verranno indicate le modalità per usufruire dei servizi esposti dalla UAR: il documento sarà redatto in modo incrementale e di volta in volta ulteriori API saranno integrate ed illustrate.

In questa fase vengono illustrate le funzionalità principali:
- Memorizzazione sicura dei dati clinici in formato FHIR
- Cancellazione dei dati clinici in formato FHIR
- Sostituzione dei dati clinici in formato FHIR
- Aggiornamento dei dati clinici in formato FHIR

| Endpoint URL | Metodo | Descrizione |
|--------|----------|-------------|
| `/v1/document/workflowinstanceid/{wii}` | POST | Acquisisce un nuovo documento per la memorizzazione di un Bundle di tipo Transaction sul server FHIR. |
| `/v1/document/workflowinstanceid/{wii}` | PUT | Acquisisce un documento per sostituirne uno esistente di tipo Transaction sul server FHIR.|
| `/v1/document/metadata/` | PUT | Acquisisce e aggiorna la risorsa DocumentReference all'interno del Bundle FHIR.|
| `/v1/document/identifier/{identifier}` | DELETE | Elimina un documento, identificato dall'identificativoDocumento, dal server FHIR. |

_Tabella 4: Endpoint/Funzionalità_

**Memorizzazione Bundle FHIR**
Il flusso di memorizzazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

**Sostituzione Bundle FHIR**
Il flusso di sostituzione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla sostituzione del documento stesso in modalità asincrona.

**Cancellazione Bundle FHIR**

Il flusso di cancellazione consente la rimozione di un documento pubblicato. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà alla cancellazione del documento stesso.
L’eliminazione delle risorse avviene in modalità sincrona.

**Aggiornamento Bundle FHIR**

Questa funzionalità consente di aggiornare i metadati associati a un documento già pubblicato sul FHIR Server, senza modificarne il contenuto clinico. In via preliminare, verrà eseguita una ricerca rispetto al master identifier che assicurerà l'esistenza del documento sul server FHIR e successivamente si procederà all'aggiornamento dei metadati del documento stesso.
L’aggiornamento delle risorse avviene in modalità sincrona.

## 2.1. Pattern di Interazione

Le API sono esposte secondo i pattern definiti nelle Linee Guida Modello di Interoperabilità[^1] definite da Agid.

Come scenario di interazione per i servizi esposti dal UA-R viene utilizzato il pattern [BLOCK_REST] Blocking REST[^2]<sup>.</sup>


## 2.2. Processo di Autenticazione[^3]

Il processo di autenticazione rispetta i seguenti pattern delle suddette Linee Guida:

* ID_AUTH_CHANNEL_02 [^4]


* ID_AUTH_REST_01 [^5]

## 2.3. Note su autenticazione e token JWT

Per comunicare con UA-R è necessario essere in possesso di 2 certificati X.509 e delle rispettive chiavi private.

Il certificato denominato di **“autenticazione”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> come certificato client per le chiamate https.

Il certificato denominato di **“signature”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> per la firma dei token JWT.

Ogni invocazione delle API deve avvenire:
* tramite **HTTPS** autenticato con il certificato client;
* includendo negli header **due token JWT**, entrambi firmati con il certificato di signature.

Il primo JWT è utilizzato per l’autenticazione e contiene i riferimenti all’utente che richiama il servizio e al soggetto interessato, il token viene trasportato nell’header **“Authorization”** di tipo “**Bearer”**:


```
Authorization: Bearer {VALORE DEL TOKEN}
```


Il secondo JWT è di “signature” e contiene rifermenti al documento oggetto delle operazioni, il token viene trasportato nell’header http **“Agid-JWT-Signature”**:


```
Agid-JWT-Signature: {VALORE DEL TOKEN}
```


**Entrambi** i token devono essere firmati utilizzando il certificato “signature”.

Vista la dipendenza dei token dai valori specifici di utente/soggetto/documento è necessario generare nuovi JWT per ogni chiamata alle API.

Per i dettagli sui campi dei token si consulti l’apposito paragrafo.

# 3. Servizio di Memorizzazione Bundle FHIR

Il flusso di memorizzazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/workflowinstanceid/{wii}
```

### 3.1. Request

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| POST   | `/v1/document/workflowinstanceid/{wii}` | application/json |

#### Parametri Path

| KEY | IN   | TYPE   | REQUIRED |
|-----|------|--------|----------|
| wii | path | string | true     |

#### Parametri Body

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| identifier    | string | true     |
| jsonString    | string | true     |

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

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

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| DELETE | `/v1/document/identifier/{identifier}` | application/json |

#### Parametri Path

| KEY        | IN   | TYPE   | REQUIRED |
|------------|------|--------|----------|
| identifier | path | string | true     |

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

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| PUT    | `/v1/document/workflowinstanceid/{wii}`  | application/json |

#### Parametri Path

| KEY | IN   | TYPE   | REQUIRED |
|-----|------|--------|----------|
| wii | path | string | true     |

#### Parametri Body

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| identifier    | string | true     |
| jsonString    | string | true     |

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

| METHOD | URL | TYPE             |
|--------|-----|------------------|
| PUT    | `/v1/document/metadata` |application/json |


#### Parametri Body

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| identifier    | string | true     |
| jsonString    | string | true     |

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

Gli endpoint di UA-R ricevono 2 token JWT:



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
   <td>Indica il destinatario per cui è stato creato il token, da valorizzare con la base URL del servizio, comprensivo della versione, per esempio https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/uar/v1
   </td>
  </tr>
  <tr>
   <td><strong>VALORE</strong>
   </td>
   <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/uar/v1
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



* **Agid-JWT-Signature**: token JWT contenente custom claims necessari ai fini applicativi

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
   <td>Indica il destinatario per cui è stato creato il token, da valorizzare con la base URL del servizio, comprensivo della versione, per esempio https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/uar/v1
   </td>
  </tr>
  <tr>
   <td><strong>VALORE</strong>
   </td>
   <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/uar/v1
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

| PARAMETRO       | TIPO    | OBBLIGATORIO | DESCRIZIONE                                                                 |
|------------------|---------|--------------|-----------------------------------------------------------------------------|
| `identifier`     | string  | Sì           | Identificativo univoco del Bundle FHIR.       |
| `jsonString`     | string  | Sì           | Rappresentazione JSON del Bundle FHIR.                     |

## 8.3. Campi contenuti nel Path

| PARAMETRO       | TIPO    | DESCRIZIONE                                                                 |
|------------------|---------|-----------------------------------------------------------------------------|
| `workflowInstanceId`     | string  |  Identificativo operazione restituito dal Gateway.       | 

<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità