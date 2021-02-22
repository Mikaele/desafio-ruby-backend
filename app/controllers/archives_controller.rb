class ArchivesController < ApplicationController
  before_action :set_archive, only: %i[ show edit update destroy ]

  def index
    @archive = Archive.new
    @archives = Archive.all
    @store = Store.all
  end

  def show
    @transactions = @archive.transactions
  end

  def create
    @archive  = Archive.new(archive_params)

    respond_to do |format|
      if @archive.save
        format.html { redirect_to @archive, notice: "Arquivo criado" }
        format.json { render :show, status: :created, location: @archive }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @archive.destroy
    respond_to do |format|
      format.html { redirect_to archives_url, notice: "Arquivo e transações removidos" }
      format.json { head :no_content }
    end
  end


  private
    def set_archive
      @archive = Archive.find(params[:id])
    end

    def archive_params
      params.require(:archive).permit(:checkhsum, :lines, :attachment)
    end
end
