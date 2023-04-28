build:
	docker build . -t haskellzitos

up:
	docker run -it haskellzitos:latest 