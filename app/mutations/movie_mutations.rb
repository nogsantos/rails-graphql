module MovieMutations

    Create = GraphQL::Relay::Mutation.define do
        name "CreateMovie"
        description "Create a Movie"

        # Define input parameters
        input_field :id, !types.ID
        input_field :body, !types.String

        # Define return parameters
        # return_field :movieEdge, MovieType.edge_type
        # return_field :post, PostType

        # Resolve block to create comment and return hash of post and comment
        resolve -> (inputs, ctx) {
            post = NodeIdentification.object_from_id_proc.call(inputs[:id], ctx)
            user = ctx[:current_user]
                movie = post.comments.create({
                body: inputs[:body],
                user: user
            })

            connection = GraphQL::Relay::RelationConnection.new(post, {})
            edge = GraphQL::Relay::Edge.new(comment, connection)

            {
                post: post,
                commentEdge: edge
            }
        }
    end

    Destroy = GraphQL::Relay::Mutation.define do
        name "DestroyMovie"
        description "Delete a movie"

        # Define input parameters
        input_field :id, !types.ID
        input_field :post_id, !types.ID

        # Define return parameters
        return_field :deletedId, !types.ID
        return_field :post, PostType

        resolve -> (inputs, ctx) {
            post = NodeIdentification.object_from_id_proc.call(inputs[:post_id], ctx)
            movie = NodeIdentification.object_from_id_proc.call(inputs[:id], ctx)
            movie.destroy
            {
                post: post,
                deletedId: inputs[:id]
            }
        }
    end

    Edit = GraphQL::Relay::Mutation.define do
        name "EditMovie"
        description "Edit a movie"

        # Define input parameters
        input_field :id, !types.ID
        input_field :body, !types.String

        # Define return parameters
        return_field :movie, MovieType

        resolve -> (inputs, ctx) {
            movie = NodeIdentification.object_from_id_proc.call(inputs[:id], ctx)
            valid_inputs = inputs.instance_variable_get(:@values).select { |k, _| item.respond_to? "#{k}=" }.except('id')
            movie.update(valid_inputs)
            {
                movie: movie
            }
        }
    end

  end
