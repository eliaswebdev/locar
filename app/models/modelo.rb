class Modelo < ActiveRecord::Base

	## ESCOPE
	default_scope -> {order(nome: :asc)}

	## RELACIONAMENTOS
	belongs_to :marca

	## VALIDAÇÕES
	validates :nome, :marca_id, presence: true
	validates :nome, uniqueness: true
end
