---
layout: post
title:  "Criação de carteira fria de Bitcoin e integração com telegram #(1/2)"
date:   2024-04-01 23:50:12
categories: seguranca_informacao
tags: segurança;vazamento;video;vimeo;aula;
image: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram/capa_btc_telegram.jpg
image2: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram/capa_btc_telegram.jpg
---
#	<center>Resolvendo o problema para recebimento automático de bitcoin: Usando python para manipulação de carteira fria além de integração com telegram.</center>

>

---

## _Descrevendo o problema:_
Muitas pessoas e empresas hoje recebem e enviam seus bitcoins seja atraves de corretoras ou carteiras frias offline.
Seja através de internet comum ou através de redes decentralizadas como tor ou nym.

Sabemnos que corretoras trazem diversas vantagens em relação ao trabalho não gasto para as operações, porém nem tudo são flores, as enormes taxas de transmissão geralmente não são negociaveis, ou seja, a flexibilidade de pagamento através do caso em especifico (vulgo prioridade da fila) se torna inviável. Até mesmo por que é uma das muitas maneiras de "roubo" que as corretoras possuem para ludibriar o operador.

Além destas taxas abusivas, temos também que considerar que sua privacidade não existe. Para piorar a situação, se você utiliza uma corretora com empresa aberta no Brasil, é certo dizer que a receita federal pode requisitar seus fundos a qualquer momento. Mesmo que, a praticidade em transitar seus investimentos em uma só carteira utilizando redes diversas, saiba que isso é possivel sem que haja a necessidade de pagar uma furtina para isso. Um exemplo? Você pode operar USDT utilizando a rede Bitcoin, utilizando o protocolo de forma correta, inclusive aproveitando da rede lightning. Mas isso é assunto para outra postagem.

Bem como alguns já sabem, não só de fraldes ou operações ilicitas vive o bitcoin, alias, essa é uma mínima fração de utilização do bitcoin. De acordo com a [chainalysisem](https://go.chainalysis.com/rs/503-FAP-074/images/Crypto_Crime_Report_2023.pdf) 2023 foram somente 11bi. Além de estar diminiundo com os anos vale a pena dizer que este numero continua abaixando a cada ano.


Para operar de forma mais amigavel, as operadoras fornecem alguns recursos valios (porém caros) para que você utilize das vantagens de crypto, porém de forma encapsulada, ou seja, você fica a mercê da disposição de funcionalidades que, talvez, seriam valiosos para seu negocio. Até mesmo por que aprender a utilizar todo o protocolo destas redes consumiria muito esforço e dedicação.

> Não. Não estou dizendo ou recomendando que faça isso, não precisa se tornar um especialista nestes protocolos, até
> mesmo por que, nem mesmo eu sou. Porém conhecer alguns recursos omitidos pelas corretoras faz bem. E vou mostrar como.

Irei dividir esta postagem em duas partes, nesta primeira parte irei mostrar uma classe de manipulação da rede BTC utilizando o Electrum, para criação de carteira fria, utilizando-se da rede lightning, cujo encapsula a rede BTC porém te permite a manipulação de maneira detalhada de suas transações.

Em uma segunda parte, irém utilizar desta classe (a resposnavel por manipular a carteira) em um bot para o telegram.
Esta integração se dá por exemplificar as vantagens de utilização em automatizações.



## _Vamos começar:_
---

### _[1/7]- Integração com Electrum (vendoring):_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

### _[2/7] - Mostrando a classe de manipulação:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
![Arquivo de configuração do projeto mostrando os valores para variáves de conexão com banco de dados e caminho da wallet do Electrum](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram/conf_wallet_sqlite.jpg)
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

### _[3/7] - Configurações do projeto:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

### _[4/7] - Executando observação da carteira:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

### _[5/7] - Criando um endereço de recebmento:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

### _[6/7] - Detectando recebimento:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

### _[7/7] - Conclusão:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.








Fontes: