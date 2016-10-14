class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params.merge(user_id: current_user.id))
    redirect_to @product
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end

  def get_product
    @product = Product.find(params[:id])
  end
end
