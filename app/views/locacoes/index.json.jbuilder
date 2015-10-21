json.array!(@locacoes) do |locacao|
  json.extract! locacao, :id, :cliente_id, :veiculo_id, :valor_diaria, :valor_desconto, :quilometragem_inicial, :quilometragem_final, :data_locacao, :data_devolucao
  json.url locacao_url(locacao, format: :json)
end
