**FASCICOLO SANITARIO ELETTRONICO 2.0**

**INTERFACCE REST Provisioning**


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
- [3. Servizio di Restituzione Profili](#3-servizio-di-restituzione-profili)
  - [3.1. Request](#31-request)
    - [3.1.1. Esempio Request](#311-esempio-request)
  - [3.2. Response](#32-response)
    - [3.2.1. Esempio Messaggio di Risposta con esito OK 200](#321-esempio-messaggio-di-risposta-con-esito-ok-200)
    - [3.2.2. Esempio Messaggio di Risposta con esito KO 404](#322-esempio-messaggio-di-risposta-con-esito-ko-404)
- [4. Servizio di Creazione massiva certificati](#4-servizio-di-creazione-massiva-certificati)
  - [4.1. Request](#41-request)
    - [4.1.1. Esempio Request](#411-esempio-request)
  - [4.2. Response](#42-response)
    - [4.2.1. Esempio Messaggio di Risposta con esito OK 200](#421-esempio-messaggio-di-risposta-con-esito-ok-200)
    - [4.2.2. Esempio Messaggio di Risposta con esito KO 400](#422-esempio-messaggio-di-risposta-con-esito-ko-400)
- [5. Servizio di Download massivo certificati](#5-servizio-di-download-massivo-certificati)
  - [5.1. Request](#51-request)
    - [5.1.1. Esempio di download massivo](#511-esempio-di-download-massivo)
  - [5.2. Response](#52-response)
    - [5.2.1. Esempio Messaggio di Risposta con esito OK 200](#521-esempio-messaggio-di-risposta-con-esito-ok-200)
    - [5.2.2. Esempio Messaggio di Risposta con esito KO 404](#522-esempio-messaggio-di-risposta-con-esito-ko-404)
    - [5.2.3. Esempio Messaggio di Risposta con esito OK 206](#523-esempio-messaggio-di-risposta-con-esito-ok-206)
- [6. Servizio di Rinnovo massivo certificati](#6-servizio-di-rinnovo-massivo-certificati)
  - [6.1. Request](#61-request)
    - [6.1.1. Esempio di rinnovo di certificati](#611-esempio-di-rinnovo-di-certificati)
  - [6.2. Response](#62-response)
    - [6.2.1. Esempio Messaggio di Risposta con esito OK 200](#621-esempio-messaggio-di-risposta-con-esito-ok-200)
    - [6.2.2. Esempio Messaggio di Risposta con esito KO 400](#622-esempio-messaggio-di-risposta-con-esito-ko-400)
- [7. Servizio di Revoca massiva certificati](#7-servizio-di-revoca-massiva-certificati)
  - [7.1. Request](#71-request)
    - [7.1.1. Esempio di revoca massiva con uuid](#711-esempio-di-revoca-massiva-con-uuid)
    - [7.1.2. Esempio di revoca massiva con lista di certificati](#712-esempio-di-revoca-massiva-con-lista-di-certificati)
  - [7.2. Response](#72-response)
    - [7.2.1. Esempio Messaggio di Risposta con esito OK 200](#721-esempio-messaggio-di-risposta-con-esito-ok-200)
    - [7.2.2. Esempio Messaggio di Risposta con esito KO 404](#722-esempio-messaggio-di-risposta-con-esito-ko-404)
- [8. Servizio di Recupero massivo certificati](#8-servizio-di-recupero-massivo-certificati)
  - [8.1. Request](#81-request)
    - [8.1.1. Esempio di recupero massivo](#811-esempio-di-recupero-massivo)
  - [8.2. Response](#82-response)
    - [8.2.1. Esempio Messaggio di Risposta con esito OK 200](#821-esempio-messaggio-di-risposta-con-esito-ok-200)
    - [8.2.2. Esempio Messaggio di Risposta con esito KO 404](#822-esempio-messaggio-di-risposta-con-esito-ko-404)
- [9 Drilldown Parametri di Input](#9-drilldown-parametri-di-input)
  - [9.1 Campi contenuti nei JWT](#91-campi-contenuti-nei-jwt)
    - [9.1.1. Authentication Bearer](#911-authentication-bearer)
    - [9.1.2. FSE-JWT-Provisioning](#912-fse-jwt-provisioning)
- [10. Drilldown Response in caso di Errore](#10-drilldown-response-in-caso-di-errore)
  - [10.1. Errori Applicativi](#101-errori-applicativi)
    - [10.2. Esempi di errore generati da Provisioning](#102-esempi-di-errore-generati-da-provisioning)
- [11. Drilldown Creazione CSR](#11-drilldown-creazione-csr)
- [12. Drilldown Invocazione Gateway](#12-drilldown-invocazione-gateway)
- [Notes](#notes)


# 1. Introduzione

## 1.1. Riferimenti

| TOOL | LINK                                                                   | DESCRIPTION                       |
| ---- | ---------------------------------------------------------------------- | --------------------------------- |
| 1    | [Linee Guida Architetturali del Fascicolo Sanitario Elettronico 2.0](https://www.gazzettaufficiale.it/eli/id/2022/07/11/22A03961/sg)      | Linee guida FSE 2.0               |
| 2    | [Supporto FSE 2.0](https://github.com/ministero-salute/it-fse-support) | Pagina di Supporto GitHub FSE 2.0 |

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
   <td>N.A.
   </td>
   <td>Non Applicabile
   </td>
  </tr>
 <tr>
   <td>M2M
   </td>
   <td>Machine to Machine
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
   <td>30/03/23
   </td>
   <td>Paragrafi modificati
<p>
Tutti: prima stesura
   </td>
  </tr>
</table>


_Tabella 3: Registro Modifiche_


# 2. Contesto di Riferimento
La piattaforma di Provisioning consente ai fornitori l'ottenimento di certificati di autenticazione (AUTH) e di firma (SIGN) per consentirne la comunicazione con il sistema FSE 2.0.

L'applicazione fornisce gli strumenti di authoring alla gestione massiva dei certificati attraverso un approccio machine-to-machine (M2M). Il fatto che le interfacce siano pensate per lavorare su grandi quantità di certificati non toglie che è possibile invocare le API anche per la gestione di singoli certificati.

Attualmente vengono esposti i seguenti servizi:

| Endpoint URL                              | Metodo | Funzionalità                  |
|--------------------------------           | ------ | ----------------------------- |
| /v1/certificate/profile                   | GET    | RESTITUZIONE PROFILI          |
| /v1/certificate/create/multi              | POST   | CREAZIONE MASSIVA CERTIFICATI |
| /v1/certificate/download/multi/{uuid}     | GET    | DOWNLOAD MASSIVO CERTIFICATI  |
| /v1/certificate/revoke/multi              | POST   | REVOCA MASSIVA CERTIFICATI    |
| /v1/certificate/renew/multi               | POST   | RINNOVO MASSIVO CERTIFICATI   |
| /v1/certificates/multi                    | GET    | RECUPERO MASSIVO CERTIFICATI  |

_Tabella 4: Endpoint/Funzionalità_

<br/>

L'endpoint del **sistema di test** è: 

```https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/provisioning/v1```

<br/>

**Restituzione Profili**:

Il servizio permette di recuperare i diversi profili per l'utente chiamante; In particolare tramite il campo **sub** del jwt valorizzato con il codice fiscale dell'utente il servizio restituirà l'elenco di tutti gli id memorizzati con i rispettivi ruoli.

<br/>

**Creazione massiva certificati**:

Il servizio consente la creazione di un set di certificati e fornirà in risposta un uuid che identifica univocamente la richiesta effettuata.
Per effettuare la richiesta occorre specificare le informazioni relative all'utente creatore, l'id del suo profilo e la lista delle CSR dei certificati da creare.

<br/>

**Download massivo certificati**:

Questo servizio consente di effettuare il download di tutti i certificati creati da una richiesta massiva utilizzando l'uuid ottenuto in fase di creazione. Il download fornità un file zip contenente tutte le coppie di certificati.

<br/>

**Revoca massiva certificati**:

Il servizio consente di effettuare la revoca massiva di certificati tramite due modalità differenti.
Fornendo l'uuid ottenuto in fase di creazione massiva è possibile revocare l'intero blocco di certificati.
Fornendo invece la lista di cn(AUTH e SIGN) è possibile revocare puntualmente i diversi certificati.

<br/>

**Rinnovo massivo certificati**:

Il servizio consente di effettuare un rinnovo di tutti i certificati creati con una richiesta massiva specificando le nuove csr e i relativi distinguishedName dei certificati da rinnovare. Sarà eseguita una validazione dei parametri e in caso di superamento verranno inserite tutte le richieste di rinnovo

<br/>

**Recupero massivo certificati**:

Il servizio permette di recuperare tramite l'id dell'utente chiamante la lista di tutti i certificati che ha generato distinti per sessione di lavoro(uuid).

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

Per comunicare con il Sistema di Provisioning (m2m) è necessario essere in possesso di 2 certificati X.509 e delle rispettive chiavi private.

Il certificato denominato di **“autenticazione”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> come certificato client per le chiamate https.

Il certificato denominato di **“signature”** viene utilizzato <span style="text-decoration:underline;">unicamente</span> per la firma dei token JWT.

Ogni invocazione delle API avverrà quindi con una chiamata https protetta dal certificato di autenticazione e **conterrà negli header 2 token JWT**, firmati con il certificato di **"signature"**.

Il primo JWT è utilizzato per l’autenticazione e contiene i riferimenti all’utente che richiama il servizio, il token viene trasportato nell’header **“Authorization”** di tipo **“Bearer”**:


```
Authorization: Bearer {VALORE DEL TOKEN}
```


Il secondo JWT è di “signature” e contiene rifermenti al file oggetto dell'operazione, il token viene trasportato nell’header http **“FSE-JWT-Provisioning**:


```
FSE-JWT-Provisioning: {VALORE DEL TOKEN}
```


**Entrambi** i token devono essere firmati utilizzando il certificato “signature”.

Vista la dipendenza dei token dai valori specifici di del file è necessario generare nuovi JWT per ogni chiamata alle API.

Per i dettagli sui campi dei token si consulti l’apposito paragrafo.

<br>

# 3. Servizio di Restituzione Profili
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità.

L’Endpoint si compone come segue:

```
https://<HOST>:<PORT>/v<major>/certificate/profile
```

Lo scopo di questa API è quello di restituire i diversi profili censiti per l'utente chiamante. Per ogni profilo verrà specificato in response `nodeID` necessario alla corretta valorizzazione delle successive request del seguente documento. 


## 3.1. Request

| METHOD | GET                     |
| ------ |-------------------------|
| URL    | /v1/certificate/profile |

_Tabella 5: Method, Url, Type_

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
   <td>FSE-JWT-Provisioning</td>
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
</table>

_Tabella 6: Endpoint - Descrizione parametri_

<br>

### 3.1.1. Esempio Request

Esempio request creazione massiva certificati.

``` bash
curl -X 'GET' \
  'https://<HOST>:<PORT>/v1/certificate/profile' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Provisioning: <token>' \
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
   <td> 200
   </td>
   <td>Operazione effettuata con successo
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


_Tabella 7: Response Servizio di Alimentazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 10 “Drilldown Error Response”.

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

<br>

**Campi valorizzati in caso di Success**

<table>
  <tr>
  <td><strong></strong>
   </td>
   <td><strong>FIELD</strong>
   </td>
   <td><strong>TYPE</strong>
   </td>
   <td><strong>DESCRIPTION</strong>
   </td>
  </tr>
  <tr>
  <td></td>
   <td>givenName
   </td>
   <td>String
   </td>
   <td>Nome
   </td>
  </tr>
  <tr>
  <td></td>
   <td>familyName
   </td>
   <td>String
   </td>
   <td>Cognome
   </td>
  </tr>
  <tr>
  <td></td>
   <td>taxCode
   </td>
   <td>String
   </td>
   <td>Codice fiscale
   </td>
  </tr>
  <tr>
   <td rowspan="14">roles
   </td>
  </tr>
  <tr>
    <td>nodeID</td>
    <td>String</td>
    <td>Id nodo utente</td>
  </tr>
<tr>
    <td>nodeFatherID</td>
    <td>String</td>
    <td>Id nodo utente padre</td>
  </tr>
<tr>
    <td>roleID</td>
    <td>String</td>
    <td>Id ruolo utente</td>
  </tr>
<tr>
    <td>roleDescription</td>
    <td>String</td>
    <td>Descrizione ruolo</td>
  </tr>
<tr>
    <td>regionID</td>
    <td>String</td>
    <td>Id regione</td>
  </tr>
<tr>
    <td>regionDescription</td>
    <td>String</td>
    <td>Descrizione regione</td>
  </tr>
<tr>
    <td>enterprise</td>
    <td>String</td>
    <td>Descrizione opzionale sull'azienda di riferimento per gli amministratori aziendali</td>
  </tr>
<tr>
    <td>structure</td>
    <td>String</td>
    <td>Descrizione opzionale sulla struttura di riferimento per gli amministratori privati</td>
  </tr>
<tr>
    <td>email</td>
    <td>String</td>
    <td>Indirizzo email</td>
  </tr>
<tr>
    <td>fixedPartCN</td>
    <td>String</td>
    <td>Parte fissa common name</td>
  </tr>
<tr>
    <td>allowedToMonitoring</td>
    <td>Boolean</td>
    <td>Indica se l'utente può accedere alla dashboard di monitoring</td>
  </tr>
</table>

_Tabella 8: Campi Response sempre valorizzati_

<br>

  
### 3.2.1. Esempio Messaggio di Risposta con esito OK 200

```json
{
  "traceID": "f52aa9db64d0bea0",
  "spanID": "f52aa9db64d0bea0",
  "givenName": "GIVEN_NAME",
  "familyName": "FAMILY_NAME",
  "taxCode": "FISCAL_CODE",
  "roles": [
    {
      "nodeID": 143,
      "nodeFatherID": 142,
      "roleID": 5,
      "roleDescription": "Role",
      "regionID": "150",
      "regionDescription": "Regione Campania",
      "enterprise": null,
      "structure": null,
      "email": "mail@mail.com",
      "fixedPartCN": "FIXEDPART",
      "allowedToMonitoring": true
    }
  ]
}
```

### 3.2.2. Esempio Messaggio di Risposta con esito KO 404

``` json
{
  "traceID": "16c812055899c379",
  "spanID": "fbc326110b857727",
  "type": "/errors/validation",
  "title": "Errore di validazione",
  "detail": "User with fiscal code CF not found!",
  "instance": "/not-found"
}
```

# 4. Servizio di Creazione massiva certificati
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità.

L’Endpoint del caso d’uso di creazione massiva si compone come segue:

```
https://<HOST>:<PORT>/v<major>/certificate/create/multi
```

Lo scopo di questa API è quello di consentire la creazione di un certo numero di certificati.
Per la creazione delle CSR fare riferiemento al Capitolo 11 'Drilldown Creazione CSR'.


## 4.1. Request

| METHOD | POST                         |
| ------ | ---------------------------- |
| URL    | /v1/certificate/create/multi |
| TYPE   | multipart/form-data          |

_Tabella 9: Method, Url, Type_

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
   <td>FSE-JWT-Provisioning</td>
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
   <td rowspan="5" >Request<p>Body</td>
   <tr>
   <td>files</td>
   <td>files</td>
   <td>MultipartFile[]</td>
   <td>true
   </td>
   </tr>
  </tr>
  <tr>
   <td rowspan="3" >requestBody</td>
   <td>nodeID</td>
   <td>Long</td>
   <td>true</td>
   <tr>
  <td rowspan="1" >certificateList</td>
   <td>Certificate[]</td>
   <td>true</td>
  </tr>
  <tr>
  <td rowspan="3" >description</td>
   <td>String</td>
   <td>false</td>
  </tr>
  </tr>
</table>

_Tabella 10: Endpoint - Descrizione parametri_

Il parametro `nodeID` è reperibile invocando il servizio descritto nel Capitolo 3 'Servizio di Restituzione Profili'

Di seguito la descrizione dei parametri di `Certificate` che identifica la richiesta della coppia di CSR

<table>
  <td> <strong>KEY</strong></td>
  <td><strong>VALUE</strong></td>
  <td><strong>TYPE</strong></td>
  <td><strong>REQUIRED</strong></td>
  </tr>
  <tr>
   <td>nameFileAuth</td>
   <td>Nome della csr di autenticazione</td>
   <td>String</td>
   <td>true</td>
  </tr>
  <tr>
   <td>nameFileSign</td>
    <td>Nome della csr di firma</td>
   <td>String</td>
   <td>true</td>
  </tr>
  <tr>
   <td>variablePartCN</td>
   <td>Parte variabile del common name</td>
   <td>String</td>
   <td>true</td>
  </tr>

</table>

_Tabella 11: Endpoint - Descrizione parametro certificateList_

**N.B.**

Ci deve essere coerenza tra `nameFileAuth`,`nameFileSign` e i `filename` dei `files` nella richiesta multipart.

<br>

### 4.1.1. Esempio Request

Esempio request creazione massiva certificati.

``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v<major>/certificate/create/multi' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Provisioning: <token>' \
  -H 'Content-Type: multipart/form-data' \
  -F 'creationInfo={
  "nodeID": 110,
  "certificateList": [
    {
      "nameFileAuth": "csrAuth.csr",
      "nameFileSign": "csrSign.csr",
      "variablePartCN": "P"
    }
  ],
  "description": "Certificati regione Lazio"
}' \
  -F 'files=@csrAuth.csr' \
  -F 'files=@csrSign.csr'
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
   <td rowspan="14" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Richiesta creazione presa in carico
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


_Tabella 12: Response Servizio di Alimentazione_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 10 “Drilldown Error Response”.

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

_Tabella 13: Campi Response sempre valorizzati_

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
   <td>uuid
   </td>
   <td>String
   </td>
   <td>Identificativo univoco assegnato ad una singola creazione massiva.
   </td>
  </tr>
  <tr>
   <td>creations
   </td>
   <td>Array
   </td>
   <td>Array di oggetti che rappresentano le creazioni effettuate.
   </td>
  </tr>
  <tr>
   <td>failures
   </td>
   <td>Array
   </td>
   <td>Array di oggetti che rappresentano le creazioni non effettuate.
   </td>
  </tr>
</table>

_Tabella 14: Campi Response sempre valorizzati_

<br>

### 4.2.1. Esempio Messaggio di Risposta con esito OK 200

```json
{
  "traceID": "df401c4b09a437cd",
  "spanID": "df401c4b09a437cd",
  "uuid": "016a4dd5-186a-4b18-90cc-c9c8b6298102",
  "creations": [
    {
      "idAuth": 12,
      "nameAuth": "csrAuth.csr",
      "idSign": 13,
      "nameSign": "csrSign.csr"
    }
  ],
  "failures": [
    {
      "nameAuth": "csrAuth1.csr",
      "hashAuth": "a1b2c3d4e5f6g7h8i9j0",
      "nameSign": "csrSign1.csr",
      "hashSign": "a1b2c3d4e5f6g7h8i9j0",
      "reason": "La richiesta di certificato è già esistente"
    }
  ]
}
```

### 4.2.2. Esempio Messaggio di Risposta con esito KO 400

``` json
{
  "traceID": "e2deda3d6d446ad4",
  "spanID": "e2deda3d6d446ad4",
  "type": "/errors",
  "title": "Errore Generico",
  "detail": "Attenzione il file: csrAutha.csr non risulta essere presente tra i multipart forniti",
  "instance": "/bad-request"
}
```

# 5. Servizio di Download massivo certificati
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. 

L’Endpoint del caso d’uso di download massivo si compone come segue:

```
https://<HOST>:<PORT>/v<major>/certificate/download/multi/{uuid}
```

Lo scopo di questa API è quello di effettuare il download della lista di certificati associati ad un uuid definito in fase di Creazione massiva. Il servizio restituisce uno zip Base64 contenente le coppie di certificati (AUTH e SIGN) create con successo. All'interno dello zip saranno presenti tutti i certificati per i quali la creazione è andata a buon fine, ed essi avranno come filename lo stesso della csr ma con estensione .der.
Nel caso in cui l'elaborazione per una coppia di certificati fosse ancora in atto il servizio risponde con uno status 206 ed un messaggio informativo.

## 5.1. Request

| METHOD | GET                                     |
| ------ |-----------------------------------------|
| URL    | /v1/certificate/download/multi/`{uuid}` |
| TYPE   | application/json                        |

_Tabella 15: Method, Url, Type_

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
   <td>FSE-JWT-Provisioning</td>
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
   <td rowspan="2">Path Param</td>
  <tr>
   <td>uuid</td>
   <td>Identificativo richiesta per cui effettuare il download</td>
   <td>String</td>
   <td>true</td>
  </tr>
  </tr>
</table>

_Tabella 16: Parametri Request_

<br>

Il campo  `uuid` fornito come path param alla seguente chiamata è ottenuto dall'invocazione del servizio di richiesta massiva definito nel Capitolo 3 o di rinnovo massivo definito nel Capitolo 6.<br>
Qualora non si fosse memorizzato all'atto della creazione l'uuid generato, è possibile recuperarlo invocando l'api definita nel capitolo 8

<br>

### 5.1.1. Esempio di download massivo

Download massivo di certificati

```bash
curl -X 'GET' \
  'https://<HOST>:<PORT>/v<major>/certificate/download/multi/016a4dd5-186a-4b18-90cc-c9c8b6298102' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Provisioning: <token>' \
```

<br>

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
   <td rowspan="15" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Zip b64 Completo
   </td>
  </tr>
  <tr>
   <td>206
   </td>
   <td>Zip in elaborazione
   </td>
  </tr>
  <tr>
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
   <td>Invalid response received from the API Implementation
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


_Tabella 17: Response Servizio di Recupero Transazione per TraceId_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 10 “Drilldown Error Response”.

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

_Tabella 18: Campi Response sempre valorizzati_


**Campi valorizzati in caso di Sucess**
<table>  
  <tr>
    <td>zip64</td>
    <td>String</td>
    <td>Zip codificato in base64 contenente i certificati di autenticazione e firma aventi lo stesso nome delle csr in upload la cui estensione è .der </td>
</table>

**Campi valorizzati in caso di Zip Incompleto**
<table>  
  <tr>
    <td>message</td>
    <td>String</td>
    <td>Tale campo si valorizza quando vi sono delle csr ancora in elaborazione</td>
</table>

### 5.2.1. Esempio Messaggio di Risposta con esito OK 200

``` json
{
  "traceID": "193beced1f8ce0dc",
  "spanID": "193beced1f8ce0dc",
  "uuid": "016a4dd5-186a-4b18-90cc-c9c8b6298102",
  "size": 2,
  "zip64": [
    "<b64-filezip>",
  ]
}
```

### 5.2.2. Esempio Messaggio di Risposta con esito KO 404

``` json
{
  "traceID": "7b611ad2ad790dcb",
  "spanID": "e36c24a77f5417bb",
  "type": "/errors/validation",
  "title": "Oggetto non trovato.",
  "detail": "Request with uuid: 016a4dd5-186a-4b18-90cc-c9c8b6298102 could not be found.",
  "instance": "/not-found"
}
```

### 5.2.3. Esempio Messaggio di Risposta con esito OK 206

``` json
{
  "traceID": "6ec1b19af4a33a96",
  "spanID": "6ec1b19af4a33a96",
  "uuid": "8890a5ee-61cc-42cd-89ff-3f03e5142fcf",
  "message": "In elaborazione"
}
```

# 6. Servizio di Rinnovo massivo certificati
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. 

L’Endpoint del caso d’uso di rinnovo massivo si compone come segue:

```
https://<HOST>:<PORT>/v<major>/certificate/renew/multi
```

Lo scopo di questa API è quello di effettuare il rinnovo dei certificati in scadenza per i quali si è precedentemente sottomessa una richiesta di creazione.

Per la creazione delle CSR fare riferiemento al Capitolo 11 'Drilldown Creazione CSR'.

<br>

## 6.1. Request

| METHOD | POST                        |
| ------ | --------------------------- |
| URL    | /v1/certificate/renew/multi |
| TYPE   | multipart/form-data         |

_Tabella 19: Method, Url, Type_

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
   <td>FSE-JWT-Provisioning</td>
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
   <td rowspan="5" >Request<p>Body</td>
   <tr>
   <td>files</td>
   <td>files</td>
   <td>MultipartFile[]</td>
   <td>true
   </td>
   </tr>
  </tr>
  <tr>
   <td rowspan="3" >requestBody</td>
   <td>nodeID</td>
   <td>Long</td>
   <td>true</td>
   <tr>
  <td rowspan="1" >certificateList</td>
   <td>Certificate[]</td>
   <td>true</td>
  </tr>
  <tr>
  </tr>
</table>

_Tabella 20: Parametri Request_

<br>

Il parametro `nodeID` è reperibile invocando il servizio descritto nel Capitolo 3 'Servizio di Restituzione Profili'

Di seguito la descrizione dei parametri di `Certificate` che identifica la richiesta della coppia di CSR

<table>
  <tr>
   <td colspan="5" align="center" ><strong>PARAMETER</strong></td>
  </tr>
  <tr>
   <td><strong>KEY</strong></td>
   <td><strong>VALUE</strong></td>
   <td><strong>TYPE</strong></td>
   <td><strong>REQUIRED</strong></td>
  </tr>
  <tr>
   <td>nameFileAuth</td>
   <td>Nome file di autenticazione csr</td>
   <td>String</td>
   <td>true</td>
   <tr>
  <td>nameFileSign</td>
    <td>Nome file di firma csr</td>
    <td>String</td>
    <td>true</td>
  </tr>
  <tr>
  <td>distinguishedNameAuth</td>
    <td>DN del certificato di autenticazione</td>
    <td>String</td>
    <td>true</td>
  </tr>
  <tr>
  <td>distinguishedNameSign</td>
    <td>DN del certificato di firma</td>
    <td>String</td>
    <td>true</td>
  </tr>
</table>

_Tabella 21: Parametri certificateList_

**N.B.**

Ci deve essere coerenza tra `nameFileAuth`,`nameFileSign` e i `filename` dei `files` nella richiesta multipart.
<br>

### 6.1.1. Esempio di rinnovo di certificati

Recupero stato submission set

``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v<major>/certificate/renew/multi' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Provisioning: <token>' \
  -H 'Content-Type: multipart/form-data' \
  -F 'renewInfo={
  "nodeID": 110,
  "certificateList": [
    {
      "nameFileAuth": "csrAuth.csr",
      "nameFileSign": "csrSign.csr",
      "distinguishedNameAuth": "A1#120LNGSMN92B400U",
      "distinguishedNameSign": "S1#120LNGSMN92B400U"
    }
  ]
}' \
  -F 'files=@csrAuth.csr' \
  -F 'files=@csrSign.csr'
```

<br>

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
   <td rowspan="14" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Richiesta di rinnovo certificati presa in carico
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


_Tabella 22: Response servizio di rinnovo_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 10 “Drilldown Error Response”.

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

_Tabella 23: Campi Response sempre valorizzati_

<br>

**Campi valorizzati in caso di Success**

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
   <td>uuid
   </td>
   <td>String
   </td>
   <td><td>Identificativo univoco assegnato ad un singolo rinnovo massivo.
   </td>
  </tr>
  <tr>
   <td>renew
   </td>
   <td>Array
   </td>
   <td>Array di oggetti che rappresentano le richieste di rinnovo effettuate.
   </td>
  </tr>
  <tr>
   <td>failures
   </td>
   <td>Array
   </td>
   <td>Array di oggetti che rappresentano le richieste di rinnovo non andate a buon fine.
   </td>
  </tr>
</table>

_Tabella 24: Campi Response success sempre valorizzati_

<br>

### 6.2.1. Esempio Messaggio di Risposta con esito OK 200

``` json
{
  "traceID": "df401c4b09a437cd",
  "spanID": "df401c4b09a437cd",
  "uuid": "016a4dd5-186a-4b18-90cc-c9c8b6298102",
  "renews": [
    {
      "idAuth": 12,
      "nameAuth": "csrAuth.csr",
      "idSign": 13,
      "nameSign": "csrSign.csr"
    }
  ],
  "failures": [
    {
      "nameAuth": "csrAuth1.csr",
      "hashAuth": "a1b2c3d4e5f6g7h8i9j0",
      "nameSign": "csrSign1.csr",
      "hashSign": "a1b2c3d4e5f6g7h8i9j0",
      "reason": "La richiesta di certificato non esiste"
    }
  ]
}
```

### 6.2.2. Esempio Messaggio di Risposta con esito KO 400

```json
{
  "traceID": "abe208b8c590e337",
  "spanID": "abe208b8c590e337",
  "type": "/errors",
  "title": "Errore parametri",
  "detail": "Il common name fornito in input risulta essere diverso da quello della csr csrAuth.csr",
  "instance": "/bad-request"
}
```

**Campi valorizzati in caso di Errore**

<table>
  <tr>
    <td><strong>FIELD</strong></td>
    <td><strong>TYPE</strong></td>
    <td><strong>DESCRIPTION</strong></td>
  </tr>
  <tr>
    <td>traceID</td>
    <td>String</td>
    <td>Identificativo univoco assegnato alla richiesta dell'utente.</td>
  </tr>
  <tr>
    <td>spanID</td>
    <td>String</td>
    <td>Identificativo univoco assegnato ad una singolo operazione della richiesta dell'utente.</td>
  </tr>
  <tr>
    <td>type</td>
    <td>String</td>
    <td>Tiplogia dell'errore riscontrato.</td>
  </tr>
  <tr>
    <td>title</td>
    <td>String</td>
    <td>Titolo dell'errore.</td>
  </tr>
  <tr>
    <td>detail</td>
    <td>String</td>
    <td>Descrizione dell'errore.</td>
  </tr>
  <tr>
    <td>instance</td>
    <td>String</td>
    <td>Instance specifica dell'errore.</td>
  </tr>
</table>

_Tabella 25: Campi valorizzati in caso di errore_

<br>

# 7. Servizio di Revoca massiva certificati
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. 

L’Endpoint del caso d’uso di revoca massiva si compone come segue:

```
https://<HOST>:<PORT>/v<major>/certificate/revoke/multi
```

Lo scopo di questa API è quello di effettuare la revoca dei certificati associati ad un uuid definito in fase di Creazione massiva.
In alternativa all'utilizzo dell'uuid, è possibile specificare una lista (revokes) di certificati indicando la motivazione della revoca per ognuno di questi.

<br>

## 7.1. Request

| METHOD | POST                         |
| ------ | ---------------------------- |
| URL    | /v1/certificate/revoke/multi |
| TYPE   | application/json             |

_Tabella 26: Method, Url, Type_

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
   <td>FSE-JWT-Provisioning</td>
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
   <td rowspan="7">Request<p>Body</td>
   <tr>
   </tr>
  <tr>
   <td rowspan="5" >requestBody</td>
   <td>nodeID</td>
   <td>Long</td>
   <td>true</td>
   <tr>
  <td rowspan="1" >uuid</td>
   <td>String</td>
   <td>true se revokes è non valorizzato</td>
  </tr>
  <tr>
  <td rowspan="2" >reason</td>
   <td>Enum</td>
   <td>true</td>
  </tr>
  <tr>
  <tr>
  <td rowspan="3" >revokes</td>
   <td>Revokes[]</td>
   <td>true se uuid è non valorizzato</td>
  </tr>
</table>

_Tabella 27: Parametri di input per la revoca massiva_

Il parametro `nodeID` è reperibile invocando il servizio descritto nel Capitolo 3 'Servizio di Restituzione Profili'

Di seguito la descrizione dei parametri di Revokes che identifica la richiesta della coppia di CSR da revocare

<table>
  <td> <strong>KEY</strong></td>
  <td><strong>VALUE</strong></td>
  <td><strong>TYPE</strong></td>
  <td><strong>REQUIRED</strong></td>
  </tr>
  <tr>
   <td>distinguishedNameAuth</td>
   <td>CN Csr Auth</td>
   <td>String</td>
   <td>true</td>
  </tr>
  <tr>
   <td>distinguishedNameSign</td>
    <td>CN Csr Sign</td>
   <td>String</td>
   <td>true</td>
  </tr>
  <tr>
   <td>reason</td>
   <td>Motivazione della revoca</td>
   <td>Enum</td>
   <td>true</td>
  </tr>
</table>

Di seguito la descrizione dell'enum che indica le motivazioni della revoca

<table>
  <tr>
   <td><strong>KEY</strong></td>
   <td><strong>VALUE</strong></td>
  </tr>
  <tr>
   <td>UNSPECIFIED</td>
   <td>unspecified</td>
  </tr>
  <tr>
    <td>KEY_COMPROMISE</td>
    <td>keyCompromise</td>
  </tr>
  <tr>
    <td>CA_COMPROMISE</td>
    <td>caCompromise</td>
  </tr>
  <tr>
    <td>AFFILIATION_CHANGED</td>
    <td>affiliationChanged</td>
  </tr>
  <tr>
    <td>SUPERSEDED</td>
    <td>superseded</td>
  </tr>
  <tr>
    <td>CESSATION_OF_OPERATION</td>
    <td>cessationOfOperation</td>
  </tr>
  <tr>
    <td>CERTIFICATE_HOLD</td>
    <td>certificateHold</td>
  </tr>
  <tr>
    <td>REMOVE_FROM_CRL</td>
    <td>removeFromCrl</td>
  </tr>
  <tr>
    <td>PRIVILEGE_WITH_DRAWN</td>
    <td>privilegeWithDrawn</td>
  </tr>
  <tr>
    <td>AA_COMPROMISE</td>
    <td>aACompromise</td>
  </tr>
</table>

<br>

### 7.1.1. Esempio di revoca massiva con uuid


``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v1/certificate/revoke/multi' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Provisioning: <token>' \
  -H 'Content-Type: application/json' \
  -d '{
  "nodeID": 110,
  "uuid": "016a4dd5-186a-4b18-90cc-c9c8b6298102",
  "reason": "unspecified"
}'
```

<br>

### 7.1.2. Esempio di revoca massiva con lista di certificati


``` bash
curl -X 'POST' \
  'https://<HOST>:<PORT>/v1/certificate/revoke/multi' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Provisioning: <token>' \
  -H 'Content-Type: application/json' \
  -d '{
  "nodeID": 110,
  "revokes": [
    {
      "distinguishedNameAuth": "string",
      "distinguishedNameSign": "string",
      "reason": "unspecified"
    }
  ]
}'
```

<br>

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
   <td rowspan="14" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Revoca effettuata con successo
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


_Tabella 28: Response Servizio di revoca_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 10 “Drilldown Error Response”.

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

_Tabella 29: Campi Response sempre valorizzati_

<br>

**Campi valorizzati in caso di Success**

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
    <td>revokes</td>
    <td>Array</td>
    <td>Array di oggetti contenenti le informazioni sulle revoche eseguite con successo </td>
  </tr>
  <tr>
    <td>failures</td>
    <td>Array</td>
    <td>Array di oggetti contenenti le informazioni sulle revoche non andate a buon fine</td>
  </tr>
</table>

_Tabella 30: Campi Response valorizzati in caso di successo_

### 7.2.1. Esempio Messaggio di Risposta con esito OK 200

``` json
{
  "traceID": "7a813dbf9225d6e5",
  "spanID": "7a813dbf9225d6e5",
  "revokes": [
    {
      "traceID": "abe208b8c590e337",
      "spanID": "abe208b8c590e337",
      "idAuth": 1,
      "nameAuth": "csrAuth.csr",
      "idSign": 2,
      "nameSign": "csrSign.csr"
    }
  ],
  "failures": [
    {
      "nameAuth": "csrAuth1.csr",
      "hashAuth": "a1b2c3d4e5f6g7h8i9j0",
      "nameSign": "csrSign1.csr",
      "hashSign": "a1b2c3d4e5f6g7h8i9j1",
      "reason": "Certificato non trovato"
    }
  ]
}
```

### 7.2.2. Esempio Messaggio di Risposta con esito KO 404

```json
{
  "traceID": "517a518a02ab1014",
  "spanID": "97c6ffb4edc956e6",
  "type": "/errors/validation",
  "title": "Errore di validazione",
  "detail": "Node with id 1 not found!",
  "instance": "/not-found"
}
```

**Campi valorizzati in caso di Errore**

<table>
  <tr>
    <td><strong>FIELD</strong></td>
    <td><strong>TYPE</strong></td>
    <td><strong>DESCRIPTION</strong></td>
  </tr>
  <tr>
    <td>traceID</td>
    <td>String</td>
    <td>Identificativo univoco assegnato alla richiesta dell'utente.</td>
  </tr>
  <tr>
    <td>spanID</td>
    <td>String</td>
    <td>Identificativo univoco assegnato ad una singolo operazione della richiesta dell'utente.</td>
  </tr>
  <tr>
    <td>type</td>
    <td>String</td>
    <td>Tiplogia dell'errore riscontrato.</td>
  </tr>
  <tr>
    <td>title</td>
    <td>String</td>
    <td>Titolo dell'errore.</td>
  </tr>
  <tr>
    <td>detail</td>
    <td>String</td>
    <td>Descrizione dell'errore.</td>
  </tr>
  <tr>
    <td>instance</td>
    <td>String</td>
    <td>Instance specifica dell'errore.</td>
  </tr>
</table>

_Tabella 31: Campi valorizzati in caso di errore_

<br>

# 8. Servizio di Recupero massivo certificati
Nella presente sezione vengono riportate le informazioni principali per l’invocazione di questa funzionalità. 

L’Endpoint del caso d’uso di recupero massivo si compone come segue:

```
https://<HOST>:<PORT>/v<major>/certificates/multi?nodeID=<id>
```

Il servizio permette di recuperare tutti i certificati creati dall'utente identificato tramite nodeID.


<br>

## 8.1. Request

| METHOD | GET                                |
| ------ | ---------------------------------- |
| URL    | /v1/certificates/multi |
| TYPE   | application/json                   |

_Tabella 32: Method, Url, Type_

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
   <td>FSE-JWT-Provisioning</td>
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
  <td> Param </td>
   <td rowspan="1" >QueryParam</td>
   <td>nodeID</td>
   <td>Long</td>
   <td>true</td>
   </tr>
</table>

_Tabella 33: Parametri di input per la revoca massiva_

Il parametro `nodeID` è reperibile invocando il servizio descritto nel Capitolo 3 'Servizio di Restituzione Profili'

<br>

### 8.1.1. Esempio di recupero massivo


``` bash
curl -X 'GET' \
  'https://<HOST>:<PORT>/v1/certificates/multi?nodeID=<id>' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer <token>' \
  -H 'FSE-JWT-Provisioning: <token>'
```

<br>

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
   <td rowspan="14" >STATUS CODE
   </td>
   <td> 200
   </td>
   <td>Richieste certificati recuperate
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


_Tabella 34: Response Servizio di revoca_

\* Gli oggetti di errore, generati dall’applicativo o da apparati di frontiera, rispettano la specifica RFC 7807, per ulteriori dettagli fare riferimento al Capitolo 10 “Drilldown Error Response”.

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

_Tabella 35: Campi Response sempre valorizzati_

<br>

**Campi valorizzati in caso di Success**

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
    <td>certificates</td>
    <td>Array</td>
    <td>Array di oggetti contenenti le informazioni sui certificati trovati </td>
  </tr>
</table>

_Tabella 36: Campi Response valorizzati in caso di successo_

Di seguito la descrizione dei parametri di certificates

<table>
  <tr>
   <td colspan="5" align="center" ><strong>PARAMETER</strong></td>
  </tr>
  <tr>
   <td><strong>KEY</strong></td>
   <td><strong>VALUE</strong></td>
   <td><strong>TYPE</strong></td>
   <td><strong>REQUIRED</strong></td>
  </tr>
  <tr>
   <td>uuid</td>
   <td>Uuid generato nella fase di creazione massiva</td>
   <td>String</td>
   <td>true</td>
   <tr>
  <td>description</td>
    <td>Descrizione associata all'uuid</td>
    <td>String</td>
    <td>false</td>
  </tr>
  <tr>
  <td>requestPairs**</td>
    <td>CN delle richieste di auth e sign</td>
    <td>List</td>
    <td>true</td>
  </tr>
  <tr>
</table>

_Tabella 37: Descrizione dei parametri di successo_

<table>
  <tr>
   <td colspan="5" align="center" ><strong>PARAMETER</strong></td>
  </tr>
  <tr>
   <td><strong>KEY</strong></td>
   <td><strong>VALUE</strong></td>
   <td><strong>TYPE</strong></td>
   <td><strong>REQUIRED</strong></td>
  </tr>
  <tr>
   <td>dnAuth</td>
   <td>Cn auth</td>
   <td>String</td>
   <td>true</td>
   <tr>
  <td>dnSign</td>
    <td>Cn sign</td>
    <td>String</td>
    <td>true</td>
  </tr>
</table>

_Tabella 38: Descrizione requestPairs_

### 8.2.1. Esempio Messaggio di Risposta con esito OK 200

``` json
{
  "traceID": "64fa0cbc8af43c33",
  "spanID": "64fa0cbc8af43c33",
  "certificates": [
    {
      "uuid": "8890a5ee-61cc-42cd-89ff-3f03e5142fcf",
      "description": "Regione Campania 2023",
      "requestPairs": [
        {
          "dnAuth": "dnAuth1",
          "dnSign": "dnSign1"
        },
        {
          "dnAuth": "dnAuth2",
          "dnSign": "dnSign2"
        }
      ]
    }
  ]
}
```

### 8.2.2. Esempio Messaggio di Risposta con esito KO 404

```json
{
  "traceID": "868244161e260d61",
  "spanID": "7391875fe51a9894",
  "type": "/errors/validation",
  "title": "Errore di validazione",
  "detail": "Node with id 50 not found!",
  "instance": "/not-found"
}
```

**Campi valorizzati in caso di Errore**

<table>
  <tr>
    <td><strong>FIELD</strong></td>
    <td><strong>TYPE</strong></td>
    <td><strong>DESCRIPTION</strong></td>
  </tr>
  <tr>
    <td>traceID</td>
    <td>String</td>
    <td>Identificativo univoco assegnato alla richiesta dell'utente.</td>
  </tr>
  <tr>
    <td>spanID</td>
    <td>String</td>
    <td>Identificativo univoco assegnato ad una singolo operazione della richiesta dell'utente.</td>
  </tr>
  <tr>
    <td>type</td>
    <td>String</td>
    <td>Tiplogia dell'errore riscontrato.</td>
  </tr>
  <tr>
    <td>title</td>
    <td>String</td>
    <td>Titolo dell'errore.</td>
  </tr>
  <tr>
    <td>detail</td>
    <td>String</td>
    <td>Descrizione dell'errore.</td>
  </tr>
  <tr>
    <td>instance</td>
    <td>String</td>
    <td>Instance specifica dell'errore.</td>
  </tr>
</table>

_Tabella 39: Campi valorizzati in caso di errore_

<br>

# 9 Drilldown Parametri di Input

## 9.1 Campi contenuti nei JWT

Come specificato nel Capitolo 2.3, ogni invocazione API necessita di due header JWT:

<br> 

### 9.1.1. Authentication Bearer

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

_Tabella 40: Campi Authentication Bearer_

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
   <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/provisioning/v1
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


_Tabella 41: Campi contenuti in Authentication Bearer Token_

<br>

### 9.1.2. FSE-JWT-Provisioning
Il token JWT denominato `FSE-JWT-Provisioning` è un token applicativo composto dai seguenti Header e Reserved Claims

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
   <td>https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/provisioning/v1
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

_Tabella 42: Campi contenuti nel business Token_

<br>

<table>
  <tr>
   <td colspan="2" >
<strong>CUSTOM CLAIMS</strong>
   </td>
  </tr>
  <tr>
   <td colspan="2" style="text-align:center"><strong>HASH FILE ARRAY</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>Array contenente la lista di hash (HEX SHA256) delle CSR fornite in input all'endpoint
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>["hash1", "hash2", ... , "hashN"]
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio per gli endpoint di Creazione massiva e Rinnovo massivo
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td><code>vector_hash_csr</code>
   </td>
  </tr>
  <tr>
   <td colspan="2" style="text-align:center"><strong>UUID RICHIESTA</strong>
   </td>
  </tr>
  <tr>
   <td><strong>DESCRIZIONE</strong>
   </td>
   <td>UUID associato alla precedente richiesta di Creazione massiva o Rinnovo massivo
   </td>
  </tr>
  <tr>
   <td><strong>ESEMPIO</strong>
   </td>
   <td>016a4dd5-186a-4b18-90cc-c9c8b6298102
   </td>
  </tr>
  <tr>
   <td><strong>VALIDAZIONE</strong>
   </td>
   <td>Obbligatorio per gli endpoint di Download massivo e Revoca massiva
   </td>
  </tr>
  <tr>
   <td><strong>CAMPO JWT</strong>
   </td>
   <td><code>vector_id</code>
   </td>
  </tr>
</table>


_Tabella 43: Campi contenuti in FSE-JWT-Provisioning_

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

**Esempio di Payload del token FSE-JWT-Provisioning decodificato in caso di creazione e rinnovo massivo**
```json
{
  "alg": "RS256",
  "typ": "JWT",
  "kid": "0",
  "iss": "integrity:190201123456XX",
  "x5c": "MIIDBzCCAe+gAwIBAgIJAIBJZQZQX4ZmMA0GCSqGSIb3DQEBC[...]",
  "iat": 1540890704,
  "exp": 1540918800,
  "jti": 1540918800,
  "aud": "https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/provisioning/v1",
  "sub": "VRDMRC67T20I257E",
  "vector_hash_csr": ["d98d66e46b1333ddb548e55a086c0153b1a691f2c4f38e62067ad4ca77bfd8f8","d98d66e46b1333ddb548e55a086c0153b1a691f2c4f38e62067ad4ca77bfd8f9"]
  
}
```
**Esempio di Payload del token FSE-JWT-Provisioning decodificato in caso di revoca massiva**
```json
{
  "alg": "RS256",
  "typ": "JWT",
  "kid": "0",
  "iss": "integrity:190201123456XX",
  "x5c": "MIIDBzCCAe+gAwIBAgIJAIBJZQZQX4ZmMA0GCSqGSIb3DQEBC[...]",
  "iat": 1540890704,
  "exp": 1540918800,
  "jti": 1540918800,
  "aud": "https://modipa-val.fse.salute.gov.it/govway/rest/in/FSE/provisioning/v1",
  "sub": "VRDMRC67T20I257E",
  "vector_id": "e2241357-6d09-43c8-adcc-6e098d95ca3f"
  
}
```


# 10. Drilldown Response in caso di Errore

Il Gateway genererà due tipologie di errore distinte, entrambe aderenti alla specifica RFC 7807.


## 10.1. Errori Applicativi

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

_Tabella 44: Campi Response valorizzati in caso di errore_

### 10.2. Esempi di errore generati da Provisioning
| TYPE                | TITLE                 | DETAIL                        | STATUS | INSTANCE     |
| ------------------- | --------------------- | ----------------------------- | ------ | ------------ |
| /errors             | Errore Generico.      | {dinamico in base all’errore} | 500    | /server      |
| /errors/bad-request | Richiesta malformata. | {dinamico in base all’errore} | 400    | /bad-request |
| /errors/not-found   | Risorsa non trovata.  | {dinamico in base all’errore} | 404    | /not-found   |
| /errors             | Errore Generico.      | {dinamico in base all’errore} | 409    | /conflict    |

_Tabella 45: stati response_

# 11. Drilldown Creazione CSR
Per la creazione di una CSR è possibile usare openssl. Di seguito gli step per la creazione:

1. Generazione della chiave privata

```bash
openssl genrsa -out private.key 2048
```

2. Generazione della CSR

```bash
openssl req -outform der -new -key private.key -out csr.csr
```

3. La creazione della CSR richiederà di inserire i seguenti dati:

```bash
Country Name (2 letter code) [XX]:IT
State or Province Name (full name) []:Lazio
Locality Name (eg, city) [Default City]:Roma
Organization Name (eg, company) [Default Company Ltd]:Ministero della Salute
Organizational Unit Name (eg, section) []:Dipartimento della Protezione Civile
Common Name (eg, fully qualified host name) []:150VRDMRC67T20I257E
```

1. La CSR generata sarà salvata in un file con estensione .csr

# 12. Drilldown Invocazione Gateway
Come si evince dal Capitolo 5 'Servizio di Download Massivo', l'endpoint fornisce in output uno zip in base64 contenente una lista di coppie di Certificati (Autenticazione e Firma) necessari alla corretta invocazione del Gateway. Ogni certificato deve essere riconciliato con la sua chiave privata così da ottenere un certificato con estensione `.p12` 

Di seguito gli step necessari:

1. Decodifica base64 dell'attributo `zip64`
2. Per ogni certificato presente nell'archivio decompresso eseguire i seguenti comandi:

```bash
openssl x509 -inform DER -in X1#COMMON_NAME.der -out X1#COMMON_NAME.pem

openssl pkcs12 -export -in X1#COMMON_NAME.pem -inkey X1PrivateKey.pem -out X1#COMMON_NAME.p12
```
Dove X1# può indicare sia il certificato di Autenticazione (A1#) sia quello di Firma (S1#)

3. Utilizzare `A1#COMMON_NAME.p12` come certificato client per le chiamate https. 

4. Utilizzare `S1#COMMON_NAME.p12` per la firma dei token JWT `Authentication Bearer` e `FSE-JWT-Provisioning`
 
<!-- Footnotes themselves at the bottom. -->
# Notes

[^1]: Linee Guida Modello di Interoperabilità: https://docs.italia.it/media/pdf/lg-modellointeroperabilita-docs/vintra-work/lg-modellointeroperabilita-docs.pdf

[^2]: Par 2.5.1 delle Linee Guida Modello di Interoperabilità 

[^3]: Par. 4.3.1 del documento rif [2]

[^4]: Par. 3.4.2 delle Linee Guida Modello di Interoperabilità

[^5]: Par. 3.5.3 delle Linee Guida Modello di Interoperabilità
