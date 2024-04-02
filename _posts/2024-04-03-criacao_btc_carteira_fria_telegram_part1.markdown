---
layout: post
title:  "Criação de carteira fria de Bitcoin e integração com telegram #(1/2)"
date:   2024-04-01 23:50:12
categories: seguranca_informacao
tags: segurança;vazamento;video;vimeo;aula;
image: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/capa_btc_telegram.jpg
image2: /assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/capa_btc_telegram.jpg
---
#	<center>Resolvendo o problema para recebimento automático de Bitcoin: Usando python para manipulação de carteira fria além de integração com Telegram.</center>

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
Baixe a versão mais atual do Electrum. Atualmente na versao: [Electrum 4.5.4](https://download.electrum.org/4.5.4/Electrum-4.5.4.tar.gz) (versão semantica), baixe na versao para python e faça vendoring. Caso voce precise de ajuda para realizar o vendoring recomendo assistir esta live do [Eduardo Mendes](https://dunossauro.live). A live está no youtube como: [Sua aplicação NÃO está segura](https://www.youtube.com/watch?v=cEkA9PH2oEk) para entender mais sobre esta técnica.

Uma das vantagens para escolha deste projeto é de que o mesmo foi construido com python. Isso nos dá flexibilidade para escalar e trazer novas features para o projeto.

Com ele devidamente instalado no projeto python, construi uma classe que utiliza o daemon (serviço disponibilizado pelo Electrum) para que eu possa consumi-lo via API.
```
async def start_daemon(self):
    command = f"{self._ELECTRUM} daemon -d"
    await self.execute_command(command)
```
`Não se preocupe, você verá este projeto em sua integra`

Observe que este método executa o comando do binário baixado e executa-o em backgroud (para utilização de integrações).
Como visto na imagem de configuração, também criei um métido para carregar a carteira previamente construida. Veja:
```
async def load_wallet(self):
    command = f"{self._ELECTRUM} -w {self._wallet_path} load_wallet -W {self._wallet_pass}"
    await self.execute_command(command)
```

Assim sendo, no construtor da classe, eu executo a instrução de carregamento do daemon e por conseguinte faço o carregamento da carteira.
```
async def init_wallet(self):
    await self.start_daemon()
    await self.load_wallet()
    await self.monitor_payment()
```

Observe que também existe um método que também é assincrono, para monitoramento de pagamentos recebidos, no qual eu irei abordar no tópico "6 - Detectando recebimento".

### _[2/7] - Mostrando a classe de manipulação:_
Para melhor explicação começarei mostrando a criação da instancia da classe que fará o trabalho de levantar o serviço do Electrum, conectar a nossa wallet e também criar nosso hash para recebimento dos bitcoins. Veja o dunder main deste módulo que chamei de wallet_btc.py:
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

Vou me atentar em explicar um pouco sobre caracteristicas especiais da regra de negocio, visto que, assumo que já está familiarizado com as demais instruções. Caso tenha alguma duvida sobre itens que eu não irei mencionar, pode me chamar no telegram: [@jonathansmorais](https://t.me/jonathansmorais)

Primeiramente vou falar sobre criação da variavel additional, no qual serve para enviar para o objeto HelperBTC algumas informações vindas do bot do telegram. A referência para a postagem está [neste link](https://jonathanscheibel.github.io/seguranca_informacao/2024/04/01/criacao_btc_carteira_fria_telegram_parte_2.html).

Gostaria de mensionar também a chamada ao métido `request_btc` que retorna uma tupla. Este método não só devolve o hash novo gerado automaticamente pela instancia, como também uma URI, no qual será gerado um QRCode pelo objeto que irá consumir este objeto.

Por último, estou mostrando agora a classe construtora para que, antes de qualquer analise do código, você possa ter uma ideia de quão simples a classe é, em relação aos beneficios que ela carrega.

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

### _[3/7] - Configurações do projeto:_
Para melhor organização do projeto em tempo de desenvolvimento, forneci ao projeto um arquivo de configuração:
![Arquivo de configuração do projeto mostrando os valores para variáves de conexão com banco de dados e caminho da wallet do Electrum](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/conf_wallet_sqlite.jpg)
Ao clonar o projeto, será necessário alterar estas configurações para seu escopo local, obviamente.

### _[4/7] - Executando observação da carteira:_
Primeiramente irei instanciar o objeto sem a execução do método `request_btc` justamente parq que haja um tópico separado e mais organizado para isso. Irei comentar esta instrução.
com o ambiente virtual criado e ativado, ao executar o helper, graças ao sistema de logging criado, podemos observar no terminal as saídas do script:

![Imagem de logging no monitoramento da carteira bitcoin, mostrando a busca por movimentações ](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/logging_wallet_monitor.png)
> Disclaimer: nunca rode seus projetos com usuário root, este usuário que estou mostrando é somente um exemplo. Colabore para o projeto com itens uteis como a melhoria do logging, utilização de telemetria e observabilidade. Fique a vontade para isso.

### _[5/7] - Criando um endereço de recebmento:_
Veja abaixo a criação do hash dinamicamente, ou seja, cada transação terá um hash unico, assim aumentando a segurança e privacidade da sua wallet. Com isso, ao integrar com seu negocio você pode isolar os paragentos com nivel de granularidade aperfeiçoado. Além disso, veja que na URI possui alguns valores do protocolo BTC para que a wallet do cliente seja preenchida autometicamente. Veremos isso na aplicação client que faremos utilizando o telegram.
![Gerado hash para recebimento automático na blockchain](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/hash_para_recebimento.png)

É interessante ressaltar também, que, por ser uma classe assincrona, a mesma está preparada para requisições simultaneas e resolução de clientes que demandam processamentos deste tipo. Em outras palavras, a aplicação não para para gerar hashs de bitcoin enquanto verifica se houve algum pagamento.

![Realizando o pagamento via URI](https://jonathanscheibel.github.io/assets/article_images/2024-04-03-criacao_btc_carteira_fria_telegram_part1/realizando_pagamento.gif)

[Transação na blockchain](https://www.blockchain.com/explorer/transactions/btc/3d07b2b3009b3b1521cd1a5072033aaf56563b14532d60cbb03e058002be3479)

Assim que o bitcoin for confirmado por no mínimo três nós, o pagamento é marcado como recebido. Isso é o que veremos no próximo tópico.

### _[6/7] - Detectando recebimento:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

### _[7/7] - Conclusão:_
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.








Fontes: