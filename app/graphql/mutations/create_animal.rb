# API: Create a GraphQL API endpoint for `createNote` to create a new note tied to an `Employee`, and the same note can also be tied to an `Animal` and/or `Habitat`.
# 
module Mutations
    class CreateAnimal < BaseMutation
      # arguments passed to the `resolve` method
      argument :primary_habitat_name, String, required: true
      argument :species, String, required: true
      

      field :success, Boolean, null: false
      field :errors, [String], null: false
      field :animal, Types::AnimalType, null: true
  
  
      def resolve(primary_habitat_name: nil, species: nil)
        habitat = Habitat.find_by name: primary_habitat_name 
        errors = []

        if habitat.blank?
            habitat = Habitat.create(name: primary_habitat_name, zoological_park: ZoologicalPark.last)
        end

        animal = Animal.create(species: species, primary_habitat: habitat)
        
        if animal&.id.present?
            {animal: {id: animal.id, species: animal.species}, success: true, errors: errors}
        else
            {animal: nil, success: false, errors: animal.errors.full_messages}
        end
      end
    end
  end

