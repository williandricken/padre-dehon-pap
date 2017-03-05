module EmployeesHelper
	JOBS = ["Monitor(a)", "Professor(a)", "Coordenador(a)",
		   "Nutricionista", "Cozinheria", "Zelador"] unless const_defined?("JOBS")

  SCHOOLING = ["Ensino fundamental incompleto", "Ensino fundamental completo",
      "Ensino médio incompleto", "Ensino médio completo",
      "Ensino superior incompleto", "Ensino superior completo"] unless const_defined?("SCHOOLING")
end
