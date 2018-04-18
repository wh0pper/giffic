class NodesController < ApplicationController
  def index
    @next_nodes = Node.last(2)
    render :index
  end

  def show
    @next_nodes = Node.last(2)
  end

  def new

  end

  def create

  end

  def update
    @selected_node = Node.find(params[:id])
    @next_nodes = Node.last(2)
    render :show
  end
end
