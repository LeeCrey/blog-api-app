# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name
end
