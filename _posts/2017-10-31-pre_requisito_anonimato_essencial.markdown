---
layout: post
title:  "Melhore o anonimato adicionando este método simples em seu workstation"
date:   2017-11-27 12:50:12
categories: seguranca_informacao
tags: segurança;anonimato;vpn;proxy;
image: /assets/article_images/2017-10-31-pre_requisito_anonimato_essencial/imagePostAnonimato.jpg
image2: /assets/article_images/2017-10-31-pre_requisito_anonimato_essencial/imagePostAnonimato2.jpg
---
#	<center>PREVENTADDRESS - MELHORIA PARA ANONIMATO NUNCA É DE MAIS!</center>
##	Adicione este método simples para auxiliar seu anonimato em seus trabalhos e/ou estudos.


# Sobre o Scrip:
[Download](https://github.com/jonathanscheibel/preventaddress/blob/master/preventaddress.sh) - Inclua este script no seu ambiente de trabalho quando existir a necessidade de anonimato. Ele trabalha em runtime, quando o script detecta que seu endereço IP não está correto, **ele derruba o dispositivo de rede previamente informado**. Esta técnica é bastante útil quando você não está de frente da tela de seu terminal e precisa parar sua conexão com o trabalho online de maneira automática caso ocorra algum problema com seu [proxy](https://pt.wikipedia.org/wiki/Proxy), [vpn](https://pt.wikipedia.org/wiki/Virtual_private_network) ou [tor](https://pt.wikipedia.org/wiki/Tor_(rede_de_anonimato)). 

# Exibição de Ajuda:
	./preventaddress.sh 

# Exemplo de Utilização:
	nohup ./preventaddress.sh eth0 187.94.206.23 BR & 
  
# Fontes:
-	https://docs.parrotsec.org/doku.php/anonsurf