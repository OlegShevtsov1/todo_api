module Examples
  UserData = Struct.new(
    :email,
    :password,
    :name
  ).new(
    'user@example.com',
    'password',
    'Name'
  ).freeze
end
