# API: Create a GraphQL API endpoint for `createAnimal` to create a new animal, and create a new habitat, or assign it to an existing habitat. # 
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
            begin
                habitat = Habitat.create!(name: primary_habitat_name, zoological_park: ZoologicalPark.last)
            rescue => e 
                errors << e
                return {animal: nil, success: false, errors: errors}
            end
        end

        begin 
            animal = Animal.create!(species: species, primary_habitat: habitat)
        rescue => e
            errors << e
            return {animal: nil, success: false, errors: errors}
        end

        {animal: animal.as_json, success: true, errors: errors}
      end
    end
  end

