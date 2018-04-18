class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories_tables, :node_ids
    rename_table :stories_tables, :stories
    create_table :nodes_stories, id: false do |t|
      t.belongs_to :node, index: true
      t.belongs_to :story, index: true
    end
  end
end
