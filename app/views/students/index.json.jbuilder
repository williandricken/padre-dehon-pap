json.array!(@students) do |student|
  json.extract! student, :id, :name, :birth_date, :place_of_birth, :school_year, :start_date, :another_behavior
  json.url student_url(student, format: :json)
end
