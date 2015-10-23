class Locacao < ActiveRecord::Base
	## RELECIONAMENTOS
	belongs_to :cliente
	belongs_to :veiculo

	## VALIDAÇÕES
	validates :cliente_id, 
			  :veiculo_id, 
			  :valor_diaria, 
			  :quilometragem_inicial, 
			  :data_locacao, 
			  :data_prevista, 
			  presence: true
    
    validate :data_prevista_valida
    validate :quilometragem_final_valida


	def data_prevista_valida
		if data_prevista.present? && (data_prevista < data_locacao)
			errors.add(:data_prevista, "A data prevista tem que ser maior ou igual a data de locação")
		end
	end

	def quilometragem_final_valida
		if data_devolucao.present? && quilometragem_final.present? && (quilometragem_final < quilometragem_inicial)
			errors.add(:quilometragem_final, "A quilometragem final tem que ser maior que a quilometragem inicial")
		end
	end

	## ESCOPOS
	
	# TODAS AS LOCAÇÕES QUE ESTÃO EM ABERTO
	def self.aberto
		where('data_devolucao IS NULL')
	end

	# TODAS AS LOCAÇÕES QUE JÁ FORAM CONCLUIDAS
	def self.devolvido
		where('data_devolucao IS NOT NULL')
	end

end
