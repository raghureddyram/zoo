require 'rails_helper'
RSpec.describe "Graphql, animals query" do

    describe "createNote" do
        let(:zoo) {ZoologicalPark.create(name: "SF Zoo")}
        let(:monkey_pen) {Habitat.create(name: "Monkey Island", zoological_park: zoo) }
        let(:employee) {Employee.create(first_name: "R", last_name: "Reddy", phone: "325232434", email: "h@go.com", zoological_park: zoo)}
        
        it "should create an animal by finding by the habitat name" do
            query = <<~GRAPHQL
                mutation {
                    createNote(input: {
                    creatorId: "#{ employee.id }",
                    notableClass: "#{monkey_pen.class.to_s}",
                    notableId: "#{ monkey_pen.id }",
                    data: "{'Hi':'There'}"
                    }) {
                    success
                    errors
                    note {
                            data
                        }
                    }
                }
                GRAPHQL


            post "/graphql", params: { query: query }
            expect(response.parsed_body["errors"]).to be_blank
            expect(response.parsed_body["data"]).to eq("createNote" => {"errors"=>[], "note"=>{"data"=>{"Hi"=>"There"}}, "success"=>true})
        end
    end
       
end