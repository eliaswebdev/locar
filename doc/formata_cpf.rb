cpf = "99865494532"

puts cpf.size

puts "#{cpf[0..2]}.#{cpf[3..5]}.#{cpf[6..8]}-#{cpf[9..10]}" if cpf.size == 11

Cliente.all.map {|c| c.update(cpf: "#{c.cpf[0..2]}.#{c.cpf[3..5]}.#{c.cpf[6..8]}-#{c.cpf[9..10]}") if c.cpf.size == 11}