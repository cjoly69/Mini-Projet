# L'image de base sera une image nginx:1.21.1
FROM nginx:1.21.1
# Ne pas oublier de mentionner le maintainer de l'image
LABEL maintainer = 'Catherine Joly'
# MAJ l'image, puis installer curl et git
RUN apt-get update && apt-get install -y \
    curl \
    git \
&& rm -rf /var/lib/apt/lists/*
# Supprimer le contenu du répertoire /usr/share/nginx/html/
RUN rm -rf /usr/share/nginx/html/*

# Téléchargement de l'application avec un git clone et déposer au bon endroit
RUN git clone https://github.com/diranetafen/static-website-example.git /usr/share/nginx/html/docker 

# Rajouter le fichier de conf nginx.conf de nginx  dans /etc/nginx/conf.d/.
# Ce fichier est donné avec l'énoncé

COPY nginx.conf /etc/nginx/conf.d/.

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'