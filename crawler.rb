module Crawler 
  class GooglePage < SitePrism::Page
    set_url 'http://google.com'
    element :search_input, :xpath, '//input[@name="q"]'
    element :search_button, :xpath, '//input[@name="btnK"]'
    elements :search_results, :xpath, '//h3[@class="r"]'
  end
end
