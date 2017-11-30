MutationType = GraphQL::ObjectType.define do
    name 'Mutation'

    field :Editmovie, field: MovieMutations::Edit.field
    field :DestroyMovie, field: MovieMutations::Destroy.field
    field :CreateMovie, field: MovieMutations::Create.field

end
