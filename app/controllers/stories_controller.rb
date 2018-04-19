class StoriesController < ApplicationController
  def index
    @stories = Story.all

  end

  def show
    @story = Story.find(params[:id])
    last_node = @story.nodes.last
    unless last_node.next_nodes_ids.nil?
      next_ids = last_node.next_nodes_ids.split(',')
      @next_nodes = [(Node.find(next_ids[0])), (Node.find(next_ids[1]))]
    end
  end

  def new

  end

  def create

  end

  def update

  end
end
