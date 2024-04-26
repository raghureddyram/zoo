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
            expect(response.parsed_body).not_to have_validation_errors
            expect(response.parsed_body["data"]).to eq("createAnimal" => {"animal"=>{"species"=>"Gorilla"}, "errors"=>[], "success"=>true})
        end

        it "should not fail to create the animal if habitat name does not exist in the system" do
            query = <<~QUERY
            mutation {
              createAnimal(input: {
                species: "Gorilla",
                primaryHabitatName: "The Moon",
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
            expect(response.parsed_body).not_to have_validation_errors
            expect(response.parsed_body["data"]).to eq("createAnimal" => {"animal"=>{"species"=>"Gorilla"}, "errors"=>[], "success"=>true})
        end

    context "When required fields missing" do
            it "should not create if species missing" do
                query = <<~QUERY
                mutation {
                createAnimal(input: {
                    primaryHabitatName: "The Moon",
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
                expect(response.parsed_body).to have_validation_errors
                expect(response.parsed_body["errors"][0]["message"]).to eq( "Argument 'species' on InputObject 'CreateAnimalInput' is required. Expected type String!")
            end

            it "should not create if primaryHabitatName missing" do 
                query = <<~QUERY
                mutation {
                    createAnimal(input: {
                    species: "Gorilla",
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
                expect(response.parsed_body).to have_validation_errors
                expect(response.parsed_body["errors"][0]["message"]).to eq("Argument 'primaryHabitatName' on InputObject 'CreateAnimalInput' is required. Expected type String!")
            end
        end
    end
       
end