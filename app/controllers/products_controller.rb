class ProductsController < ApplicationController

  def new
    @product = Product.new
    @company = Company.find(params[:company_id])
  end

  def create
    @product = Product.new(product_params)
    @company = Company.find(params[:company_id])
    @product.company_id = params[:company_id]
    if @product.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def edit
    @product = Product.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @product = Product.find(params[:id])
    @company = Company.find(params[:company_id])
    if @product.update(product_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @company = Company.find(params[:company_id])
    @product.destroy
    if @product.destroy
      redirect_to company_path(@company)
    else
      render :show
    end
  end


  private

  def product_params
    params.require(:product).permit(:department, :name, :price)
  end


end
