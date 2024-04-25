# Define the SearchableUnionType
module Types
    class NotableType < Types::BaseUnion
        description "Properties of Notable"
        possible_types Types::HabitatType, Types::AnimalType, Types::EmployeeType

        def self.resolve_type(object, context)
            if object.is_a?(Habitat)
                Types::HabitatType
            elsif object.is_a?(Animal)
                Types::AnimalType
            elsif object.is_a?(Employee)
                Types::EmployeeType
            else
                raise "Unknown type: #{object.class}"
            end
        end
    end
end