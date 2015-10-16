module ClientesHelper
	def idade(data_nascimento)
		if data_nascimento.present? && data_nascimento.class == Date.new.class
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
end