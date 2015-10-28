class Marca < ActiveRecord::Base
	## VALIDAÇÕES
	# validates :nome, presence: true
	validates_presence_of :nome

	## RELACIONAMENTOS
	has_many :modelos

	## AUDITORIA
	audited
end