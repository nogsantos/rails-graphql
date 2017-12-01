QueryType = GraphQL::ObjectType.define do
    name "Query"
    description "The query root for this schema"

    field :movie do
        type MovieType
        description "Query a movie by id"
        argument :id, !types.ID
        resolve -> (obj, args, ctx) {
            Movie.find(args[:id])
        }
    end

    field :movies do
        type types[MovieType]
        description "Query movies by year"
        argument :year, types.Int
        resolve -> (obj, args, ctx) {
            if args[:year].present?
                Movie.where(year: args[:year])
            else
                Movie.all
            end
        }
    end

    field :actor do
        type ActorType
        description "Query an actor by id"
        argument :id, !types.ID
        resolve -> (obj, args, ctx) {
            Actor.find(args[:id])
        }
    end
end
