class NodesController < ApplicationController
  def index
    @first_nodes = Node.first(2)
    render :index
  end

  def show
    @first_nodes = Node.first(2)
  end

  def new

  end

  def create

  end
end
