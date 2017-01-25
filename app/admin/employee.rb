ActiveAdmin.register Employee do
	permit_params :name, :age, :schooling, :type, :created_at, :updated_at, :user_id 
end
