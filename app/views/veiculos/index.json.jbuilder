json.array!(@veiculos) do |veiculo|
  json.extract! veiculo, :id
  json.url veiculo_url(veiculo, format: :json)
end
