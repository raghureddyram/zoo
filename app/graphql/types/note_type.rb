# frozen_string_literal: true

module Types
  class NoteType < Types::BaseObject
    field :id, ID, null: false
    field :data, GraphQL::Types::JSON
    field :notable_type, String, null: false
    field :notable_id, Types::UuidType, null: false
    field :creator_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :label, Integer
    field :secondary_notable_type, String
    field :secondary_notable_id, Types::UuidType
  end
end
