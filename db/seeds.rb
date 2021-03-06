Behavior.create(description: "Fácil (alegre, tranquila, comunicativa...)")
Behavior.create(description: "Razoável (alegre, expressiva, pouco reservada)")
Behavior.create(description: "Difícil (morde, bate, grita, joga-se no chão)")
Behavior.create(description: "Chora com frequência")
Behavior.create(description: "Dorme durante o dia")
Behavior.create(description: "Usa fraldas")
Behavior.create(description: "Usa mamadeira")
Behavior.create(description: "Usa chupeta")

Disease.create(name: "Alergia/Rinite")
Disease.create(name: "Varicela (catapora)")
Disease.create(name: "Infecção de garganta")
Disease.create(name: "Refluxo")
Disease.create(name: "Bronquite")
Disease.create(name: "Conjuntivite")
Disease.create(name: "Infecção urinaria")
Disease.create(name: "Rubéola")
Disease.create(name: "Caxumba")
Disease.create(name: "Hepatite")
Disease.create(name: "Otite")
Disease.create(name: "Sarampo")

s1 = Student.new(name: "Willian Dantas", birth_date: "12/03/2010", place_of_birth: "Curitiba", school_year: 2016, start_date: "01/06/2016", state: "PR", gender: "M")
s2 = Student.new(name: "Pedro Luiz", birth_date: "05/06/2012", place_of_birth: "Maringá", school_year: 2017, start_date: "01/01/2017", state: "PR", gender: "M")
s3 = Student.new(name: "Ana Eduarda", birth_date: "25/04/2013", place_of_birth: "Londrina", school_year: 2016, start_date: "01/01/2016", another_behavior: "Leva brinquedos", state: "PR", gender: "F")

s1.behaviors<<Behavior.find(3)
s1.behaviors<<Behavior.find(1)
s2.behaviors<<Behavior.find(2)

r1 = Responsible.new(name: "Ivone Dantas", rg: "12.566.636-45", cpf: "333.666.999-56", schooling: "Ensino Médio")
r2 = Responsible.new(name: "João Silva", rg: "45.899.456-5", cpf: "555.888.444-99", schooling: "Ensino fundamental")
r3 = Responsible.new(name: "Geraldo Santos", rg: "12.563.563-89", cpf: "563.563.563-56", schooling: "Ensino superior incompleto")

s1.responsibles<<r1
s3.responsibles<<r2
s2.responsibles<<r1

mdi1 = MedicInfo.new(surgery: "No pé", treatment: "Para gastrite", allergic: "Amendoin", intolerant: "Lactose", height: 1.10, weight: 20)
mdi2 = MedicInfo.new(surgery: "No braço", treatment: "Para ADHD", intolerant: "Lactose", height: 1.34, weight: 20)
mdi3 = MedicInfo.new(treatment: "Psiquiatrico", height: 1.15, weight: 16)

mdi1.diseases<<Disease.find(3)
mdi1.diseases<<Disease.find(5)
mdi2.diseases<<Disease.find(3)
mdi3.diseases<<Disease.find(1)
mdi3.diseases<<Disease.find(6)

s1.medic_info = mdi1
s2.medic_info = mdi2
s3.medic_info = mdi3

emp1 = Employee.new(name: "Mariano", age: 21, schooling: "Ensino superior", job: "Monitor(a)")
emp2 = Employee.new(name: "Luana", age: 23, schooling: "Ensino superior", job: "Professor(a)")
emp3 = Employee.new(name: "Marlene", age: 25, schooling: "Ensino superior", job: "Professor(a)")
emp4 = Employee.new(name: "Margarida", age: 30, schooling: "Ensino superior", job: "Coordenador(a)")
emp5 = Employee.new(name: "Juliana", age: 26, schooling: "Ensino superior", job: "Nutricionista")

emp1.user = User.new(email: "#{emp1.name}@gmail.com", password: "#{emp1.name}")
emp2.user = User.new(email: "#{emp2.name}@gmail.com", password: "#{emp2.name}")
emp3.user = User.new(email: "#{emp3.name}@gmail.com", password: "#{emp3.name}")
emp4.user = User.new(email: "#{emp4.name}@gmail.com", password: "#{emp4.name}")
emp5.user = User.new(email: "#{emp5.name}@gmail.com", password: "#{emp5.name}")
 
emp1.save!
 
emp2.save!
 
emp3.save!
 
emp4.save!
 
emp5.save!

s1.save!
s2.save!
s3.save!

gr1 = Grade.create(name: "Pré 1")
gr2 = Grade.create(name: "Pré 2")

gr1.employees<<emp1
gr1.employees<<emp2
gr1.employees<<emp5
gr2.employees<<emp3

gr1.students<<s1
gr1.students<<s2
gr2.students<<s3