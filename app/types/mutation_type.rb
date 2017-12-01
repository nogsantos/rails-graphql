MutationType = GraphQL::ObjectType.define do
    name 'Mutation'
    description 'Métodos para criação, edição e exclusão dos dados'

    # About
    field :about, types.String do
        description "Sobre"
        resolve ->(obj, args, ctx) {
            "Hello World!"
        }
    end

    # Movie
    field :CreateMovie, field: MovieMutations::Create.field
    # field :Editmovie, field: MovieMutations::Edit.field
    # field :DestroyMovie, field: MovieMutations::Destroy.field

    # Actor
    field :createActor, field: ActorMutations::Create.field

end
