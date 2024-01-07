class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
    authorize @product
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
    authorize @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  
    redirect_to products_path, notice: 'Продукт видалено'
    authorize @product
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer)
    authorize @product
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    authorize @product
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end
  
   private
  def product_params
    params.require(:product).permit(:name, :description, :price, images: [])
  end
end
