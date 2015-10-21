class LocacoesController < ApplicationController
  before_action :set_locacao, only: [:show, :edit, :update, :destroy]

  # GET /locacoes
  # GET /locacoes.json
  def index
    @locacoes = Locacao.all
  end

  # GET /locacoes/1
  # GET /locacoes/1.json
  def show
  end

  # GET /locacoes/new
  def new
    @locacao = Locacao.new
  end

  # GET /locacoes/1/edit
  def edit
  end

  # POST /locacoes
  # POST /locacoes.json
  def create
    @locacao = Locacao.new(locacao_params)

    respond_to do |format|
      if @locacao.save
        format.html { redirect_to @locacao, notice: 'Locacao was successfully created.' }
        format.json { render :show, status: :created, location: @locacao }
      else
        format.html { render :new }
        format.json { render json: @locacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locacoes/1
  # PATCH/PUT /locacoes/1.json
  def update
    respond_to do |format|
      if @locacao.update(locacao_params)
        format.html { redirect_to @locacao, notice: 'Locacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @locacao }
      else
        format.html { render :edit }
        format.json { render json: @locacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locacoes/1
  # DELETE /locacoes/1.json
  def destroy
    @locacao.destroy
    respond_to do |format|
      format.html { redirect_to locacoes_url, notice: 'Locacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locacao
      @locacao = Locacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locacao_params
      params.require(:locacao).permit(:cliente_id, :veiculo_id, :valor_diaria, :valor_desconto, :quilometragem_inicial, :quilometragem_final, :data_locacao, :data_devolucao)
    end
end
