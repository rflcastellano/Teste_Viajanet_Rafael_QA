class ViajaNetCheckoutPage < SitePrism::Page

    set_url ''
    element :nome, "#nome_0"
    element :sobrenome, "#lastName_0"
    element :data_nascimento, "#birth_0"
    
    element :sexo, "select[name = 'gender_0']"
    element :sexo_masculino, "select[name = 'gender_0'] > option:nth-child(2)"
    element :sexo_feminino, "select[name = 'gender_0'] > option:nth-child(3)"

    element :bandeira, "#flag_card"
    element :numero_cartao, "#number_card-0"
    element :mes_cartao, "select[id = 'month-0']"
    element :ano_cartao, "select[id = 'year-0']"
    element :titular_cartao, "#name_card-0"
    element :cpf_cartao, "#cpf_card-0"
    element :cod_cartao, "#codesecure_card-0"
    
    element :cep, "#zipcode-0"
    #clicar para exibir os dados referente ao cep
    element :numero_end, "#number_address-0"
    element :email, "#contact_email"
    element :email_confirma, "#contact_email_confirm"
    element :celular, "#contact_phonenumber_0"
    element :aceito_condicoes, "#accept-checkout"

    element :comprar, "#frmCheckout > div.accept-checkout > div.accept-checkout__submit-area > button"
    element :reserva_processamento, "#topo > div.page.fluxo-confirmation.ng-scope > div.page.ng-scope > section > div > div > h1 > span > small"

    def set_nome _nome
        #page.driver.browser.switch_to.window page.driver.browser.window_handles.last
        switch_to_window windows.last
        nome.set _nome
    end

    def set_sobrenome _sobrenome
        sobrenome.set _sobrenome
    end

    def set_data_nascimento _data_nascimento
        data_nascimento.set _data_nascimento
    end

    def select_sexo _sexo
        #sexo.set _sexo
        sexo.click
        if _sexo == "Masculino"
            sexo_masculino.click    
        else
            sexo_feminino.click
        end
        
    end

    def select_bandeira _bandeira
        bandeira.select _bandeira
    end

    def set_numero_cartao _numero_cartao
        numero_cartao.set _numero_cartao
    end

    def select_mes_cartao _mes_cartao
        mes_cartao.select _mes_cartao
    end

    def select_ano_cartao _ano_cartao
        ano_cartao.select _ano_cartao
    end

    def set_titular_cartao _titular_cartao
        titular_cartao.set _titular_cartao
    end

    def set_cpf_cartao _cpf_cartao
        cpf_cartao.set _cpf_cartao
    end

    def set_cod_cartao _cod_cartao
        cod_cartao.set _cod_cartao
    end

    def set_cep _cep
        cep.set _cep
    end

    def set_numero_end _numero_end
        numero_end.click
        sleep(2)
        numero_end.set _numero_end
    end

    def set_email _email
        email.set _email
    end

    def set_email_confirma _email_confirma
        email_confirma.set _email_confirma
    end

    def set_celular _celular
        celular.set _celular
    end

    def click_aceito_condicoes
        aceito_condicoes.click
    end

    def click_comprar
        comprar.click
    end

    def get_reserva_processamento
        wait_until_reserva_processamento_visible
        return reserva_processamento.text
    end


end