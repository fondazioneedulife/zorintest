# Ambiente sviluppo locale
```
docker run -ti -v $(pwd):/app -p 4200:4200 node:20.9.0-bookworm-slim /bin/sh
```
# Consegna
Si vuole costruire l'immagine Docker per erogare il progetto **hello world** predefinito di Angular. 
- Usare le ultime versioni LTS di node basata su immagine Docker a piacere
- Usare l'ultima vesione LTS di angular/cli. 
- Usare l'ultima versione di nginx nella distribuzione alpine per il container di erogazione del frontend.
- Tutto il processo di build va eseguito nella compilazione dell'immagine docker
- Riportare i comandi per eseguire la build e l'esecuzione del container

# Istruzioni esempio
Installazione di angular/cli LTS
```
npm install -g @angular/cli@16.2.10
``````
creo progetto nuovo vuoto
```
ng new --interactive false hello-world
```
mostro anteprima su porta 4200
```
ng serve --host 0.0.0.0
```
Si vedrà questo da browser contattando http://localhost:8080

![Alt text](image-1.png)

Se siamo soddisfatti eseguiamo la build producendo i file statici per il nostro webserver con
```
ng build
```

Il risultato della compilazione si trova in [cartella progetto]/dist/[nome progetto]
