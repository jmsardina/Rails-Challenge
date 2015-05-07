class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name,       default: nil, null: false
      t.string :short_name, default: nil, null: false
      t.timestamps null: false
    end
  end
end
