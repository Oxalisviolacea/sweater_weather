class UserSerializer
  def self.format_data(user)
    {
      "data": {
        "type": 'users',
        "id": user.id,
        "attributes": {
          "email": user.email,
          "api_key": user.api_key
        }
      }
    }
  end
end
