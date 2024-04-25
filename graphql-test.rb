# operation = <<~QUERY
# query ($inHabitat: Boolean) {
#   animals(inHabitat: $inHabitat) { 
#     id 
#   }
# }
# QUERY

# result = ZooSchema.execute(operation, variables: { inHabitat: true })
# puts JSON.pretty_generate(result)


op_two = <<~QUERY
query {
  allAnimals {
    id
    dietaryRequirements {
      data
      label
      
      notable {
        ... on Animal {
          id
          
        }
      }
    }
  }
}
QUERY


result = ZooSchema.execute(op_two)
puts JSON.pretty_generate(result)
