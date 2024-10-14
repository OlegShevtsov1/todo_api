module Examples
  DoctorData = Struct.new(
    :name,
    :description,
    :age
  ).new(
    'John Dow',
    'Awesome doctor',
    '40'
  ).freeze
end
