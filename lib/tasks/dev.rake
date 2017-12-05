namespace :dev do

    desc "Setup Development"
    task setup: :environment do
        puts "Executando o setup para ambiente de  #{Rails.env}"
        puts "Configurando o DataBase... #{%x(rails db:drop db:create db:migrate)}"
        puts %x(rails dev:generate_actors)
        puts %x(rails dev:generate_movies)
        puts %x(rails dev:register_actors_for_movies)
        puts "Setup completado"
    end

    desc "Cria os atores"
    task generate_actors: :environment do
        puts "Cadastrando Atores..."
        10.times do
            Actor::create!(
                name: FFaker::NameBR.name,
                bio: FFaker::BaconIpsum.paragraph
            )
        end
        puts "Atores cadastrados!"
    end

    desc "Cria os filmes"
    task generate_movies: :environment do
        puts "Cadastrando Filmes..."
        10.times do
            Movie::create!(
                title: FFaker::Movie.title,
                summary: FFaker::BaconIpsum.paragraph,
                year: FFaker::Vehicle.year
            )
        end
        puts "Filmes cadastrados!"
    end

    desc "Registra atores aos filmes"
    task register_actors_for_movies: :environment do
        Movie.all.each do |movie|
            movie.actors << Actor.offset(rand(Actor.count))
        end
        # Movie.all.zip(Actor.all).each do |movie, actor|
        #     5.times do
        #         movie.actors << actor.id
        #     end
        # end
        puts "Registrados!"
    end
end
