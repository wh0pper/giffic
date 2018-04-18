class CreateStoriesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :stories_tables do |t|
      t.column :node_ids, :varchar
      t.column :title, :varchar
    end
  end
end
