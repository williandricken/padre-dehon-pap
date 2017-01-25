ActiveAdmin.register Responsible do
	permit_params :name, :rg, :cpf, :schooling, :created_at, :updated_at, :user_id

	form do |f|
		f.inputs 'Responsáveis'
    		f.inputs do
      			f.has_many :students, heading: 'Alunos', allow_destroy: true do |a|
       	 		a.inputs 'Responsibles'
      		end
    	end
    	f.actions
	end
end
