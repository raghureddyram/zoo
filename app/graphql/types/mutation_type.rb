# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_note, mutation: Mutations::CreateNote
    field :create_animal, mutation: Mutations::CreateAnimal
  end
end
