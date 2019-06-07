#language: pt
@viajanet
Funcionalidade: ViajaNet
    Cenario: Realizar Compra
        Dado que acesso a pagina viajanet
        Quando fecho a janela modal
        E seleciono o destino para 'Dubai'
        E seleciono a data de ida e volta
        Entao clico em pesquisar
        Quando clico em comprar
        E preencho o formulario passageiro com
        |nome   |sobrenome  |data_nascimento|sexo     |
        |Rafael |Castellano |19/03/1984     |Masculino|
        E prencho o formulario do cartao de credito com
        |bandeira  |numero_cartao   |mes_cartao|ano_cartao|titular_cartao    |cpf_cartao |cod_cartao|
        |Mastercard|5256359411371909|04        |2021      |Teste Cartao      |32260388850|301       |
        E preencho o formulario de endereco com
        |cep     |numero_end|
        |03205030|289       |
        E preencho o formulario de contato com
        |email                  |confirma_email         |celular    |
        |teste@teste.com        |teste@teste.com        |11981350706|
        E clico em finalizar compra
        Entao valido que a compra esta em processamento