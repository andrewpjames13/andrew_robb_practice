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

  private

  def product_params
    params.require(:product).permit(:department, :name, :price)
  end


end
