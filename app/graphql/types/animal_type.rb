# frozen_string_literal: true

module Types
  class AnimalType < Types::BaseObject
    field :id, ID, null: false
    field :species, String
    field :primary_habitat_id, Types::UuidType
    field :current_habitat_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :status, Integer, null: false
    field :dietary_requirements, [Types::NoteType]
    field :habitat_preferences, [Types::NoteType]

    def dietary_requirements
      object.dietary_requirements
    end


    def habitat_preferences
      object.habitat_preferences
    end
  end

end
