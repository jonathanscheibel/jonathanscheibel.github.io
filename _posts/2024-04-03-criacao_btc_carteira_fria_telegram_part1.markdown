---
layout: post
title:  "Criação de carteira fria e integração com Telegram #[1/2]"
date:   2024-04-03 23:50:12
categories: seguranca_informacao
tags: segurança;vazamento;video;vimeo;aula;
image: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/capa_btc_telegram.jpg
image2: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/capa_btc_telegram.jpg
---
#	<center>Resolvendo o problema para recebimento automático de Bitcoin: Usando python para manipulação de carteira fria além de integração com Telegram.</center>


## _Índice:_

  * [_Descrevendo o problema_](#descrevendo-o-problema)
    + [_Corretoras_](#corretoras)
    + [_Mercado_](#mercado)
  * [_Vamos começar_](#vamos-começar)
    + [_Integração com electrum_](#integração-com-electrum)
    + [_Mostrando a classe de manipulação_](#mostrando-a-classe-de-manipulação)
    + [_Configurações do projeto_](#configurações-do-projeto)
    + [_Executando monitoramento da carteira_](#executando-monitoramento-da-carteira)
    + [_Criando um endereço de recebimento_](#criando-um-endereço-de-recebimento)
    + [_Detectando recebimento de bitcoin_](#detectando-recebimento-de-bitcoin)
  * [_Conclusão_](#conclusão)
  * [_Bonus - Instação e execução do projeto_](#bonus---instação-e-execução-do-projeto)


## _Descrevendo o problema:_
---

### _Corretoras:_
Hoje muitas pessoas e empresas recebem e enviam seus bitcoins, seja através de corretoras ou carteiras frias e/ou offline.  Seja através de internet comum ou através de redes decentralizadas como [TOR](https://www.torproject.org ) ou [NYM](https://nymtech.net/).

Sabemos que corretoras trazem diversas vantagens em relação ao trabalho não gasto para as operações crypto, porém nem tudo são flores. As enormes taxas de transmissão geralmente não são negociaveis, ou seja, a flexibilidade de pagamento através do caso em especifico da transação (vulgo prioridade da fila) se torna indefinido, ou seja, impossível. Essa é só uma das muitas maneiras de "roubo" que as corretoras possuem para ludibriar o operador. Mesmo sendo uma transação não prioritária, você e seu cliente paragará por isso. Por conseguinte perderão dinheiro.

Além destas taxas abusivas, temos que saber também que; a consideração por sua **nossa privacidade não existe**. Para piorar a situação, se você utiliza alguma corretora com empresa aberta no Brasil (CPNJ), é certo dizer que a receita federal pode requisitar seus fundos a qualquer momento. Mesmo com a praticidade em transitar seus investimentos em uma só carteira utilizando redes diversas, saiba que isso é possivel sem que haja a necessidade de pagar uma furtina para isso.

> Um exemplo: Você pode operar USDT utilizando a rede Bitcoin, utilizando o protocolo de forma correta, inclusive aproveitando da rede lightning. Mas isso é assunto para outra postagem.

### _Mercado:_

Bem como alguns já sabem, não só de fraldes ou operações ilicitas vive o bitcoin. Alias, essa é uma mínima fração de utilização do bitcoin. De acordo com a [chainalysisem](https://go.chainalysis.com/rs/503-FAP-074/images/Crypto_Crime_Report_2023.pdf) 2023 foram somente 11bi. Além de estar diminiundo estes casos com o passar dos anos, vale a pena dizer que esta informação está se disseminando, ajundando no esclarecimento deste mito.

Para operar de forma mais amigável, as operadoras fornecem alguns **recursos interessantes, porém caros**. Para que você utilize das vantagens de mercado em crypto, de forma encapsulada, as corretoras omitem funcionalidades, com isso ficamos a mercê da disponibilidade de funcionalidades que, talvez, seriam de grande valia para nosso negócio. Convenhamos que aprender a utilizar todo o protocolo destas redes crypto precisaria de muito tempo, esforço e dedicação.

> Não. Não estou dizendo ou recomendando que faça isso! Não precisa se tornar um especialista nestes protocolos. Até mesmo por quê, nem mesmo eu sou. Porém conhecer alguns recursos omitidos pelas corretoras tradicionais faz muito bem. E vou mostrar como.

Irei dividir esta postagem em duas partes, Nesta primeira parte irei mostrar uma classe de manipulação de BTC pela rede BTC utilizando o Electrum, criação de carteira fria, utilização da rede lightning, cujo encapsula a rede BTC e que também permite a manipulação e visualização de maneira detalhada de suas transações.

Em uma segunda parte, irém utilizar desta classe (a resposnsavel por manipular a carteira) em um bot para o telegram.  Chamarei de client, pois pode ser qualquer modelo ou protótipo e/ou frontend de iteração com seu cliente final.  Esta camada que irei abordar a seguir se dá por exemplificar as vantagens de utilização em automatizações e como faze-la.

## _Vamos começar:_
---

### _Integração com electrum:_
Primeiramente precisamos baixar o Electrum. Atualmente na versao: [Electrum 4.5.4](https://download.electrum.org/4.5.4/Electrum-4.5.4.tar.gz) (4.5.4 na versão semantica). É preciso fazer o download da versao para python e em seguida faça vendoring. Caso voce precise de ajuda para realizar o vendoring, recomendo assistir esta live do [Eduardo Mendes](https://dunossauro.live). A live está no youtube como: [Sua aplicação NÃO está segura](https://www.youtube.com/watch?v=cEkA9PH2oEk) para entender mais sobre esta técnica.

Uma das vantagens para escolha deste projeto é de que o mesmo foi construido com python. Isso nos dá flexibilidade para escalar e trazer novas features para o projeto.

Com ele devidamente instalado no projeto, construí uma classe que utiliza o daemon (serviço disponibilizado pelo Electrum) para que eu possa consumi-lo via API.
```
async def start_daemon(self):
    command = f"{self._ELECTRUM} daemon -d"
    await self.execute_command(command)
```
`Não se preocupe, você verá este projeto em sua integra mais tarde!`

Observe que este método executa o comando do binário baixado e executa-o em backgroud (para utilização de integrações).  Como verá abaixo, criei um métido para carregar a carteira previamente construida. Veja:
```
async def load_wallet(self):
    command = f"{self._ELECTRUM} -w {self._wallet_path} load_wallet -W {self._wallet_pass}"
    await self.execute_command(command)
```
> Caso seja necessário, você pode ver como criar sua carteira neste link: [https://medium.com/@teerre/criando-uma-carteira-bitcoin-multisig-com-electrum-6edeef98fdb](https://medium.com/@teerre/criando-uma-carteira-bitcoin-multisig-com-electrum-6edeef98fdb)

Assim sendo, no construtor da classe, eu executo a instrução de carregamento do daemon e por conseguinte faço o carregamento da carteira.
```
async def init_wallet(self):
    await self.start_daemon()
    await self.load_wallet()
    await self.monitor_payment()
```

Observe que também existe um método que também é assincrono, para monitoramento de pagamentos recebidos, no qual eu irei abordar no tópico "6 - Detectando recebimento".

### _Mostrando a classe de manipulação:_
Para melhor explicação, começarei mostrando a criação da instancia da classe que fará o trabalho de "levantar" o serviço do Electrum, para que ela seja capaz de se conectar a nossa wallet e também criar nosso hash para recebimento de bitcoins. Veja o entrypoint deste módulo que chamei de wallet_btc.py:
```
if __name__ == "__main__":
    db_cproxbot, loop_base = init_data_base()


    async def main():
        helper_btc = HelperBTC(db_cproxbot)
        try:
            additional = {"id": "00692847", "sys": "SYSTEM_ABC", "nome": "Jonathan Scheibel", "tel": "21999999999"}
            description = f'{additional["sys"]} - {additional["id"]} - Agendamento em sistemas'
            hash_btc, uri_btc = await helper_btc.request_btc(id_telegram=additional["id"], description=description,
                                                             additional_info=additional)
            print(hash_btc, uri_btc)
            while True:
                await asyncio.sleep(3)

        finally:
            del helper_btc


    asyncio.run(main())
```

Vou me atentar em explicar um pouco sobre caracteristicas especiais da regra de negocio, visto que, estou considerando o pressuposto de que você já está familiarizado com as demais instruções python. Caso tenha alguma duvida sobre os itens que eu não irei mencionar aqui, você pode me chamar no telegram: [@jonathansmorais](https://t.me/jonathansmorais)

Primeiramente vou falar sobre criação da variavel `additional`, no qual serve para enviar para o objeto HelperBTC algumas informações vindas do bot do telegram (vulgo client de exemplo). A referência para a postagem está [neste link](https://jonathanscheibel.github.io/seguranca_informacao/2024/04/01/criacao_btc_carteira_fria_telegram_parte_2.html).

Gostaria de mensionar também a chamada ao métido `request_btc` que retorna uma tupla. Este método não só devolve o hash novo gerado automaticamente pela instancia, como também uma URI, no qual será gerado um QRCode pelo objeto que irá consumir este retorno.

```
class HelperBTC:
    def __init__(self, connection):
        if not connection:
            raise Exception("É necessário uma conexão de banco de dados para esta classe. Passe para o construtor do "
                            "objeto ao menos uma base de dados sqlite.")
        self._monitor_task = None

        logging.basicConfig(level=logging.INFO)
        self._ELECTRUM = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../electrum', 'Electrum-4.5.2',
                                      'run_electrum')
        self._wallet_path = get_env("WALLET_PATH")
        self._wallet_pass = get_env("WALLER_PASS")
        self.connection = connection
        self._stop_event = threading.Event()
        self._loop = asyncio.new_event_loop()
        self.start()
[...]
```
Acima, estou mostrando a classe construtora, para que, antes de qualquer analise do código, você possa ter uma ideia de quão simples a clenter code hereasse é, em relação aos beneficios que ela carrega.

### _Configurações do projeto:_
Para melhor organização do projeto em tempo de desenvolvimento, forneci ao projeto um arquivo de configuração que você pode visualizar abaixo:
![Arquivo de configuração do projeto mostrando os valores para variáves de conexão com banco de dados e caminho da wallet do Electrum](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/conf_wallet_sqlite.jpg)
Ao clonar o projeto, será necessário alterar estas configurações para seu escopo local, obviamente.

### _Executando monitoramento da carteira:_
Primeiramente irei instanciar o objeto sem a execução do método `request_btc` justamente para que haja um tópico separado e mais organizado para isso. Irei comentar esta instrução.
com o ambiente virtual criado e ativado, ao executar o helper, graças ao sistema de logging criado, podemos observar no terminal as saídas do script:

![Imagem de logging no monitoramento da carteira bitcoin, mostrando a busca por movimentações ](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/logging_wallet_monitor.png)
> Disclaimer: **nunca** execute seus projetos com usuário administrador, este usuário que estou mostrando é somente um exemplo. Colabore para o projeto, com itens uteis, como a melhoria do logging, utilização de telemetria e observabilidade. Fique a vontade para isso.

### _Criando um endereço de recebimento:_
Veja abaixo a criação do hash dinamicamente, ou seja, cada transação terá um hash unico, assim aumentando a segurança e privacidade da sua wallet. Com isso, ao integrar com seu negocio você pode isolar os paragentos com nivel de granularidade aperfeiçoado. Além disso, veja que na URI possui alguns valores do protocolo BTC para que a wallet do cliente seja preenchida autometicamente. Veremos isso na aplicação client que faremos utilizando o telegram.
![Gerado hash para recebimento automático na blockchain](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/hash_para_recebimento.png)

É interessante ressaltar também, que, por ser uma classe assincrona, a mesma está preparada para requisições simultaneas e resolução de clientes que demandam processamentos deste tipo. Em outras palavras, a aplicação não para para gerar hashs de bitcoin enquanto verifica se houve algum pagamento.

![Realizando o pagamento via URI](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/realizando_pagamento.gif)

Agora você pode converir a transação na blockchain. É possível visualizar todos os dados desta operação, veja:
[https://blockchain.com/explorer/tra...](https://www.blockchain.com/explorer/transactions/btc/3d07b2b3009b3b1521cd1a5072033aaf56563b14532d60cbb03e058002be3479)

Assim que o bitcoin for confirmado por no mínimo três nós, o pagamento é marcado como recebido. Isso é o que veremos no próximo tópico.

### _Detectando recebimento de bitcoin:_
Existem algumas triggers que podem ser disparadas ao reconhecer o pagamento na blockchain pelo objeto HelperBTC. Aqui vou mostrar a impressão no terminal, mas o output pode ser implementado por demanda.

![Pagamento detectado. Três ou mais blocos da blockchain o confirmaram.](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/pagamento_confirmado.png)
Pergunta: ”E isso não deveria ficar salvo no banco de dados da aplicaçao?”

> Sim e não. A responsabilidade de guardar estas informações de operações na blockchain fica para a wallet do Electrum, porém a regra de negocio da utilização da classe HelperBTC sim utiliza-se de banco de dados. Veja as configurações da aplicação ao clonar o repositório.

A elaboração do mecanismo de detecção de pagamento é simples e não precia de mais detalhes explicatórios.

## _Conclusão:_
Primeiramente peço desculpas por inúmeros topicos não abordados, porém em minha defesa, o trabalho ficaria pouco prático para sua leitura. E também convem explicar que, este assunto é muito amblo e a gama de possibilidades é quase que infinita.

Neste primeiro post, mostrei a funcionalidade de uma classe que resolve a comunicação entre a rede bitcoin e como manipular sua carteira localmente. A próxima etapa irei continuar este conteudo trazendo até você uma utilização pratica deste método para aplicação "real", ou seja, um aplicativo Telegram.

Outro detalhe importante que preciso deixar claro é de que, embora este mecanismo de automatização funcione muito bem na prátia, este modelo requer atenção quando se trata de moedas não fiduciarias, ou seja, cryptos por naturesa queretem uma atenção maior, por nao consumirem recursos bancários tradicionais e/ou de governos. **Em outras palavras, é importante esboçar um plano de ação para trocos e pagamentos errônios.**

O trabalho para garantir a privacidade sempre foi grande, e continuarei lutando para tal. No mais, muito obrigado pelo tempo, e para quaisquer explicações estou a disposição.


## _Bonus - Instação e execução do projeto:_

Tornei público o repositório para que você possa visualizar e colaborar.

-  Clonar o repositório e entrar no diretório:
```git clone https://github.com/jonathanscheibel/cprox.git```
```cd cprox```

-  Criando o ambiente virtual e ativando-o:
```python -m venv venv```
```source venv/bin/activate```

-  Instalando dependencias:
```pip install -r requirements.txt```

-  Executando:
```sh CProxBot.sh```
