class ProductsController < ApplicationController

  def index
    @products = Product.all

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new

    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]

    if @product.save
      flash[:notice] = "Product successfully created"
      redirect_to product_path(@product.id)
    else
      render action: 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
    # @reviews = Review.find(params[:id])
    @review = Review.new
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.price_in_cents = params[:product][:price_in_cents]

    if @product.save
      flash[:notice] = "Product successfully updated"
      redirect_to product_path(@product.id)
    else
      render action: 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:notice] = "Product successfully deleted"
    redirect_to products_path
  end

end
