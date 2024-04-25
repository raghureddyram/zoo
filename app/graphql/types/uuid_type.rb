module Types
    class UuidType < GraphQL::Schema::Scalar
        description "A UUID represented as a string"

        def self.coerce_input(value, _context)
        # Ensure the input is a valid UUID
        return value if value =~ /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i

        raise GraphQL::CoercionError, "Invalid UUID format"
        end

        def self.coerce_result(value, _context)
            value.to_s
        end
    end
end