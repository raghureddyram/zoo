require 'rails_helper'
RSpec.describe "Graphql, animals query" do
    before do
        z = ZoologicalPark.create(name: "SF Zoo")
        monkey_pen = Habitat.create(name: "Monkey Island", zoological_park: z)
        savannah = Habitat.create(name: "Savannah", zoological_park: z)
        Animal.create(species: "Chimp", primary_habitat: monkey_pen, current_habitat: savannah)
        Animal.create(species: "Zebra", primary_habitat: savannah, current_habitat: savannah, status: "sick")
    end

    describe "allAnimals" do
        before do
            z = ZoologicalPark.create(name: "SF Zoo")
            h = Habitat.create(name: "Mammals area", zoological_park: z)
            Animal.create(species: "Chimp", primary_habitat: h)
        end
    

        it "retrieves a list of available animals" do
            query = <<~QUERY
            query {
            allAnimals {
                species
                }
            }
            QUERY
            post "/graphql", params: { query: query }
            expect(response.parsed_body["errors"]).to be_blank
            expect(response.parsed_body["data"]).to eq("allAnimals" => [{"species"=>"Chimp"}, {"species"=>"Zebra"}, {"species"=>"Chimp"}])
        end
    end

    describe "animalsNeedingAttention" do

        it "retrieves a list of available animals" do
            query = <<~QUERY
            query {
                animalsNeedingAttention {
                species
                }
            }
            QUERY
            post "/graphql", params: { query: query }
            expect(response.parsed_body["errors"]).to be_blank
            expect(response.parsed_body["data"]).to eq("animalsNeedingAttention" => [{"species"=>"Zebra"}])
        end
    end


    describe "animalsNeedingAttention" do

        it "retrieves a list of available animals" do
            query = <<~QUERY
            query {
                animalsNeedingAttention {
                species
                }
            }
            QUERY
            post "/graphql", params: { query: query }
            expect(response.parsed_body["errors"]).to be_blank
            expect(response.parsed_body["data"]).to eq("animalsNeedingAttention" => [{"species"=>"Zebra"}])
        end
    end

    describe "animalsInHabitat" do

        it "retrieves a list of available animals that are in their habitat" do
            query = <<~QUERY
            query {
                animalsInHabitat {
                species
                }
            }
            QUERY
            post "/graphql", params: { query: query }
            expect(response.parsed_body["errors"]).to be_blank
            expect(response.parsed_body["data"]).to eq("animalsInHabitat" => [{"species"=>"Zebra"}])
        end
    end
end