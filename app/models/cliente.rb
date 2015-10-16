class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Cliente < ActiveRecord::Base
	
	## VALIDAÇÕES
	validates :nome, :cpf, :fone, :data_nascimento, :email, presence: true
	validates :nome, length: { in: 6..40 }
	# validates :cpf, numericality: true
	validates :cpf, numericality: { only_integer: true }
	validates :email, email: true
	validates :email, uniqueness: true, on: :update


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

	# def idade(data_nascimento)
	# 	if data_nascimento.present? && data_nascimento.class == Date.new.class
	# 	  begin
	# 	    birthday = data_nascimento
	# 	    age = Date.today.year - birthday.year
	# 	    age -= 1 if birthday > Date.today.years_ago(age)
	# 	    age
	# 	  rescue Exception => e
	# 	    e
	# 	  end
	# 	else
	# 		'Inválido'
	# 	end
	# end		
end
