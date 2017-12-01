module ActorMutations

    Create = GraphQL::Relay::Mutation.define do
        name "createActor"
        description "Cadastra um ator"

        # arguments passed as "args"
        input_field :name, !types.String
        input_field :bio, !types.String

        resolve -> (inputs, ctx) {

        }
    end

end
