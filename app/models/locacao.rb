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
    validate :quilometragem_final_obrigratoria

	def data_prevista_valida
		if data_prevista.present? && (data_prevista < data_locacao)
			errors.add(:data_prevista, "A data prevista tem que ser maior ou igual a data de locação")
		end
	end

	def quilometragem_final_valida
		if data_devolucao.present? && quilometragem_final.present? && quilometragem_final < quilometragem_inicial
			errors.add(:quilometragem_final, "A quilometragem final tem que ser maior que a quilometragem inicial")
		end
	end

	def quilometragem_final_obrigratoria
	  if data_devolucao.present?
		  unless quilometragem_final.present?
		  	errors.add(:quilometragem_final, "A quilometragem final é obrigatória")
		  end
	  end
	end

	## ESCOPOS

	# TODAS AS LOCAÇÕES QUE ESTÃO EM ABERTO
	def self.alugado
		where('data_devolucao IS NULL')
	end

	# TODAS AS LOCAÇÕES QUE JÁ FORAM CONCLUIDAS
	def self.disponivel
		where('data_devolucao IS NOT NULL')
	end

	# HELPERS

	def dias_locados
		if data_devolucao.present?
			(data_devolucao - data_locacao).to_i
		else
			0
		end
	end

	def custo_total
		if data_devolucao.present?
			((data_devolucao - data_locacao).to_i) * valor_diaria - (valor_desconto.present? ? valor_desconto : 0)
		else
			0
		end
	end

end
