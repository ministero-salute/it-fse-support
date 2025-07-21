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
Per il colloquio con i servizi di EDS è stato scelto di utilizzare il pattern:
* [INTEGRITY_REST_01] Integrità del payload messaggio REST

Secondo quanto previsto dai requisiti di progetto non è previsto il tracciamento del payload del messaggio. Sarà, invece, tracciato su tracciamento opponibile ai terzi il token **Agid-JWT-Signature**.

In sede di progetto è stato fornito il requisito di applicare il pattern [INTEGRITY_REST_01] e non il profilo [PROFILE_NON_REPUDIATION_01] Profilo per la non ripudiabilità della trasmissione.

Applicando il pattern [INTEGRITY_REST_01], il fruitore non detiene la risposta firmata della presa in carico o meno della transazione da parte del sistema EDS. In caso di applicazione del profilo di [PROFILE_NON_REPUDIATION_01] il Gateway avrebbe dovuto tracciare anche la request e, di conseguenza, fare persistenza del dato sanitario contenuto nell’oggetto bundle_FHIR inviato al sistema EDS.

Lato Gateway, tracciando solo Agid-JWT-Signature senza payload ho solo il riferimento ai metadati della transazione inviata. Il sistema EDS, erogatore della funzionalità, non avrà tracciato la risposta fornita in virtù del profilo scelto per la fruizione lato Gateway.
Nel caso della configurazione delle chiamate dal Gateway gestito da Sogei, i certificati con cui si presenterà al broker EDS saranno sempre gli stessi a prescindere dall’appartenenza regionale del touchpoint da cui arriva la chiamata.

## 8.1. Campi Contenuti nei JWT
Il sistema Broker è consumer dei servizi esposti dalle componenti UAR-Regionali quando non gestite direttamente da Sogei.
Per questa esposizione si è ricevuto il requisito di esposizione con:
[PROFILE_NON_REPUDIATION_01] Profilo per la non ripudiabilità della trasmissione

Tale profilo garantisce:
* integrità del messaggio
* autenticazione del fruitore, quale organizzazione o unità organizzativa fruitore quale mittente del contenuto
* conferma da parte dell’erogatore della ricezione del contenuto
* opponibilità ai terzi
* robustezza della trasmissione

Per questo profilo sarà previsto il tracciamento opponibile ai terzi delle seguenti informazioni:
* Agid-JWT-Signature sia della request che della response 
* Intero payload sia della request che della response 


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