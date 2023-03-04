class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end


  def new
    @supplier = Supplier.new
  end

  def index
    @supplier = Supplier.new(@supplier_params)

    if @supplier.save
      redirect_to @supplier
    else
      render 'new'
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])

    if @supplier.update(supplier_params)
      redirect_to @supplier
    else
      render 'edit'
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    redirect_to suppliers_path
  end


  private
    def suppliers_params
      params.require(:supplier).permit(:name)
    end
end
