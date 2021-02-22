class StoreController < ApplicationController
  before_action :set_store
  
  
  def show
    @transactions =   @store.transactions
  end


  private
  def set_store
    @store = Store.find(params[:id])
  end
end