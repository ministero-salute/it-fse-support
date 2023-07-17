**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST TERMINOLOGY SYSTEM**


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
- [2. Contesto di Riferimento](#2-contesto-di-riferimento)
  - [2.1. Pattern di Interazione](#21-pattern-di-interazione)
  - [2.2. Processo di Autenticazione\[^3\]](#22-processo-di-autenticazione3)
  - [2.3. Note su autenticazione e token JWT](#23-note-su-autenticazione-e-token-jwt)
- [3. Servizio di Upload Terminologie](#3-servizio-di-upload-terminologie)
  - [3.1. Request](#31-request)
    - [3.1.1. Esempio Request](#311-esempio-request)
  - [3.2. Response](#32-response)
    - [3.2.1. Esempio Messaggio di Risposta con esito OK 201](#321-esempio-messaggio-di-risposta-con-esito-ok-201)
    - [3.2.2. Esempio Messaggio di Risposta con esito KO 409](#322-esempio-messaggio-di-risposta-con-esito-ko-409)
- [4. Servizio di Cancellazione Terminologie](#4-servizio-di-cancellazione-terminologie)
  - [4.1. Request](#41-request)
    - [4.1.1. Esempio Request](#411-esempio-request)
  - [4.2. Response](#42-response)
    - [4.2.1. Esempio Messaggio di Risposta con esito OK 200](#421-esempio-messaggio-di-risposta-con-esito-ok-200)
    - [4.2.2. Esempio Messaggio di Risposta con esito KO 404](#422-esempio-messaggio-di-risposta-con-esito-ko-404)
- [5 Drilldown Parametri di Input](#5-drilldown-parametri-di-input)
  - [5.1 Campi contenuti nei JWT](#51-campi-contenuti-nei-jwt)
    - [5.1.1. Authentication Bearer](#511-authentication-bearer)
    - [5.1.2. FSE-JWT-Terminology](#512-fse-jwt-terminology)
    - [5.2. Drill down file input](#52-drill-down-file-input)
    - [5.2.1 Drill down custom csv](#521-drill-down-custom-csv)
    - [5.2.2 Drill down custom json](#522-drill-down-custom-json)
- [6. Drilldown Response in caso di Errore](#6-drilldown-response-in-caso-di-errore)
  - [6.1. Errori Applicativi](#61-errori-applicativi)
    - [6.2. Esempi di errore generati da Terminology](#62-esempi-di-errore-generati-da-terminology)
- [Notes](#notes)


# 1. Introduzione

## 1.1. Riferimenti

| TOOL | LINK                                                                   | DESCRIPTION                       |
| ---- | ---------------------------------------------------------------------- | --------------------------------- |
| 1    | [Supporto FSE 2.0](https://github.com/ministero-salute/it-fse-support) | Pagina di Supporto GitHub FSE 2.0 |

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
   <td>Representational State Transfer
   </td>
  </tr>
  <tr>
   <td>JWT
   </td>
   <td>JSON Web Token
   </td>
  </tr>
  <tr>
   <td>FSE
   </td>
   <td>Fascicolo Sanitario Elettronico
   </td>
  </tr>
  <tr>
   <td>FTS
   </td>
   <td>FSE Terminology system
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
   <td>1.0
   </td>
   <td>18/07/23
   </td>
   <td>Paragrafi modificati
<p>
Tutti: prima stesura
   </td>
  </tr>
</table>


_Tabella 3: Registro Modifiche_


# 2. Contesto di Riferimento
La nuova architettura del terminology system prevede la presenza di un componente, terminology server, che implementa lo standard HL7 Fhir per consentire l'integrazione con i sistemi sanitari elettronici. 
Ciò è fatto attraverso l'utilizzo di tre tipi di metadata resource:
 - **Codesystem**
 - **Valueset**
 - **Conceptmap** 

Il caricamento e il recupero di tali risorse può essere fatto sia in maniera standard (ovvero accedendo direttamente al terminology-server), sia in maniera custom(facilitata) attraverso alcune api esposte, illustrate di seguito in questo documento, in particolare verranno dettagliate le modalità attraverso cui è possibile usufruire dei servizi esposti dal terminology system.

Il documento sarà redatto in maniera incrementale e di volta in volta ulteriori API saranno integrate e illustrate.

In questa fase vengono trattati i due servizi principali, che consentono rispettivamente di invocare le funzionalità di upload e di eliminazione terminologie.

| Endpoint URL                    | Metodo | Funzionalità        |
| ------------------------------- | ------ | ------------------- |
| /v1/terminology/{format}        | POST   | UPLOAD TERMINOLOGIE |
| /v1/terminology/{oid}/{version} | DELETE | DELETE TERMINOLOGIE |

_Tabella 4: Endpoint/Funzionalità_

<br/>

L'endpoint del **sistema di test** è: 

```https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/terminology/v1```

<br/>

**Upload terminologie**:

L'API di caricamento terminologie fornisce un servizio che semplifica il processo di caricamento di terminologie sul Terminology Server, infatti gli utenti possono facilmente caricare terminologie in diversi formati, inclusi il formato FHIR (FHIR_R4_XML, FHIR_R4_JSON) e formati personalizzati come [CSV](#521-drill-down-custom-csv) o [JSON](#522-drill-down-custom-json).
Questo processo agevola l'integrazione e la gestione delle terminologie nel sistema, grazie ad alcune facilitazioni e opzioni di formato diverse.
<br/>

**Delete terminologie**:

L'API di cancellazione consente agli utenti di eliminare metadata resource dal server terminologico in modo tramite l'identificatore del dizionario (OID) e l'identificatore della versione (Version).

Al termine della richiesta di eliminazione, il server restituirà una risposta che indicherà se la cancellazione è avvenuta con successo o se si sono verificati eventuali errori nel processo.

<br/>


## 2.1. Pattern di Interazione

Le API sono esposte secondo i pattern definiti nelle Linee Guida Modello di Interoperabilità[^1] definite da Agid.

Come scenario di interazione per i servizi esposti viene utilizzato il pattern [BLOCK_REST] Blocking REST[^2]<sup>.</sup>

<br>

## 2.2. Processo di Autenticazione[^3]

Il processo di autenticazione rispetta i seguenti pattern delle suddette Linee Guida:

* ID_AUTH_CHANNEL_02 [^4]

* ID_AUTH_REST_01 [^5]

<br>

## 2.3. Note su autenticazione e token JWT

Per comunicare con le API di authoring esposte dal microservizio **it-fse-srv-dictionary** è necessario essere in possesso di 2 certificati X.509 e delle rispettive chiavi private.

Il certificato denominato di **“autenticazione”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> come certificato client per le chiamate https.

Il certificato denominato di **“signature”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> per la firma dei token JWT.

Ogni invocazione delle API avverrà quindi con una chiamata https protetta dal certificato di autenticazione e **conterrà negli header 2 token JWT**, firmati con il certificato di **"signature"**.

Il primo JWT è utilizzato per l’autenticazione e contiene i riferimenti all’utente che richiama il servizio, il token viene trasportato nell’header **“Authorization”** di tipo **“Bearer”**:

```
Authorization: Bearer {VALORE DEL TOKEN}
```

Il secondo JWT è di “signature” e contiene rifermenti al file oggetto dell'operazione, il token viene trasportato nell’header http **“FSE-JWT-Terminology**:

```
FSE-JWT-Terminology: {VALORE DEL TOKEN}
```


**Entrambi** i token devono essere firmati utilizzando il certificato “signature”.

Per i dettagli sui campi dei token si consulti l’apposito [paragrafo](#511-authentication-bearer).

<br>

# 3. Servizio di Upload Terminologie
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità.

L’Endpoint si compone come segue:

```
https://<HOST>:<PORT>/v<major>/terminology/{format}
```

Lo scopo di questa API è quello di permettere il caricamento delle terminologie sul terminology server utilizzando diversi formati,
in particolare: 
- CUSTOM_CSV 
- CUSTOM_JSON
- FHIR_JSON
- FHIR_XML


## 3.1. Request

| METHOD | POST                     |
| ------ | ------------------------ |
| URL    | /v1/terminology/{format} |

_Tabella 5: Method, Url, Type_

<br>
 
<table>
  <tr>
   <td colspan="6" ><strong>PARAMETER</strong></td>
  </tr>
  <tr>
   <td><strong>SECTION</strong></td>
   <td><strong>KEY</strong></td>
   <td><strong>VALUE</strong></td>
   <td><strong>TYPE</strong></td>
   <td><strong>REQUIRED</strong></td>
  </tr>
  <tr>
   <td>Header</td>
   <td>Authorization</td>
   <td>N.D.</td>
   <td>Bearer</td>
   <td>true</td>
  </tr>
  <tr>
   <td>Header</td>
   <td>FSE-JWT-Terminology</td>
   <td>N.D.</td>
   <td>N.D.</td>
   <td>true</td>
  </tr>
  <tr>
   <td>Header</td>
   <td>Accept</td>
   <td>application/json</td>
   <td>String</td>
   <td>true</td>
  </tr>
  <tr>
   <td rowspan="1">Path variable</td>
   <td>format</td>
   <td>format</td>
   <td>FormatEnum</td>
   <td>true</td>
  </tr>
  <tr>
   <td rowspan="6" >Request<p>Body</td>
   <td>file</td>
   <td>file</td>
   <td>MultipartFile</td>
   <td>true</td>
  </tr>
<tr>
   <td rowspan="5">creationInfo*</span></td>
   <td>oidName</td>
   <td>String</td>
   <td>true</td>
</tr>
  <tr>
   <td>version</td>
   <td>String</td>
   <td>true</td>
  </tr>
  <tr>
   <td>url</td>
   <td>String</td>
   <td>true</td>
  </tr>
   <tr>
   <td>oid</td>
   <td>String</td>
   <td>true</td>
  </tr>
  </tr>
   <tr>
   <td>type</td>
   <td>TypeEnum</td>
   <td>true</td>
  </tr>
</table>

_Tabella 6: Endpoint - Descrizione parametri_

<br>

La compilazione errata dei parametri o la mancata compilazione dei parametri "required" comporta un errore di tipo bloccante.
Il request body è di tipo multipart/form-data e contiene i seguenti parametri:

- **file**: Questo parametro deve contenere un file in linea a quanto specificato nel campo format in path param.

- **creationInfo***: Questo parametro contiene metadati di supporto per CUSTOM_CSV e CUSTOM_JSON.

**N.B<span style="color: red;">**: la parte creationInfo è obbligatoria solo nel caso in cui viene scelto come format un CSV o un JSON.


<table>
  <tr>
   <td colspan="6" ><strong>FORMAT ENUM</strong></td>
  </tr>
  <tr>
   <td><strong>CODICE</strong></td>
   <td><strong>VALORE</strong></td>
   <td><strong>DESCRIZIONE</strong></td>
  </tr>
  <tr>
   <td>CUSTOM_CSV</td>
   <td>.csv</td>
   <td>Custom CSV</td>
  </tr>
  <tr>
   <td>CUSTOM_JSON</td>
   <td>.json</td>
   <td>Custom JSON</td>
  </tr>
  <tr>
   <td>FHIR_R4_XML</td>
   <td>.xml</td>
   <td>FHIR Release 4 XML</td>
  </tr>
  <tr>
   <td>FHIR_R4_JSON</td>
   <td>.json</td>
   <td>FHIR Release 4 JSON</td>
  </tr>
</table>

_Tabella 7: FormatEnum_

<br>

<table>
  <tr>
   <td colspan="6" ><strong>TYPE ENUM</strong></td>
  </tr>
  <tr>
   <td><strong>CODICE</strong></td>
   <td><strong>VALORE</strong></td>
   <td><strong>DESCRIZIONE</strong></td>
  </tr>
  <tr>
   <td>CODE_SYSTEM</td>
   <td>CODE_SYSTEM</td>
   <td>Code system</td>
  </tr>
</table>

_Tabella 8: TypeEnum_

### 3.1.1. Esempio Request

Esempio request di upload file con format CUSTOM_CSV.

``` bash
curl -X 'POST' \
  'http://<HOST>:<PORT>/v<major>/terminology/CUSTOM_CSV' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Terminology: <token>' \
  -H 'Content-Type: multipart/form-data' \
  -F 'creationInfo={
    "oidName": "<OIDNAME>",
    "version": "<VERSION>",
    "url": "<URL>",
    "oid": "<OID>",
    "type": "<TYPE_ENUM>"
}' \
  -F 'file=@code-system.csv;type=text/csv'
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
   <td rowspan="14" >STATUS CODE
   </td>
   <td> 201
   </td>
   <td>Documenti caricati correttamente
   </td>
  </tr>
  <tr>
   <td>400
   </td>
   <td>Bad request (input non valido)
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
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>


_Tabella 9: Response Servizio di Upload terminologie_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 6 “Drilldown Error Response”.

<br>

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
   <td>Identificativo univoco assegnato ad un singolo operazione della richiesta dell'utente. In caso di richiesta avente operazioni multiple (su più microservizi), ognuna di esse avrà un differente spanId (ma stesso traceId).
traceId e spanId coincidono nella prima operazione.
   </td>
  </tr>
</table>

_Tabella 10: Campi Response sempre valorizzati_

<br>

**Campi valorizzati in caso di Success**

<table>
  <tr>
   <td><strong>FIELD</strong></td>
   <td><strong>TYPE</strong></td>
   <td><strong>DESCRIPTION</strong></td>
  </tr>
  <tr>
   <td>location</td>
   <td>String</td>
   <td>Puntamento della risorsa creata</td>
  </tr>
  <tr>
   <td>insertedItems</td>
   <td>Integer</td>
   <td>Numero degli elementi inseriti</td>
  </tr>
</table>

_Tabella 11: Campi Response valorizzati in caso di success_

<br>

  
### 3.2.1. Esempio Messaggio di Risposta con esito OK 201

```json
{
  "traceID": "f52aa9db64d0bea0",
  "spanID": "f52aa9db64d0bea0",
  "location": "Codesystem/<ID>",
  "insertedItems": "3"
}
```

### 3.2.2. Esempio Messaggio di Risposta con esito KO 409

``` json
{
  "traceID": "56aacc4b8186e711",
  "spanID": "8628d4adb9349552",
  "type": "/errors/conflict",
  "title": "Conflict",
  "detail": "CodeSystem già esistente con oid <OID> e version <VERSION>",
  "status": 409,
  "instance": "/conflict"
}
```

# 4. Servizio di Cancellazione Terminologie
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità.

L’Endpoint del caso d’uso di creazione massiva si compone come segue:

```
https://<HOST>:<PORT>/v<major>/terminology/{oid}/{version}
```

Lo scopo di questa API è quello di consentire l'eliminazione di una terminologia dato il suo id e la sua version.


## 4.1. Request

| METHOD | POST                            |
| ------ | ------------------------------- |
| URL    | /v1/terminology/{oid}/{version} |
| TYPE   | application/json                |

_Tabella 12: Method, Url, Type_

<br>
 
<table>
  <tr>
   <td colspan="5" align="center" ><strong>PARAMETER</strong></td>
  </tr>
  <tr>
   <td><strong>SECTION</strong></td>
   <td><strong>KEY</strong></td>
   <td><strong>VALUE</strong></td>
   <td><strong>TYPE</strong></td>
   <td><strong>REQUIRED</strong></td>
  </tr>
  <tr>
   <td>Header</td>
   <td>Authorization</td>
   <td>N.D.</td>
   <td>Bearer</td>
   <td>true</td>
  </tr>
  <tr>
   <td>Header</td>
   <td>FSE-JWT-Terminology</td>
   <td>N.D.</td>
   <td>N.D.</td>
   <td>true</td>
  </tr>
  <tr>
   <td>Header</td>
   <td>Accept</td>
   <td>application/json</td>
   <td>String</td>
   <td>true</td>
  </tr>
  <tr>
   <td rowspan="5" >Path<p>Variable</td>
   <tr>
      <td>oid</td>
      <td>oid</td>
      <td>String</td>
      <td>true
      </td>
   </tr>
   <tr>
      <td>version</td>
      <td>version</td>
      <td>String</td>
      <td>true
      </td>
   </tr>
  </tr>
   
  </tr>
</table>

_Tabella 13: Endpoint - Descrizione parametri_

Il parametro `oid` e `version` identificano una "chiave primaria" della terminologia che si intende eliminare sul terminology-server

<br>

### 4.1.1. Esempio Request

Esempio request eliminazione terminologia.

``` bash
curl -X 'DELETE' \
  'http://<HOST>:<PORT>/v<major>/terminology/<OID>/<VERSION>' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Terminology: <token>'
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
   <td>TIPO IN CASO DI ERRORE*</td>
   <td colspan="2" >application/problem+json</td>
  </tr>
  <tr>
   <td rowspan="14" >STATUS CODE</td>
   <td>200</td>
   <td>Documenti cancellati correttamente</td>
  </tr>
  <tr>
   <td>400
   </td>
   <td>Bad request (input non valido)</td>
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
   <td>415</td>
   <td>Unsupported media type</td>
  </tr>
  <tr>
   <td>429</td>
   <td>Too Many Requests</td>
  </tr>
  <tr>
   <td>500</td>
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
   <td>503
   </td>
   <td>Service unavailable
   </td>
  </tr>
  <tr>
   <td>504
   </td>
   <td>Endpoint request timed-out
   </td>
  </tr>
</table>

_Tabella 14: Response Servizio di Alimentazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 6 “Drilldown Error Response”.

<br>

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
   <td>Identificativo univoco assegnato ad un singolo operazione della richiesta dell'utente. In caso di richiesta avente operazioni multiple (su più microservizi), ognuna di esse avrà un differente spanId (ma stesso traceId).
traceId e spanId coincidono nella prima operazione.
   </td>
  </tr>
</table>

_Tabella 15: Campi Response sempre valorizzati_

<br>

<br>

**Campi valorizzati in caso di success**

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
   <td>deletedItems
   </td>
   <td>Integer
   </td>
   <td>Numero di elementi eliminati
   </td>
  </tr>
</table>

_Tabella 16: Campi Response sempre valorizzati_

<br>

### 4.2.1. Esempio Messaggio di Risposta con esito OK 200

```json
{
  "traceID": "95c0e4c28706b3f3",
  "spanID": "95c0e4c28706b3f3",
  "deletedItems": 3
}
```

### 4.2.2. Esempio Messaggio di Risposta con esito KO 404

``` json
{
  "traceID": "e18d321733ae74ab",
  "spanID": "e18d321733ae74ab",
  "type": "/msg/resource",
  "title": "Errore risorsa",
  "detail": "Il documento richiesto non esiste",
  "status": 404,
  "instance": "/not-found"
}
```

<br>

# 5 Drilldown Parametri di Input

## 5.1 Campi contenuti nei JWT

Come specificato nel Capitolo 2.3, ogni invocazione API necessita di due header JWT:

<br> 

### 5.1.1. Authentication Bearer

Il token JWT denominato `Authentication Bearer` è un token di autenticazione, composto dai seguenti Header e Reserved Claims.

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
   <td>certificato X.509 utilizzato per la firma del token. Array di valori in formato DER, codificati in base64.
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
  </table>

_Tabella 17: Campi Authentication Bearer_

<br>

<table>
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
   <td><code>jti</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>AUDIENCE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Indica il destinatario per cui è stato creato il token, da valorizzare con la base URL del servizio, comprensivo della versione
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/terminology/v1
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
   <td>
<p>
Codice Fiscale dell’utente che fa richiesta del servizio di interoperabilità.
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>VRDMRC67T20I257E</td>
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

_Tabella 18: Campi contenuti in Authentication Bearer Token_

<br>

### 5.1.2. FSE-JWT-Terminology
Il token JWT denominato `FSE-JWT-Terminology` è un token applicativo composto dai seguenti Header e Reserved Claims

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
   <td>certificato X.509 utilizzato per la firma del token. Array di valori in formato DER, codificati in base64.
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
   <td><code>jti</code>
   </td>
  </tr>
  <tr>
   <td colspan="2"  style="text-align:center"><strong>AUDIENCE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Indica il destinatario per cui è stato creato il token, da valorizzare con la base URL del servizio, comprensivo della versione
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/terminology/v1
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
   <td>Codice Fiscale dell’utente che fa richiesta del servizio di interoperabilità.
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>VRDMRC67T20I257E</td>
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

_Tabella 19: Campi contenuti nel business Token_

<br>

<table>
  <tr>
   <td colspan="2"><strong>CUSTOM CLAIMS</strong></td>
  </tr>
  <tr>
   <td colspan="2" style="text-align:center"><strong>OID TERMINOLOGIA</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong></td>
   <td>Identifica l'oid per cui si vuole effettuare una richiesta di creazione/eliminazione</td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong></td>
   <td>urn:oid:2.16.840.1.113883.5.1</td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong></td>
   <td>Obbligatorio sia per l'endpoint di upload che delete. In particolare per la creazione, viene sempre controllata la presenza, in più nel caso in cui si sceglie un format CUSTOM_CSV o CUSTOM_JSON viene anche controllato il valore</td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong></td>
   <td><code>oid</code></td>
  </tr>
  <tr>
   <td colspan="2" style="text-align:center"><strong>VERSION</strong></td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong></td>
   <td>Identifica la version della terminologia per la quale si vuole richiedere una creazione/cancellazione</td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong></td>
   <td>2.1.0</td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong></td>
   <td>Obbligatorio sia per l'endpoint di upload che delete. In particolare per la creazione, viene sempre controllata la presenza, in più nel caso in cui si sceglie un format CUSTOM_CSV o CUSTOM_JSON viene anche controllato il valore</td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td><code>version</code>
   </td>
  </tr>

  <tr>
   <td colspan="2" style="text-align:center"><strong>HASH FILE</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong></td>
   <td>Identifica l'hash sha 256 del file per il quale si intende fare upload</td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong></td>
   <td>ccd1a23b4a73c838e4dfc2a1948aaec8389ebd331cbaebc1b3144c74fca17da5</td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong></td>
   <td>Obbligatorio solo per l'endpoint di upload.</td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong></td>
   <td><code>hash_file</code></td>
  </tr>
</table>

_Tabella 20: Campi contenuti in FSE-JWT-Terminology_

**Esempio di utilizzo del token bearerAuth**

```
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5c ... iZPqKv3kUbn1qzLg
```

**Esempio di token decodificato, sezione header**

```json
{
  "alg": "RS256",
  "typ": "JWT",
  "x5c": [
    "MIIDXjCCAkagAwIBAgIBAjANBgkqhkiG9w ... 779BM4SOI="
  ]
}
```

**Esempio di Payload del token FSE-JWT-Terminology decodificato in caso di upload terminologie**
```json

{
  "alg": "RS256",
  "typ": "JWT",
  "kid": "0",
  "x5c": "MIIDBzCCAe+gAwIBAgIJAIBJZQZQX4ZmMA0GCSqGSIb3DQEBC[...]",
  "sub": "PROVAX00X00X000Y",
  "aud": "https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/terminology/v1",
  "file_hash":  "d98d66e46b1333ddb548e55a086c0153b1a691f2c4f38e62067ad4ca77bfd8f8",
  "iss": "integrity:S1#190201234567PR",
  "oid": "urn:oid:2.16.840.1.113883.5.1",
  "exp": 1689697549,
  "iat": 1689611149,
  "version": "2.1.0",
  "jti": "1689611149"
}
```
**Esempio di Payload del token FSE-JWT-Terminology decodificato in caso di eliminazione terminologie**
```json
{
  "alg": "RS256",
  "typ": "JWT",
  "kid": "0",
  "x5c": "MIIDBzCCAe+gAwIBAgIJAIBJZQZQX4ZmMA0GCSqGSIb3DQEBC[...]",
  "sub": "PROVAX00X00X000Y",
  "aud": "https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/terminology/v1",
  "iss": "integrity:S1#190201234567PR",
  "oid": "urn:oid:2.16.840.1.113883.5.1",
  "exp": 1689697549,
  "iat": 1689611149,
  "version": "2.1.0",
  "jti": "1689611149"
}
```

### 5.2. Drill down file input
Di seguito si vuole dare una panoramica dei diversi formati accettati dall'api di authoring in particolare csv e json custom

### 5.2.1 Drill down custom csv
Di seguito viene mostrato il formato del csv per il caricamento di un Codesystem:

<table>
  <tr>
    <th>is-a</th>
    <th>code</th>
    <th>display</th>
  </tr>
  <tr>
    <td></td>
    <td>F</td>
    <td>Female</td>
  </tr>
  <tr>
    <td></td>
    <td>M</td>
    <td>Male</td>
  </tr>
  <tr>
    <td></td>
    <td>UN</td>
    <td>Undifferentiated</td>
  </tr>
</table>

_Tabella 21: Esempio custom csv file_

### 5.2.2 Drill down custom json
Di seguito viene mostrato il formato del json per il caricamento di un Codesystem:

```json
[
  {
    "code": "F",
    "description": "Female"
  },
  {
    "code": "M",
    "description": "Male"
  },
  {
    "code": "UN",
    "description": "Undifferentiated"
  }
]
```

# 6. Drilldown Response in caso di Errore

Il Terminology service genererà due tipologie di errore distinte, entrambe aderenti alla specifica RFC 7807.


## 6.1. Errori Applicativi

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

_Tabella 22: Campi Response valorizzati in caso di errore_

### 6.2. Esempi di errore generati da Terminology
| TYPE                | TITLE                 | DETAIL                        | STATUS | INSTANCE     |
| ------------------- | --------------------- | ----------------------------- | ------ | ------------ |
| /errors             | Errore Generico.      | {dinamico in base all’errore} | 500    | /generic     |
| /errors/fields      | Missing.              | {dinamico in base all’errore} | 400    | /mandatory   |
| /errors/fields      | Valore errato.        | {dinamico in base all’errore} | 400    | /mandatory   |
| /errors/fields      | Token jwt errato      | {dinamico in base all’errore} | 400    | /mandatory   |
| /msg/resource       | Errore risorsa        | {dinamico in base all’errore} | 404    | /not-found   |
| /msg/resource       | Errore risorsa        | {dinamico in base all’errore} | 409    | /conflict    |
| /errors             | Timeout.              | Errore di timeout             | 504    | /timeout     |

_Tabella 23: stati response_

<!-- Footnotes themselves at the bottom. -->
# Notes

[^1]: Linee Guida Modello di Interoperabilità: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità
