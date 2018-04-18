class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @new_node = Node.new
    @story = Story.find(params[:id])
    @previous_nodes = @story.nodes
    @next_nodes = Node.last(2)
  end

  def new

  end

  def create

  end

end
