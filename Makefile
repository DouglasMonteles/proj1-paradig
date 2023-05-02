build:
	docker build . -t haskellzitos

up:
	docker run -it haskellzitos:latest 

Resumindo, a gente comentou sobre o fato da prof ter aceitado o tema (jogo termo), mas com a resalva de não criar algo muito simples. O noso repositório no github já foi criado, junto com a base do projeto (pasta chamada termo) e a ideia agora é pensar-mos nas funções do jogo
Aliás, esqueci de avisar, mas eu já criei o arquivo docker do projeto e para facilitar nos comandos, criei tbm um Makefile, daí basta rodar um make build e depois um make up para executar o projeto, ou make build-and-run que faz os dois, se tudo der certo, no console será exido a string "someFunc", depois disso, basta criar módulos dentro de src e chama-los dentro da main que está na pasta app