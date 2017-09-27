class PokemonController < ApplicationController

  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    name  = body["name"]
    id  = body["id"]
    types = []
    check_types  = body["types"].each do |type|
      types << type["type"]["name"]
    end

    render json: {
      "id": id,
      "name": name,
      "types": types
    }

  end


end
