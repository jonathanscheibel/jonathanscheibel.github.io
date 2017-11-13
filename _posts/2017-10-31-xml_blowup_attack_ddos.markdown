---
layout: post
title:  "Seu site pode cair a qualquer momento!"
date:   2017-11-13 10:54:24
categories: seguranca_informacao
tags: segurança;ddos;python;xml;wordpress;Drupal;XML;Blowup;Attack;
image: /assets/article_images/2017-10-31-xml_blowup_attack_ddos/nuclear-explosion-radius-statistics.jpg
image2: /assets/article_images/2017-10-31-xml_blowup_attack_ddos/nuclear-explosion-radius-statistics-mobile2.jpg
---
#Provavelmente seu site não está seguro!

Venho falar sobre o ataque XML-RPC Blowup DDoS, para alguns, o nome é sugestivo, para outros pode ser uma novidade aterrorizante.

Seu portal/site pode cair se você - ou administradora - não estiver atento(a) as correções mais recentes sobre XML-Blowup. Com a técnica descrita abaixo é possível "derrubar" dentro de alguns segundos sites inteiros dependendo da arquitetura utilizada. 

##Efeitos
- Inoperabilidade (ficar fora do ar);
- vazamento de dados (Alguns bancos de dados ficarão vulneráveis devido ao ataque).

>Reportado ainda como CVE-XXXXX o autor Nir Goldshlager publicou através de [salesforce.com](http://salesforce.com  "Salesforce.com ") sua identificação (0 day) para sistemas que utilizam a interface de comunucação XML-RPC. Para utilização do script apliquei rafatoração para melhoria do script nos seguintes pontos: 

##Refatoração antes da publicação
1. passagem de URL completa por parametro;
2. passagem da última página por parametro (opcional); 
3. mudança do web agente para mozilla mais recente.

##Sistemas vulneráveis
- WordPress
- Drupal
- Outros

#Links
Você pode fazer o download do script gratuitamente em meu repositório: [Downlaod Script (https://github.com/jonathanscheibel/XML-Blowup-Attack-DoS/blob/master/cve-xxxx1.py "Todos direitos reservados").

#Tecnologia e utilização 
>O script foi escrito em python, totalmente livre e documentado, funciona através de threads 
>
> - Apple
> - Banana
> - Plum
