class NodesController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    new_node_params = params[:node]
    new_node = Node.create(sentence: new_node_params[:sentence], signature: new_node_params[:signature], gif_url:   new_node_params[:gif_url])
    @story.nodes.push(new_node)
  end

  def update
    @story = Story.first
    selected_node = Node.find(params[:id])
    @story.nodes.push(selected_node)
    # @next_nodes = Node.last(2)
    @previous_nodes = @story.nodes
  end
end
