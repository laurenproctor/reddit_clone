class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :story
      t.references :category

      t.timestamps
    end
    add_index :tags, :story_id
    add_index :tags, :category_id
  end
end
