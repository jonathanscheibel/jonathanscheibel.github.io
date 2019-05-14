---
layout: post
title:  "Vazamento de aulas da maior universidade privada do país."
date:   2019-05-14 23:50:12
categories: seguranca_informacao
tags: segurança;vazamento;video;vimeo;aula;
image: /assets/article_images/2019-05-14-downlaod_video_universidade/post_universidade_desktop.jpg
image2: /assets/article_images/2019-05-14-downlaod_video_universidade/post_universidade_desktop.jpg
---
#	<center>Vazamento de aulas da maior universidade privada do país.</center>


####	O vazamento inclui todas as aulas independente de matéria, período, professor ou estado brasileiro. É possível até mesmo visualizar exercícios aplicados ao final de cada aula/vídeo.

> 

Download: [DownloadAulasUniversidade](https://github.com/jonathanscheibel/DownloadAulasUniversidade)

## 1/3 - Restrições de pesquisa:
Primeiramente quero deixar claro que meu intuito **não é difamar a universidade** – que inclusive venho acompanhando várias modificações importantes no tocante segurança e também não citarei o nome desta universidade – mas sim disseminar a importância e carência desta área tão importante para as organizações, e principalmente as de estudo. E mais, como todo analista de segurança deveria fazer, já alertei sobre a falha de segurança por e-mail antes da divulgação deste material.

Outra observação, não menos importante é de que não disponibilizo em hipotese alguma vídeos, links internos da página da universidade e/ou credenciais de acesso ao portal da instituição, isto é, os links aqui informados são públicos e de livre acesso a qualquer navegante web.

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

##### Fontes:
- [Vímeo - https://vimeo.com/business](https://vimeo.com/business)
- [Michael Oliveira - https://www.youtube.com/watch?v=U9ZDGOrttC0](https://www.youtube.com/watch?v=U9ZDGOrttC0)
- [Ferramenta utilizada - https://ytdl-org.github.io/youtube-dl/download.html](https://ytdl-org.github.io/youtube-dl/download.html)
- [MVP - https://www.heflo.com/pt-br/inovacao/scrum-mvp](https://www.heflo.com/pt-br/inovacao/scrum-mvp)
- [ParrotSec - https://www.parrotsec.org/](https://www.parrotsec.org/)
