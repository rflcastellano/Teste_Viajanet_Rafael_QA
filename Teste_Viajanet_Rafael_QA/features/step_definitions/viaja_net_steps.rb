#require 'page_objects/viaja_net_steps.rb'

Before do |scenario|
#<code>
Capybara.page.current_window.maximize
@home = ViajaNetPage.new
@checkout = ViajaNetCheckoutPage.new
end

  
Dado("que acesso a pagina viajanet") do
    @home.load
end

Quando("fecho a janela modal") do
    @home.click_fecha_modal
end

Quando("seleciono o destino para {string}") do |destino|
    @home.set_destino destino
end

Quando("seleciono a data de ida e volta") do
    @home.click_data_ida
    sleep(1)
    @home.click_data_volta
end

Entao("clico em pesquisar") do
    @home.click_pesquisar
end


Quando("clico em comprar") do
    @home.click_comprar
end

Quando("preencho o formulario passageiro com") do |passageiro|
    
    @checkout.set_nome passageiro.hashes[0]['nome']
    @checkout.set_sobrenome passageiro.hashes[0]['sobrenome']
    @checkout.set_data_nascimento passageiro.hashes[0]['data_nascimento']
    @checkout.select_sexo passageiro.hashes[0]['sexo']
end

Quando("prencho o formulario do cartao de credito com") do |cartao|
    @checkout.select_bandeira cartao.hashes[0]['bandeira']
    @checkout.set_numero_cartao cartao.hashes[0]['numero_cartao']
    @checkout.select_mes_cartao cartao.hashes[0]['mes_cartao']
    @checkout.select_ano_cartao cartao.hashes[0]['ano_cartao']
    @checkout.set_titular_cartao cartao.hashes[0]['titular_cartao']
    @checkout.set_cpf_cartao cartao.hashes[0]['cpf_cartao']
    @checkout.set_cod_cartao cartao.hashes[0]['cod_cartao']
end

Quando("preencho o formulario de endereco com") do |endereco|
    @checkout.set_cep endereco.hashes[0]['cep']
    @checkout.set_numero_end endereco.hashes[0]['numero_end']
end

Quando("preencho o formulario de contato com") do |contato|
    @checkout.set_email contato.hashes[0]['email']
    @checkout.set_email_confirma contato.hashes[0]['confirma_email']
    @checkout.set_celular contato.hashes[0]['celular']
    @checkout.click_aceito_condicoes
end

Quando("clico em finalizar compra") do
    @checkout.click_comprar
end

Entao("valido que a compra esta em processamento") do
    expect(@checkout.get_reserva_processamento).to eql 'Sua reserva está em processamento. Após a confirmação do pagamento você receberá sua passagem aérea por e-mail.'
end