# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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

s1 = Student.create(name: "Willian Dantas", birth_date: "12/03/2010", place_of_birth: "Curitiba", school_year: 2016, start_date: "01/06/2016")
s2 = Student.create(name: "Pedro Luiz", birth_date: "05/06/2012", place_of_birth: "Maringá", school_year: 2017, start_date: "01/01/2017")
s3 = Student.create(name: "Ana Eduarda", birth_date: "25/04/2013", place_of_birth: "Londrina", school_year: 2016, start_date: "01/01/2016", another_behavior: "Leva brinquedos")

s1.behaviors<<Behavior.find(3)
s1.behaviors<<Behavior.find(1)
s2.behaviors<<Behavior.find(2)

r1 = Responsible.create(name: "Ivone Dantas", rg: "12.566.636-45", cpf: "333.666.999-56", schooling: "Ensino Médio")
r2 = Responsible.create(name: "João Silva", rg: "45.899.456-5", cpf: "555.888.444-99", schooling: "Ensino fundamental")
r3 = Responsible.create(name: "Geraldo Santos", rg: "12.563.563-89", cpf: "563.563.563-56", schooling: "Ensino superior incompleto")

s1.responsibles<<r1
s3.responsibles<<r2
s2.responsibles<<r1

mdi1 = MedicInfo.create(surgery: "No pé", treatment: "Para gastrite", allergic: "Amendoin", intolerant: "Lactose")
mdi2 = MedicInfo.create(surgery: "No braço", treatment: "Para ADHD", intolerant: "Lactose")
mdi3 = MedicInfo.create(treatment: "Psiquiatrico")

mdi1.diseases<<Disease.find(3)
mdi1.diseases<<Disease.find(5)
mdi2.diseases<<Disease.find(3)
mdi3.diseases<<Disease.find(1)
mdi3.diseases<<Disease.find(6)