FROM python:3.11.7-slim-bullseye as builder
# Copio il contenuto della cartella dei sorgenti nella cartella nuova /app
ADD doc-custom-app /app
# Imposto la cartella di lavoro /app per i comandi successivi
WORKDIR /app
# Installo le dipendenze fornite
RUN pip install -r requirements.txt
# Eseguo la build, verrà prodotta la cartella /app/site
RUN mkdocs build
# Predispongo l'immgina nginx specificando la versione
FROM nginx:1.25.3-alpine3.18-slim
# Ricopio dallo step di build la cartella dei file compilati
COPY --from=builder /app/site /usr/share/nginx/html
# Non voglio eseguire nginx come root, cambio i permessi delle risorse per renderle
# leggibili da un utente non root
RUN chown -R nginx:nginx /usr/share/nginx/html && chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d
# Siccome un utente non root non potrebbe creare un pid in /var/run, lo creo io
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid
# Il container partirà come utente nginx (Definito nell'immagine)
USER nginx
 