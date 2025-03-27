class Exempla::ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show]
  before_action :set_product, only: %i[ show edit update destroy ] 

  def index
    @products = Exempla::Product.all
  end

  def show
  end

  def new
    @product = Exempla::Product.new
  end

  def create
    @product = Exempla::Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to exempla_products_path
  end

  private

  def product_params
    params.expect(exempla_product: [ :name, :description, :featured_image ])
  end

  def set_product
    @product = Exempla::Product.find(params[:id])
  end
end
