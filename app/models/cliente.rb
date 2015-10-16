load 'email_validator.rb'

class Cliente < ActiveRecord::Base
	
	## VALIDAÇÕES
	validates :nome, :cpf, :fone, :data_nascimento, :email, presence: true
	validates :nome, length: { in: 6..40 }
	# validates :cpf, numericality: true
	# validates :cpf, numericality: { only_integer: true }
	validates :cpf, cpf: true, uniqueness: true
	
	validates :email, email: true
	validates :email, uniqueness: true, on: :create

	## BUSCA SIMPLES
	def self.search(search)
	  if search
	    where('lower(nome) LIKE ?', "%#{search.downcase}%")
	  else
	    self.all
	  end
	end

	## HELPER
	def idade
		if data_nascimento.present?
		  begin
		    birthday = data_nascimento
		    age = Date.today.year - birthday.year
		    age -= 1 if birthday > Date.today.years_ago(age)
		    age
		  rescue Exception => e
		    e
		  end
		else
			'Inválido'
		end
	end	

	def cpf_formatted
		require 'cpf_cnpj'
		cpff = CPF.new(cpf)
		cpff.formatted
	end	
end
