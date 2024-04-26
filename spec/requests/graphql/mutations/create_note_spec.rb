require 'rails_helper'
RSpec.describe "Graphql, animals query" do

    describe "createNote" do
        let(:zoo) {ZoologicalPark.create(name: "SF Zoo")}
        let(:monkey_pen) {Habitat.create(name: "Monkey Island", zoological_park: zoo) }
        let(:employee) {Employee.create(first_name: "R", last_name: "Reddy", phone: "325232434", email: "h@go.com", zoological_park: zoo)}
        
        context "when required fields present" do
            it "should create a note if creator and notable found" do
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
                expect(response.parsed_body).not_to have_validation_errors
                expect(response.parsed_body["data"]).to eq("createNote" => {"errors"=>[], "note"=>{"data"=>{"Hi"=>"There"}}, "success"=>true})
            end

            it "should not create a note if creator not found" do
                query = <<~GRAPHQL
                    mutation {
                        createNote(input: {
                        creatorId: "#{ "4533366" }",
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
                expect(response.parsed_body).not_to have_validation_errors
                expect(response.parsed_body["data"]).to eq("createNote" => {"errors"=>["Creator must exist"], "note"=>nil, "success"=>false},)
            end

            it "should not create a note if notable not found" do
                query = <<~GRAPHQL
                    mutation {
                        createNote(input: {
                        creatorId: "#{  employee.id  }",
                        notableClass: "#{monkey_pen.class.to_s}",
                        notableId: "#{ "23525" }",
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
                expect(response.parsed_body).not_to have_validation_errors
                expect(response.parsed_body["data"]).to eq("createNote" => {"errors"=>["Notable must exist"], "note"=>nil, "success"=>false},)
            end
        end

        context "when required fields missing" do
            it "should not create a note and should return errors" do
                query = <<~GRAPHQL
                    mutation {
                        createNote(input: {
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
                expect(response.parsed_body).to have_validation_errors
                expect(response.parsed_body["errors"][0]["message"]).to eq("Argument 'creatorId' on InputObject 'CreateNoteInput' is required. Expected type String!")
            end
        end
    end
       
end