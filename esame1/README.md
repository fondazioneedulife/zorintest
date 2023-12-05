## Requisiti
- Python 3.11.x
- mkdocs 1.5.x

## Istruzioni fornite
### TIPS
Per non creare problemi con il setup di python in locale
```
$ docker run -v $(pwd):/app -ti --entrypoint /bin/bash -p 8000:8000 python:3.11.7-slim-bullseye
```
posizionarsi nella cartella dei sorgenti `doc-custom-app` e installare le dipendenze con:
```
pip install -r requirements.txt
```

### Anteprima

Per visualizzare il contenuto in anteprima il comando è il seguente:

`$ mkdocs serve -a 0.0.0.0:8000`

### Compilazione

Per compilare il sito utilizzare:
`$ mkdocs build`

Il sito compilato si trova nella sottocartella `site` es: 
/app/doc-custom-app/site