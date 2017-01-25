ActiveAdmin.register Student do
	permit_params :name, :birth_date, :place_of_birth, :school_year, :start_date, :another_behavior, :created_at, :updated_at, :state

	form do |f|
		f.inputs 'Alunos'
    		f.inputs do
      			f.has_many :medic_info, heading: 'Ficha médica', allow_destroy: true do |a|
       	 		a.inputs 'Responsibles'
      		end
    	end
    	f.actions
	end

end