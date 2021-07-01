FROM node:16.3.0-alpine3.13
#workdir: cria um ditetorio e ja acessa, memso que mkdir app e depois cd app
WORKDIR /app 
#coopy: copia os arquivos package*.json para o diretorio criado "app"
COPY package*.json ./
RUN npm install
# copiar tudos os arquivos para o diretorio  e garante se houver mudanças nos outros aquivos (.js) ele atuliza so este. Usufruir das camadas cache
COPY . .
#Expose: identifica a porta que será usada pela aplicação através do docker. (obs.: quando for rodar, deve-se sempre fazer o bind para dar acesso a maquina local)
EXPOSE 8080
#CMD: vai executar o arquivo JS desta aplicação. OBS.: sempre com aspas duplas
CMD ["node", "index.js"]

#OBS.: foi setado no .dockerignore os arquivos que não serão copiados.
