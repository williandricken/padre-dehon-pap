json.extract! employee, :id, :name, :age, :schooling, :type, :created_at, :updated_at
json.url employee_url(employee, format: :json)