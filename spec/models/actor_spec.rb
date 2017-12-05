require 'rails_helper'

RSpec.describe Actor, type: :model do

    context "Strings..." do
        let(:actor){ Actor.new }
        describe ".somar_numeros" do
            it {
                v = 2
                vl = 2

                expect(v + vl).to eq(4)
            }
        end

        describe ".subtrair_numeros" do
            it {
                v = 2
                vl = 2

                expect(v - vl).to eq(0)
            }
        end

        describe ".response" do
            it {
                actor.name = "Name test"
                actor.bio = "Bio test..."
                expect(actor.response).to eq("Actor: Name test Bio test...")
            }
        end

    end

    # context "with unauthorized access" do
    #     let(:uri) { 'http://api.lelylan.com/types' }
    #     before    { stub_request(:get, uri).to_return(status: 401, body: '401.json') }
    #     it "gets a not authorized notification" do

    #     end
    #   end

end

