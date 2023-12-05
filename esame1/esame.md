# Link
https://github.com/fondazioneedulife/zorintest/blob/main/esame.md

# Contesto
Mkdocs è una libreria python per la generazione di documentazione, il team di sviluppo ha completato la stesura della documentazione per il progetto e ha fornito un repository con i sorgenti.

Si vuole andare in produzione in pochi giorni e per compliance ISO è richiesta la disponibilità della documentazione.

Compito dei componenti Ops del team è predisporre immagine versionata e immutabile della documentazione in un dato momento.

# Utilizzare il repository dei sorgenti fornito e predisporre le seguenti attività

* [40 pt] Scrivere Dockerfile per realizzare immagine docker nginx con il sito compilato ed esposto
  * occorre prestare attenzione alla  dimensione dell'immagine
  * utilizzare le versioni python richieste da mkdocs e definite nel reamde per eseguire la compilazione
  * utilizzare l'ultima versione ngnix nella distribuzione alpine
  * Scrivere uno script `build.sh` da usare per testare build ed esecuzione.

Test superato se, eseguito lo script `build.sh`, è possibile vedere il sito compilato interrogando http://localhost:8080 dal proprio host

* [50 pt] docker compose con:
  * una replica
  * i limits delle risorse impostate a min 20 MB con un quarto di cpu e max 50MB con mezza cpu
  * limits nella dimensione dei log a piacere
  * il docker compose deve compilare i sorgenti direttamente in fase di esecuzione

Test superato se, eseguendo `docker-compose up`, è possibile vedere il sito compilato interrogando http://localhost:8080 dal proprio host

* [10 pt] Aggiungere al repository un devcontainer per l'esecuzione locale, usando immagine docker di python basata su debian
