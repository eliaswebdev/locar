class Locacao < ActiveRecord::Base
	## RELECIONAMENTOS
	belongs_to :cliente
	belongs_to :veiculo

	## VALIDAÇÕES

	validates :cliente_id, :veiculo_id, :valor_diaria, :quilometragem_inicial, :data_locacao, presence: true

end
