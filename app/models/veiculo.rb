class Veiculo < ActiveRecord::Base
	## RELACIONAMENTOS
	belongs_to :modelo
	has_many :locacoes

	## VALIDAÇÕES
	validates :modelo_id, :placa, :quilometragem, :cor, :ano_fabricacao, :ano_modelo, :portas, presence: true
	validates :placa, uniqueness: true

	## BUSCA SIMPLES
	def self.search(search)
	  if search
	    where('lower(placa) LIKE ?', "%#{search.downcase}%")
	  else
	    self.all
	  end
	end

	## UPLOAD
	mount_uploader :foto, FotoUploader
end
