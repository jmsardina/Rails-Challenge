class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name,     default: '', null: false
      t.string :last_name,      default: '', null: false
      t.string :email_address,  default: '', null: false

      t.timestamps null: false
    end
  end
end
