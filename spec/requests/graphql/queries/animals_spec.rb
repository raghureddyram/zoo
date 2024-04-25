require 'rails_helper'
RSpec.describe "Graphql, animals query" do
    before do
        z = ZoologicalPark.create(name: "SF Zoo")
        h = Habitat.create(name: "Mammals area", zoological_park: z)
        Animal.create(species: "Chimp", primary_habitat: h)
        Animal.create(species: "Zebra", primary_habitat: h, status: "sick")
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
end