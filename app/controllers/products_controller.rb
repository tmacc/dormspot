class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 18)
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to products_path, notice: "Not authorized to edit this product" if @product.nil?
    end

    def product_params
      params.require(:product).permit(:description, :image)
    end
end
