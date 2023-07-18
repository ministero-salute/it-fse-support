# Supporto FSE 2.0

Benvenuto nella pagina di supporto FSE.  
Qui potrai trovare tutto il materiale e la documentazione utile allo sviluppo delle integrazioni con il nuovo Fascicolo Sanitario Elettronico.  
A partire da Settembre sarà possibile per tutte le regioni testare le integrazion verso l'ambiente di test.

# Risorse

## Quickstart Gateway (GTW)

* [FAQ](https://github.com/ministero-salute/it-fse-support/tree/main/doc/faq)
* [Documentazione integrazione GTW](https://github.com/ministero-salute/it-fse-support/tree/main/doc/integrazione-gateway)
* [Documentazione per accreditamento](doc/accreditamento)
  * [Gestione transitorio avvio](doc/transitorio)
* [Descrizione modelli middleware regionali](doc/middleware-regionale)
* [Tool per generazione Token JWT e iniezione CDA in PDF](https://github.com/ministero-salute/it-fse-gtw-tools)
* [Container Gateway](https://github.com/ministero-salute/it-fse-gtw-test-container)
* [Esempi di CDA validi](https://github.com/ministero-salute/it-fse-support/tree/main/doc/esempi/CDA)
* [File XSD a supporto della validazione dei CDA](https://github.com/ministero-salute/it-fse-catalogs/tree/main/schema)
* [File Schematron a supporto della validazione dei CDA](https://github.com/ministero-salute/it-fse-catalogs/tree/main/schematron)
* [Repository it-fse-catalogs con i dizionari e cataloghi caricati sul gateway](https://github.com/ministero-salute/it-fse-catalogs/)
* [Specifiche API provisioning](doc/provisioning/)
* [Richiesta certificati x509 per autenticazione e firma](#richiesta-certificati-x509)
* [Apertura Segnalazioni](https://github.com/ministero-salute/it-fse-support/issues)
* [Canale Slack #fse](https://developersitalia.slack.com/archives/C03RDT88FSM)
* [Client Web Gateway (non ufficiale)](https://github.com/zukka77/gtwclient)

# Gateway (GTW)

Il GTW è il punto di ingresso dei documenti all'interno del sistema FSE.  
Al momento è rilasciata in test la funzionalità di verifica e **validazione** dei documenti CDA e il mockup del servizio di **pubblicazione**.

# Richiesta certificati x509

<mark>Durante la fase di sperimentazione l'accesso alla piattaforma verrà scadenziato in accordo con le regioni.</mark>  
Le regioni che partecipano alla sperimentazione possono inviare due CSR (Certificate Signing Request): una per il certificato di autenticazione e una per il certificato di firma, all'indirizzo e-mail `fse_support@sogei.it`.

**Attenzione** è necessario conservare le chiavi private delle CSR, queste, insieme ai certificati che verranno consegnati, saranno necessari per l'accesso ai servizi del Gateway. 

Per la generazione della CSR è possibile usare tool come `openssl` o `keytool` distribuito con i runtime Java

Esempio openssl:

        openssl req -new -newkey rsa:2048 -nodes -keyout nome_chiave.key -out nome_csr.csr

Il comando è da eseguire due volte, una per ogni CSR. Se si vuole criptare la chiave privata con una password è possibile eliminare il parametro `-nodes`

Esempio keytool:

        keytool -genkey -alias nome_certificato -keyalg RSA -keysize 2048 -keystore nome_keystore.jks
        keytool -certreq -alias nome_certificato -file nome_certificato.csr -keystore nome_keystore.jks

Anche in questo caso è necessario eseguire il comando 2 volte, una per ogni certificato, nel caso del keystore java è però possibile fare coesistere (*con alias diversi*) entrambi i certificati all'interno dello stesso keystore.