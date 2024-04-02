---
layout: post
title:  "Criação de carteira fria de Bitcoin e integração com telegram"
date:   2024-04-01 23:50:12
categories: seguranca_informacao
tags: segurança;vazamento;video;vimeo;aula;
image: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram/capa3_btc_telegram.jpg
image2: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram/capa3_btc_telegram.jpg
---
#	<center>Resolvendo o problema para recebimento automático de bitcoin: Utilização de carteira fria além de integração com telegram.</center>

>

## Descrevendo o problema:
Muitas pessoas e empresas hoje recebem e enviam seus bitcoins seja atraves de corretoras ou carteiras frias offline.
Seja através de internet comum ou através de redes decentralizadas como tor ou nym.
Sabemnos que corretoras trazem diversas vantagens em relação ao trabalho não gasto para as operações, porém nem tudo
são flores, as enormes taxas de transmissão geralmente não são negociaveis, ou seja, a flexibilidade de pagamento
através do caso em especifico (vulgo prioridade da fila) se torna inviável. Até mesmo por que é uma das muitas maneiras
de "roubo" que as corretoras possuem para ludibriar o operador.01
Além destas taxas abusivas, temos também que considerar que sua privacidade não existe. Para piorar a situação, se você
utiliza uma corretora com empresa aberta no Brasil, é certo dizer que a receita federal pode requisitar seus fundos a
qualquer momento.
Mesmo que, a praticidade em transitar seus investimentos em uma só carteira utilizando redes diversas, saiba que isso é
possivel sem que haja a necessidade de pagar uma furtina para isso. Um exemplo? Você pode operar USDT utilizando a rede
Bitcoin, utilizando o protocolo de forma correta, inclusive aproveitando da rede lightning. Mas isso é assunto para
outra postagem.

Bem como alguns já sabem, não só de fraldes ou operações ilicitas vive o bitcoin, alias, essa é uma mínima fração de
utilização do bitcoin. De acordo com a [chainalysisem](https://go.chainalysis.com/rs/503-FAP-074/images/Crypto_Crime_Report_2023.pdf) 2023 foram somente 11bi. Além de estar diminiundo com os anos vale a pena
dizer que este numero continua abaixando a cada ano.


Para operar de forma mais amigavel, as operadoras fornecem alguns recursos valios (porém caros) para que você utilize
das vantagens de crypto, porém de forma encapsulada, ou seja, você fica a mercê da disposição de funcionalidades que,
talvez, seriam valiosos para seu negocio. Até mesmo por que aprender a utilizar todo o protocolo destass redes
consumiria muito esforço e dedicação.

- Não. Não estou dizendo ou recomendando que faça isso, não precisa se tornar um especialista nestes protocolos, até
mesmo por que, nem mesmo eu sou. Porém conhecer alguns recursos omitidos pelas corretoras faz bem. E vou mostrar como.

Irei dividir esta postagem em duas partes, nesta primeira parte irei mostrar uma classe de manipulação da rede BTC
utilizando o Electrum, para criação de carteira fria, utilizando-se da rede lightning, cujo encapsula a rede BTC porém
te permite a manipulação de maneira detalhada de suas transações.

Em uma segunda parte, irém utilizar desta classe (a resposnavel por manipular a carteira) em um bot para o telegram.
Esta integração se dá por exemplificar as vantagens de utilização em automatizações.












## 2/3 - Vamos ao caso:
Acredito ser de pouco tempo, mas, pelo que parece, a universidade modificou a estrutura de armazenagem dos vídeos de streaming local para online. Anteriormente as aulas eram transmitidas em tempo real e baixadas em vários arquivos separadamente e “compilados” pelo navegador, fazendo com que houvesse um aproveitamento maior dos recursos da máquina do aluno/cliente. Esta metodologia buscava em um arquivo de texto o link para cada minuto e segundo do vídeo e fazia a junção em tempo de execução, tornando o processo mais custoso no lado cliente do que no servidor, evitando grande concorrência de banda entre outros aplicativos utilizadores da internet.

Qual metodologia foi aplicada agora? [Vimeo](https://www.vimeo.com). Isso mesmo. 
Veja algumas das vantagens em se adquirir uma conta business:
- Envie e receba vídeos com segurança de todos os tamanhos e desfrute de proteção por senha e privacidade em nível de domínio;
- Faça upload, incorpore e até mesmo venda seus vídeos 360 e use controles personalizados para orientar os espectadores;    
- Simplifique seu processo com uploads diretos e edição do Adobe Premiere Pro, do Final Cut Pro e do Dropbox;    
- Acompanhe quem assiste a seus vídeos e veja onde o engajamento e os horários de exibição caem;
   
Segundo [Michael Oliveira](https://www.youtube.com/watch?v=U9ZDGOrttC0) com Vímeo é possível restringir os acessos aos vídeos, porém isso ainda não está sendo feito, talvez aí seja o impacto principal e o foco onde deveria ser atacado para correção da falha.

## 3/3 - Explicação do Script:
Script criado em python em um ambiente linux para realizar o download automático somente para vídeos da universidade afim. Este tratamento é realizado utilizando o padrão encontrado no título do vídeo. Fácil né?
Com uma ferramenta nativa no sistema operacional [Parrot](https://www.parrotsec.org/) - especializado em segurança - chamada [youtube-dl](https://ytdl-org.github.io/youtube-dl/download.html) é possível fazer a checagem do vídeo antes mesmo de começar seu download, como várias outras coisas como por exemplo extração do metadata, incluir usuário e senha, especificar formato de áudio e vídeo, user-agent e muito mais. Consulte o man do aplicativo para mais informações.

Esclareço que utilizei MVP - (Minimum Viable Product) à risca neste script, isto é, ainda precisa de algumas melhorias como: 
- Expressão regular para identificação do título do vídeo;
- Controle de exceção;
- Opção de destino do download;
- Opção para debug;
- etc.

Façam fork à vontade!

Para mais informações, consulte a documentação dentro do script.
Obrigado e até a próxima!

Download: [cprox](https://github.com/jonathanscheibel/cprox)

##### Fontes:
- [Vímeo - https://vimeo.com/business](https://vimeo.com/business)
- [Michael Oliveira - https://www.youtube.com/watch?v=U9ZDGOrttC0](https://www.youtube.com/watch?v=U9ZDGOrttC0)
- [Ferramenta utilizada - https://ytdl-org.github.io/youtube-dl/download.html](https://ytdl-org.github.io/youtube-dl/download.html)
- [MVP - https://www.heflo.com/pt-br/inovacao/scrum-mvp](https://www.heflo.com/pt-br/inovacao/scrum-mvp)
- [ParrotSec - https://www.parrotsec.org/](https://www.parrotsec.org/)

