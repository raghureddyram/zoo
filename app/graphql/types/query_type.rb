# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    
    field :all_animals, [Types::AnimalType] 

    def all_animals
      Animal.all
    end

    field :animals_needing_attention, [Types::AnimalType] 
    def animals_needing_attention
      Animal.needing_attention
    end

    field :animals_in_habitat, [Types::AnimalType] 
    def animals_in_habitat
      Animal.in_habitat
    end

  end
end
