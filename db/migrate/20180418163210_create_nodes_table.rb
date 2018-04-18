class CreateNodesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.column :sentence, :varchar, :limit => 200
      t.column :signature, :varchar
      t.column :gif_url, :varchar
      t.column :next_nodes_ids, :varchar
    end
  end
end
