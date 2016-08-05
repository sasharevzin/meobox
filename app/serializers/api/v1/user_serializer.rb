class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :password, :password_confirmation, :avatar
 
end
