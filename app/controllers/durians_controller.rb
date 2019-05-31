require 'httparty'
require 'nokogiri'

class DuriansController < ApplicationController
  def index
    @durians = Durian.all

    if (session["cart"] == nil)
      session["cart"] = []
    end

    if (session["delivery_details"] == nil)
      session["delivery_details"] = {}
    end

  end

  def compare_price
    @products = []
    @url = "https://www.durianculture.com/product-category/durians/"

    doc = HTTParty.get(@url)
    @parse_page = Nokogiri::HTML(doc)

    scrapped_products = @parse_page.css(".product-type-simple")

    scrapped_products.each do |scrapped_product|

      @products.push( {
        "name" => scrapped_product.children[1].text.delete("\n\t").split("$")[0],
        "price" => scrapped_product.children[1].text.delete("\n\t").split("$")[1]
      })
    end

  end

end