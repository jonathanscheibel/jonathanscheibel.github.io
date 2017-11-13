---
layout: post
title:  "Seu site pode cair a qualquer momento!"
date:   2017-11-13 10:54:24
categories: seguranca_informacao
tags: segurança;ddos;python;xml;wordpress;Drupal;XML;Blowup;Attack;
image: /assets/article_images/2017-10-31-xml_blowup_attack_ddos/nuclear-explosion-radius-statistics.jpg
image2: /assets/article_images/2017-10-31-xml_blowup_attack_ddos/nuclear-explosion-radius-statistics-mobile2.jpg
---
#	<center>PROVAVELMENTE SEU SITE NÃO ESTÁ SEGURO! </center>
##	Veja o motivo pelo qual você deveria se preocupar com seu conteúdo online.

<p>Venho falar sobre o ataque XML-RPC Blowup DDoS, para alguns, o nome é sugestivo, para outros pode ser uma novidade aterrorizante.

Seu portal/site pode cair se você - ou administradora - não estiver atento(a) as correções mais recentes sobre XML-Blowup. Com a técnica descrita abaixo é possível "derrubar" dentro de alguns segundos sites inteiros dependendo da arquitetura utilizada. 

##	Efeitos
- Inoperabilidade (ficar fora do ar);
- vazamento de dados (Alguns bancos de dados ficarão vulneráveis devido ao ataque).

Reportado ainda como CVE-XXXXX o autor Nir Goldshlager publicou através de [salesforce.com](http://salesforce.com  "Salesforce.com ") sua identificação (0 day) para sistemas que utilizam a interface de comunucação XML-RPC. 
>>>>>>>>	<i>This is a Proof of Concept Exploit, Please use responsibly. Nir Goldshlager.</i>	 

##	Refatoração antes da publicação
Para utilização do script apliquei rafatoração para melhoria do script nos seguintes em pontos que veremos asseguir.

1. passagem de URL completa por parametro;
2. passagem da última página por parametro (opcional); 
3. mudança do web agente para mozilla mais recente.

##	Tecnologia e utilização
Baixe o script em meu repositório aqui no github: [Downlaod Script](https://github.com/jonathanscheibel/XML-Blowup-Attack-DoS/blob/master/cve-xxxx1.py "Todos direitos reservados").
 
O script foi escrito em python, totalmente livre e documentado, funciona através de [threads](https://pt.wikipedia.org/wiki/Thread_(ci%C3%AAncia_da_computa%C3%A7%C3%A3o), no qual cada requisição envia para o serviço web uma enorme quantidade de informações, fazendo assim a sobrecarga do serviço, podendo afetar todos os serviços do sistema operacional. 

##	Prevenção (Parte técnica)
	Atenção: Caso não tenha experiência/confiança nos processos asseguir, 
	não prociga com as possiveis soluções e procure o administrador 
	do seu portal/conteúdo online para as demais prevenções, pois 
	quaisquer alterações incorretas poderá causar problemas irreverssíveis.  

###	Possíveis soluções:
1.	Bloquear acesso ao xmlrpc.php
2.	Editar wp-config.php (Para casos de WordPress)
	Adicionar depois de encontrada "ABSPATH" adicione ao final da linha: 
	add_filter('xmlrpc_enabled', '__return_false');
3.	Adicionar no arquivo .htaccess (caso possua em seu serviço)
	<Files xmlrpc.php>
	Order Deny,Allow
	Deny from all
	</Files>
	
###	Auxílio de frameworks 
Algumas hospedagens mais maduras no mercado já estão tratando a vulnerabilidade, como por exemplo a [hostinger](https://www.hostinger.com). Procure sempre utilizar hospedagens confiáveis ou se tratando de VPS não esqueça de implementar regras de firewall para evitar [DDoS](https://pt.wikipedia.org/wiki/Ataque_de_nega%C3%A7%C3%A3o_de_servi%C3%A7o).	

##	Gestão de incidente 
Você - ou sua administradora do conteúdo online - pode utilizar ferramentas como por exemplo [maltrail](https://github.com/stamparm/maltrail) para gerir a segurança, controlando os acessos maliciosos com mais eficácia em seu serviço online.

##	Não se preocupe
Sistemas caem a todo momento, caso você tenha curiosidade visite o [DownDetector](http://downdetector.com.br/) antigo "caiutudo" para conhecer as estatísticas de falhas dos sistemas mais conhecidos e utilizados do mundo.

###	Fontes:
-	http://downdetector.com.br/
*	http://frameworkvulnerable.com 
-	http://www.100security.com.br/
-	https://www.hostinger.com.br/
-	https://www.grupoinfocomercial.com/
-	https://www.darknet.org.uk/
