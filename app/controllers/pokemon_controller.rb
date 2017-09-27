class PokemonController < ApplicationController

  def show
    pokemon_res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(pokemon_res.body)
    name  = body["name"]
    id  = body["id"]
    types = []
    check_types  = body["types"].each do |type|
      types << type["type"]["name"]
    end

    gilphy_res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=pikachu&rating=g")
    body = JSON.parse(gilphy_res.body)
    gif_url = body["data"][0]["url"]

    render json: {
      "id": id,
      "name": name,
      "types": types,
      "gif": gif_url 
    }



  end


end
