json.array!(@responsibles) do |responsible|
  json.extract! responsible, :id, :name, :rg, :cpf, :schooling
  json.url responsible_url(responsible, format: :json)
end
