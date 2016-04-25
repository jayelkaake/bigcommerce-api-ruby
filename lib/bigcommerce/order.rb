module Bigcommerce
  class Order < Resource

    def products
      return @products if @products.present?
      @products = []
      products_data.each do |product_data|
        @products << Resource.new(product_data, @connection)
      end
      @products
    end

    private

    def products_data
      @connection.get("/orders/#{self.id}/products")
    end

  end
end
