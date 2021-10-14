require 'nokogiri'
require 'open-uri'
   
@page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   


def crypto_list

    arr_cryptos = []
    20.times do |elements| 
      cryptos = @page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{elements+1}]/td[3]/div")
      arr_cryptos=  arr_cryptos << cryptos.text
      end
  return arr_cryptos
end

def prices_list

    arr_prices = []
  20.times do |elements| 
    prices = @page.xpath("//*[@id='__next']/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{elements+1}]/td[5]/div/a")
    arr_prices =  arr_prices << prices.text
  end
return arr_prices
end

puts my_hash = Hash[crypto_list.zip(prices_list)]
