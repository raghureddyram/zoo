operation = <<~QUERY
query ($inHabitat: Boolean) {
  animals(inHabitat: $inHabitat) { 
    id 
  }
}
QUERY

result = ZooSchema.execute(operation, variables: { inHabitat: true })
puts JSON.pretty_generate(result)

# result = ZooSchema.execute(operation)
# puts JSON.pretty_generate(result)

