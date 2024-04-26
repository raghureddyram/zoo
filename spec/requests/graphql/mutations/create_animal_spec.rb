require 'rails_helper'
RSpec.describe "Graphql, animals query" do
    before do
        z = ZoologicalPark.create(name: "SF Zoo")
        monkey_pen = Habitat.create(name: "Monkey Island", zoological_park: z)
    end

    describe "createAnimal" do
        it "should create an animal by finding by the habitat name" do
            query = <<~QUERY
            mutation {
              createAnimal(input: {
                species: "Gorilla",
                primaryHabitatName: "Oakland Gorilla room",
              }){
                success
                errors
                animal {
                  species
                }
              }
            }
            QUERY

            post "/graphql", params: { query: query }
            expect(response.parsed_body["errors"]).to be_blank
            expect(response.parsed_body["data"]).to eq("createAnimal" => {"animal"=>{"species"=>"Gorilla"}, "errors"=>[], "success"=>true})
        end
    end
       
end