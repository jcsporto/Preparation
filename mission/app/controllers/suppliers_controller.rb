class SuppliersController < ApplicationController
  def index
    @supplier = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
    @account =  @supplier.build_account
  end

  def edit
    @supplier = Supplier.find(params[:id])
    @account = @supplier.account
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    if  @supplier.update(supplier_params)
      redirect_to  @supplier, notice: 'supplier atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    redirect_to supplier_url, notice: 'supplier excluído com sucesso.'
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, account: [:id, :name])
  end
end