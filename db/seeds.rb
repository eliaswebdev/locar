# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

puts "Criando Clientes"
10.times do |i|
	puts "Criando clientes bloco #{i}"

	clientes = Cliente.create!(
		nome: FFaker::NameBR.name,
		email: FFaker::Internet.email,
		cpf: '123.456.789-00',
		data_nascimento: FFaker::Time.date,
		fone: FFaker::PhoneNumberAU.home_work_phone_number,
	)

	# cliente = Cliente.new do |c|
	# 	c.nome            = FFaker::NameBR.name
	# 	c.email           = FFaker::Internet.email
	# 	c.cpf             = '123.456.789-00'
	# 	c.data_nascimento = FFaker::Time.date
	# 	c.fone            = FFaker::PhoneNumberAU.home_work_phone_number
	# end
	# cliente.save
end

puts "Criado com sucesso!"