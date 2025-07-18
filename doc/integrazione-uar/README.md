**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST UAR**


| Versione | : | 1.0 |
|----------|---|---------|

**INDICE**

- [1. Introduzione](#1-introduzione)
  - [1.1. Riferimenti](#11-riferimenti)
  - [1.2. Acronimi e Definizioni](#12-acronomi-e-definizioni)
  - [1.3. Registro modifiche](#13-registro-modifiche)
- [2. Contesto di Riferimento](#2-contesto-di-riferimento)
  - [2.1. Pattern di Interazione](#21-pattern-di-interazione)
  - [2.2. Processo di Autenticazione](#22-processo-di-autenticazione3)
  - [2.3. Note su autenticazione e token JWT](#23-note-su-autenticazione-e-token-jwt)
- [3. Servizio di Creazione Documento](#3-servizio-di-creazione-documento)
  - [3.1. Request](#31-request)
    - [Parametri Path](#parametri-path)
    - [Parametri Body (SendToUarDocumentRequestDTO)](#parametri-body-sendtouardocumentrequestdto)
    - [3.1.1. Esempio di richiesta](#311-esempio-di-richiesta)
  - [3.2. Response](#32-response)
    - [3.2.1. Esempio risposta 201](#321-esempio-risposta-201)
    - [3.2.2. Messaggio di Risposta con esito KO 400](#322-messaggio-di-risposta-con-esito-ko-400)
- [4. Servizio di Eliminazione Documento](#4-servizio-di-eliminazione-documento)
  - [4.1. Request](#41-request)
    - [4.1.1. Esempio di richiesta](#411-esempio-di-richiesta)
  - [4.2. Response](#42-response)
    - [4.2.1. Esempio risposta 200](#421-esempio-risposta-200)
    - [4.2.2. Esempio di Messaggio di Risposta con esito KO 404](#422-esempio-di-messaggio-di-risposta-con-esito-ko-404)
- [5. Servizio di Sostituzione Documento](#5-servizio-di-sostituzione-documento)
  - [5.1. Request](#51-request)
    - [5.1.1. Esempio di richiesta](#511-esempio-di-richiesta)
  - [5.2. Response](#52-response)
    - [5.2.1. Esempio risposta 200](#521-esempio-risposta-200)
    - [5.2.2. Esempio di Messaggio di Risposta con esito KO 404](#522-esempio-di-messaggio-di-risposta-con-esito-ko-404)
- [6. Servizio di Aggiornamento Metadati](#6-servizio-di-aggiornamento-metadati)
  - [6.1. Request](#61-request)
    - [6.1.1. Esempio di richiesta](#611-esempio-di-richiesta)
  - [6.2. Response](#62-response)
    - [6.2.1. Esempio risposta 200](#621-esempio-risposta-200)
    - [6.2.2. Esempio di Messaggio di Risposta con esito KO 404](#622-esempio-di-messaggio-di-risposta-con-esito-ko-404)
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
| 1.0      | 2025-07-18     | Creazione del documento                                                                |

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

**Creazione Documento**
Il flusso di creazione consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, il bundle verrà memorizzato in modo asincrono sul server FHIR indicato.

**Sostituzione Documento FHIR**
Il flusso di sostizuone consente di ricevere in input un Bundle FHIR conforme allo standard HL7, al fine di consentirne la presa in carico da parte del sistema UAR. Successivamente, verrà eseguita una ricerca rispetto al master identifier che assicura che il documento si trova effettivamente sul server FHIR e poi tale documento viene rimpiazzato.

**Cancellazione Documento FHIR**

Il flusso di cancellazione consente la rimozione di un documento pubblicato, identificato tramite masterIdentifier, dal server FHIR.
L’eliminazione delle risorse avviene in modalità sincrona.

**Aggiornamento Document FHIR**

Questa funzionalità consente di aggiornare i metadati associati a un documento già pubblicato sul FHIR Server, senza modificarne il contenuto clinico.
L’operazione aggiorna la risorsa DocumentReference all’interno del Bundle FHIR, in modalità completamente sincrona.
Anche in questo caso, il documento viene identificato tramite masterIdentifier.

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

# 3. Servizio di Creazione Documento

L’obiettivo di questa API è aggiungere un documento alla base dati di staging MongoDB per la successiva pubblicazione sul FHIR Server regionale.

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

#### Parametri Body (SendToUarDocumentRequestDTO)

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| fhirServerUrl | string | true     |
| identifier    | string | true     |
| operation     | string | false    |
| jsonString    | string | true     |
| rda           | string | true     |

La compilazione errata dei parameter oppure la non compilazione dei parameter “required” comporta un errore di tipo bloccante.

### 3.1.1. Esempio di richiesta

```bash
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
    "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}"
}'
```

---

## 3.2. Response

| STATUS | SIGNIFICATO                               | TIPO                   |
|--------|-------------------------------------------|------------------------|
| 201    | Documento creato con successo             | application/json       |
| 500    | Errore interno del server                 | application/problem+json |

#### Esempio risposta 201

```json
{
  "traceID": "c2e1818fbf7aea7f",
  "spanID": "c2e1818fbf7aea7f",
  "result": true
}
```

### 3.2.2. Messaggio di Risposta con esito KO 500

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

Questa API consente di eliminare un documento già pubblicato utilizzando l'identifier.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/identifier/{identifier}/rda/{rda}?fhirServerUrl={url}
```

## 4.1. Request

| METHOD | URL |
|--------|-----|
| DELETE | `/v1/document/identifier/{identifier}/rda/{rda}` |

#### Parametri Path

| KEY        | IN   | TYPE   | REQUIRED |
|------------|------|--------|----------|
| identifier | path | string | true     |
| rda        | path | string | true     |

#### Parametri Query

| KEY           | IN     | TYPE   | REQUIRED |
|---------------|--------|--------|----------|
| fhirServerUrl | query  | string | true     |

### 4.1.1. Esempio di richiesta

```bash
curl -X 'DELETE' \
  'http://<HOST>:<PORT>/v1/document/identifier/2.16.840.1.113883.2.9.2.120.4.4^290700/rda/RDA001?fhirServerUrl=https://fhir.example.it' \
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

### 4.2.2. Esempio di Messaggio di Risposta con esito KO 404

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

Questa API consente di sovrascrivere un documento esistente nel MongoDB di staging.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/workflowinstanceid/{wii}/rda/{rda}
```

## 5.1. Request

| METHOD | URL |
|--------|-----|
| PUT    | `/v1/document/workflowinstanceid/{wii}/rda/{rda}` |

#### Parametri Path

| KEY | IN   | TYPE   | REQUIRED |
|-----|------|--------|----------|
| wii | path | string | true     |
| rda | path | string | true     |

#### Parametri Body (SendToUarDocumentRequestDTO)

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| fhirServerUrl | string | true     |
| identifier    | string | true     |
| operation     | string | true     | (`REPLACE`)
| jsonString    | string | true     |
| rda           | string | true     |

### 5.1.1. Esempio di richiesta

```bash
curl -X 'PUT' \
  'http://<HOST>:<PORT>/v1/document/workflowinstanceid/2.16.840.1.113883.2.9.2.120.4.4.97bb3fc5bee3032679f4f07419e04af6375baafa17024527a98ede920c6812ed/rda/RDA001' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <JWT_TOKEN>' \
  -H 'FSE-JWT-Signature: <JWT_SIGNATURE>' \
  -H 'Content-Type: application/json' \
  -d '{
    "fhirServerUrl": "https://fhir.example.it",
    "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
    "operation": "REPLACE",
    "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}",
    "rda": "RDA001"
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

### 5.2.2. Esempio di Messaggio di Risposta con esito KO 404

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

Consente di aggiornare i metadati di un documento già presente sul FHIR Server.

### Endpoint

```
http://<HOST>:<PORT>/v<major>/document/metadata/{rda}
```

## 6.1. Request

| METHOD | URL |
|--------|-----|
| PUT    | `/v1/document/metadata/{rda}` |

#### Parametri Path

| KEY | IN   | TYPE   | REQUIRED |
|-----|------|--------|----------|
| rda | path | string | true     |

#### Parametri Body (SendToUarDocumentRequestDTO)

| KEY           | TYPE   | REQUIRED |
|---------------|--------|----------|
| fhirServerUrl | string | true     |
| identifier    | string | true     |
| operation     | string | true     | (`UPDATE`)
| jsonString    | string | true     |
| rda           | string | true     |

### 6.1.1. Esempio di richiesta

```bash
curl -X 'PUT' \
  'http://<HOST>:<PORT>/v1/document/metadata/RDA001' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <JWT_TOKEN>' \
  -H 'FSE-JWT-Signature: <JWT_SIGNATURE>' \
  -H 'Content-Type: application/json' \
  -d '{
    "fhirServerUrl": "https://fhir.example.it",
    "identifier": "2.16.840.1.113883.2.9.2.120.4.4^290700",
    "operation": "UPDATE",
    "jsonString": "{\"resourceType\": \"DocumentReference\", \"status\": \"current\"}",
    "rda": "RDA001"
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
### 6.2.2. Esempio di Messaggio di Risposta con esito KO 404

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

<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità