# Transitorio

_01/02/2023 	draft - prima stesura_

_13/02/2023 	1.0 - prima versione_


# 1. Indice

- [Transitorio](#transitorio)
- [1. Indice](#1-indice)
- [2. Obiettivo del documento](#2-obiettivo-del-documento)
- [3. Processo di accreditamento (convalida)](#3-processo-di-accreditamento-convalida)
- [4. Avvio in produzione](#4-avvio-in-produzione)
- [5. Monitoraggio alimentazione FSE nel periodo transitorio](#5-monitoraggio-alimentazione-fse-nel-periodo-transitorio)


# 2. Obiettivo del documento

Il documento descrive le azioni necessarie per l’avvio in produzione degli applicativi software adeguati per la produzione dei documenti secondo le nuove specifiche documentali del FSE 2.0 nella **fase transitoria in cui il gateway non è in produzione** e la comunicazione avviene ancora secondo i meccanismi di FSE 1.0.

# 3. Processo di accreditamento (convalida)

Il processo di accreditamento si sospende dopo la [fase 1](https://github.com/ministero-salute/it-fse-support/tree/main/doc/accreditamento#fase-1-processo-di-accreditamento), cioè dopo la fase di **accreditamento (convalida) dell’applicativo software** eseguito presso gli ambienti di test del fornitore con esito positivo. 

Le fasi 2 e 3 del processo di accreditamento  vengono rimandate ad un momento successivo, cioè quando il gateway sarà disponibile in produzione.

Al termine della fase 1 l’applicativo software è in grado di produrre documenti CDA aderenti alle specifiche nazionali in termini di formato e, se gestita dall’applicativo, di apporre la firma PADES.


# 4. Avvio in produzione

L’infrastruttura FSE regionale (anche per le regioni in sussidiarietà) dovrà essere adeguata:



* se necessario, per gestire i nuovi formati documentali prodotti
* alle specifiche INI FSE 1.0 versione 2.4.1.

Gli applicativi software convalidati (fase 1) saranno installati in produzione mantenendo la modalità di conferimento dei documenti utilizzata per FSE 1.0, secondo le indicazioni della singola regione e in raccordo agli adeguamenti alla infrastruttura regionale. 

Laddove l’applicativo non realizzi le funzioni  di firma PADES dei documenti, dovrà essere integrato con un servizio in grado di apporre tale tipologia di firma.


# 5. Monitoraggio alimentazione FSE nel periodo transitorio

Nella fase transitoria di alimentazione del FSE secondo le modalità di invio del FSE 1.0 ma con documenti adeguati alle specifiche documentali del FSE 2.0, gli indicatori di alimentazione, compresi quelli per l’erogazione delle risorse indicati nel decreto interministeriale n. 2506 del 16 giugno 2022 (“Riparto”), saranno conteggiati a partire dai dati presenti in INI. Nello specifico verranno contate come valide le transazioni “comunica metadati” che hanno:



* indicazione di presenza di firma
* indicazione del formato del documento (PDF con CDA2 iniettato)
* indicazione dell’istanza dell’applicativo regionale/aziendale che deve essere fra quelle che hanno passato la fase 1 di accreditamento (convalida).