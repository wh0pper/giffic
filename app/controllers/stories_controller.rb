class StoriesController < ApplicationController
  def index
    @stories = Story.all

  end

  def show
    @story = Story.find(params[:id])
    last_node = @story.nodes.last
    unless last_node.nil?
      unless last_node.next_nodes_ids.nil?
        next_ids = last_node.next_nodes_ids.split(',')
        @next_nodes = [(Node.find(next_ids[0])), (Node.find(next_ids[1]))]
      end
    end
  end

  def new

  end

  def create
    story_params = params[:story]
    new_story = Story.create(:title => story_params[:title])
    new_story.nodes.push(Node.first)
    new_story.save
    redirect_to action: "show", id: new_story.id
  end

  def update
    @story = Story.find(params[:id])
    next_nodes_ids = params.dig(:node, :next_nodes_ids)
    selected_sentence = params[:commit]
    selected_node = Node.where(:sentence => selected_sentence)
    @story.nodes.push(selected_node)
    @next_nodes = []
    next_nodes_ids.split(',').each do |id|
      @next_nodes << Node.find(id)
    end
    @previous_nodes = @story.nodes
    redirect_to action: "show", id: @story.id
  end
end
