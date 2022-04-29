Vous disposez d'un site web statique disponible à cette adresse : https://github.com/diranetafen/static-website-example.git
Le but de ce projet est de mettre en place un pipeline complet cicd sur votre application.
La CICD devra conteneuriser l'application.
    - un squelette de Dockerfile  vous ai fournie, il faut le compléter
Il faudra refaire exactement les même étapes que celles dans le cours, à quelques différences
prêt : 
    - Le déploiement en staging et production sera fait sur des VMs et non dans Heroku
    - On utilisera Ansible pour se faciliter la vie
      - qui dit ansible dit créer des playbooks dans le repos git

Pour vous aider, un vagranfile vous est fourni, ce dernier déploie : 
    - Le serveur jenkins, avec docker et ansible installé sur ce dernier
    - Les deux serveurs de Staging et de Production, aucun outil d'installé sur ces serveurs
    - Les trois serveurs sont joignables au niveau réseau

Aide : Pour la partie déploiement avec ansible
    - Un utilisateur jenkins existe sur les 3 machines crées
        - Le répertoire personnel du user jenkins est "/var/lib/jenkins"  sur les 3 serveurs
        - Cet utilisateur Jenkins possède une paire de clés ssh.
            - Le couple de clés se trouve donc dans /var/lib/jenkins/.ssh
            - La clés publique est disponible sur les serveurs worker1 et worker2
            - La clés privée  pourrait être configurée dans ansible pour se connecter aux machines
    - Le playbook d'installation de docker (docker.yml) est fourni dans le dossier "ressources ansible"