require 'pry'

class Api::V1::ReactionsController < ApplicationController

  def index

  end

  def create
    if Reaction.create(name: params["name"])
      render status: 201, json:{"status": "Created #{params["name"]}"}
    else
      render status: 400
    end
  end

  def update

  end
end
