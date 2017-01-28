ActiveAdmin.register Responsible do
	permit_params :name, :rg, :cpf, :schooling, :created_at, :updated_at, :user_id

	form do |f|
		inputs 'Responsáveis' do
      input :name, label: "Nome:"
      input :rg, label: "R.G:"
      input :cpf, label: "C.P.F:"
      input :schooling, label: "Escolaridade:"
      f.inputs do
        f.has_many :students, heading: 'Alunos', allow_destroy: true do |s|
          s.input :name, label: "Nome do Aluno:"
          s.input :birth_date, label: "Data de nascimento:"
          s.input :place_of_birth, label: "Cidade onde nasceu:"
          s.input :school_year, collection: (Time.now.year - 3)..(Time.now.year + 3), label: "Ano letivo:"
          s.input :start_date, label: "Ano letivo da primeira matricula:"
          # f.inputs do
            s.has_many :behaviors, heading: false, allow_destroy: true do |b|
              b.inputs :description, collection: Behavior.all, as: :check_boxes, label_method: :description
            end
          # end
          s.input :another_behavior, label: "Outros:"
          s.input :state, label: "Estado:"
          # f.inputs do
            s.has_many :medic_info, heading: 'Ficha médica', allow_destroy: true do |mi|
              mi.input :surgery, label: 'Responsibles'
            end
          # end
      end
      end
    	f.inputs do
      	f.has_many :user, heading: 'Usuário', allow_destroy: true do |u|
            u.input :email, label: "Email"
    		end
    	end
    	f.actions
    end  
	end
end
