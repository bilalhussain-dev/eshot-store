class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    flash[:notice] = "Edited Successfully"
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product deleted."
    redirect_to products_path
  end


  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :stock)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
