class FixNodes < ActiveRecord::Migration[5.2]
  def change
      add_column :nodes, :sentence, :varchar, :limit => 200
      add_column :nodes, :signature, :varchar
      add_column :nodes, :gif_url, :varchar
      add_column :nodes, :next_nodes_ids, :varchar
  end
end
