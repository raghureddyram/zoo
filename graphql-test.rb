# operation = <<~QUERY
# query ($inHabitat: Boolean) {
#   animals(inHabitat: $inHabitat) { 
#     id 
#   }
# }
# QUERY

# result = ZooSchema.execute(operation, variables: { inHabitat: true })
# puts JSON.pretty_generate(result)


# op_two = <<~QUERY
# query {
#   allAnimals {
#     id
#     dietaryRequirements {
#       data
#       label
      
#       notable {
#         ... on Animal {
#           id
          
#         }
#       }
#     }
#   }
# }
# QUERY

# data =  {"hi"=> 'there'}.as_json
# op_two = <<~QUERY
# mutation {
#   createNote(notableId: "a64e7807-b55a-4b3c-8943-cec3c5fdd540", notableClass: "Habitat", creatorId: "4ccf92ac-ba7b-4196-a88f-e6f00e9c6507"){
#     success
#     errors
#     note {
#       id
#     }
#   }
# }
# QUERY

op_two = <<~QUERY
mutation {
  createNote(input: {
    creatorId: "4ccf92ac-ba7b-4196-a88f-e6f00e9c6507",
    notableClass: "Habitat",
    notableId: "a64e7807-b55a-4b3c-8943-cec3c5fdd540",
    data: "{'Hi':'There'}",
  }){
    success
    errors
    note {
      id
    }
  }
}
QUERY


result = ZooSchema.execute(op_two)
puts JSON.pretty_generate(result)
