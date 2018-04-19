class NodesController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    new_node_params = params[:node]
    new_node = Node.create(sentence: new_node_params[:sentence], signature: new_node_params[:signature], gif_url:   new_node_params[:gif_url])
    @story.nodes.push(new_node)

    redirect_to :controller => 'stories', :action => 'show', :id => @story.id
  end

  def update
    # right now we never get here, moving to stories controller
    @story = Story.find(params[:story_id])
    selected_node = Node.find(params[:id])
    @story.nodes.push(selected_node)
    # @next_nodes = Node.last(2)
    # @previous_nodes = @story.nodes
    redirect_to :controller => 'stories', :action => 'show', :id => @story.id
  end
end
