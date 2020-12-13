#Através do Makefile eu posso automatizar comandos de execução no terminal
#Para isso, basta criar um arquivo com o nome 'Makefile' como este.
#Na primeira linha eu estou definindo uma tag para guardar guardar a versão que eu vou
#usar na minha imagem. O professor falou que geralmente o código da versão da imagem
#usada é pega a partir do código hash gerada a partir de um versionamento do Git
#Então, primeiramente eu devo commitar o meu projeto no git e só aí, fazer
#o processo de publicação da imagem.
#na 'TAG'abaixo, estou executando um comando shell do sistema operacional
#para retornar somente os primeiros caracteres do código hash gerado para versão
#do git.
#em seguida, tudo que começa com ':' (dois-pontos) é como se fosse a definição de
#uma função. Então, a primeira função é a build (poderia ser qualquer nome).
#na função build eu estou definindo que imagem eu quero construir (dúvidas sobre o
#comando de build do docker, ver arquivo docker-compose).
#Depois eu defini a função para fazer login.
#em seguida, estou executando a função de tag sobre o próprio docker.
#e por último, eu estou definindo a função push para enviar a imagem
#para o docker hub. Perceba que quando defini a função tag e push
#eu estou primeiramente executando a função anterior para depois executar
#o comando seguinte. É uma forma de diminuir os comandos dados para
#executar o Make file.
#Para executar o script Makefile agora, basta ir no terminal do projeto
#e executar o comando  'maeke 'e a funcao desejada'' entao, por exemplo,
#Para o Makefile abaixo, para executar todas as funções do arquivo no terminal
#bastaria digitar: 'make build' e depois executar  'make push'. Pronto.

TAG=$(shell git log -1 --format=%h)

build:
	docker build -t php-com-mysql ./docker/
login:
	docker login
tag: login
	docker tag php-com-mysql rodrigorahman/php-com-mysql:$(TAG)
push: tag
	docker push rodrigorahman/php-com-mysql:$(TAG)