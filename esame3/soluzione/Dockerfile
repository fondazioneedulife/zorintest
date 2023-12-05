# Utilizza immagine node LTS 20.x basata su debian per eseguire la build
FROM node:20.9.0-bookworm-slim as builder
RUN apt update && apt install -y git curl
# installo angular/cli, ultima LTS
RUN npm install -g @angular/cli@16.2.10
# Imposto una cartella di lavoro con un path root breve
WORKDIR /app
# Creo progetto angular nuovo
RUN ng new --interactive false hello-world
# Entro nella cartella del progetto creato
WORKDIR /app/hello-world
# Eseguo la build e produco i file compilati
RUN ng build
# Predispongo l'immgina nginx specificando la versione
FROM nginx:1.25.3-alpine3.18-slim
# Ricopio dallo step di build la cartella dei file compilati
COPY --from=builder /app/hello-world/dist/hello-world /usr/share/nginx/html
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
