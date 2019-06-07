#require 'date'
#a_fecha_modal = find_by_link(class: 'btn-close-modal')

class ViajaNetPage < SitePrism::Page
   # a_fecha_modal = find_by_link(class: 'btn-close-modal')

   set_url 'https://www.viajanet.com.br/'
   element :fecha_modal, "a[class='btn-close-modal']"
   element :destino, "#inptdestination"
   element :link_destino, "ul[class = 'ui-autocomplete'] > li > a"
   element :input_ida, "#departureDate"
   element :data_ida, ".btn-21"+(Time.now.strftime("%-m").to_i + 1).to_s+"2019"
   element :data_volta, ".btn-29"+(Time.now.strftime("%-m").to_i + 1).to_s+"2019"
   element :pesquisar, ".btn-submit"
   element :comprar, "ul:nth-child(1) > vn-full-recommendation > div > div > vn-recommendation-air > li > div.sticky_price.ng-scope > a"
   

   def click_fecha_modal
      wait_until_fecha_modal_visible 
      fecha_modal.click
   end

   def set_destino cidade
      destino.click
      destino.set cidade
      link_destino.click
   end
   def click_data_ida
      input_ida.click
      data_ida.click
   end

   def click_data_volta
      data_volta.click
   end

   def click_pesquisar
      pesquisar.click
   end

   def click_comprar
      #page.driver.browser.switch_to.window page.driver.browser.window_handles.last
      switch_to_window windows.last
      comprar.click
   end

   

end

