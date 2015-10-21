class ClientesController < ApplicationController
	before_action :set_cliente, only: [:show, :edit, :update, :destroy]

	def index
		if params[:search].present?
			@clientes = Cliente.search(params[:search]).page(params[:page])
		else
			@clientes = Cliente.page(params[:page])
		end
	end

	def show
	end

	def new
		@cliente = Cliente.new
	end

	def create
		# @cliente = Cliente.create(params[:cliente])
		@cliente = Cliente.new(cliente_params)
		if @cliente.save
			redirect_to(clientes_path, notice: 'Registro foi criado com sucesso!')
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @cliente.update(cliente_params)
			redirect_to(clientes_path, notice: 'Registro atualizado com sucesso!')
		else
			render :edit
		end
	end

	def destroy
		@cliente.destroy
		redirect_to(clientes_path, notice: 'Registro excluído com sucesso!')
	end

	private
		def set_cliente
			@cliente = Cliente.find(params[:id])
		end	

		# Nunca confie em parâmetros que vinha da internet, só permita através de lista branca.
		def cliente_params
			params.require(:cliente).permit(:nome, :email, :cpf, :data_nascimento, :fone)
		end


end