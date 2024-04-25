# frozen_string_literal: true

module Types
  class HabitatType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :zoological_park_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
