class NodesController < ApplicationController
  def index
    @next_nodes = Node.last(2)
    render :index
  end

  def show
    @story = Story.first
    @previous_nodes = @story.nodes
    @next_nodes = Node.last(2)
  end

  def new

  end

  def create
    @story = Story.first
    new_node_params = params[:node]
    new_node = Node.create(sentence: new_node_params[:sentence], signature: new_node_params[:signature])
    @story.nodes.push(new_node)
    @previous_nodes = @story.nodes
    render :show
  end

  def update
    @story = Story.first
    selected_node = Node.find(params[:id])
    @story.nodes.push(selected_node)
    @next_nodes = Node.last(2)
    @previous_nodes = @story.nodes
    render :show
  end
end
