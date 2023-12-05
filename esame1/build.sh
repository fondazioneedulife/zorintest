#
# Questo script serve solo ad eseguire la build dell'immagine
#
#!/bin/bash
# posiziono i file nella cartella di build
cp -r doc-custom-app soluzione/
# eseguo la build
docker build -t esame1:v1.0.0 -f soluzione/Dockerfile .
# eseguo il container in modalità interattiva
docker run -ti -p 8080:80 esame1:v1.0.0
# eseguo il container in background
#docker run -d -p 8080:80 esame1:v1.0.0 
