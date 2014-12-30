class CreateMyObjects < ActiveRecord::Migration
  def change
    create_table :my_objects do |t|
      t.text :data
      t.text :unserialized_data
      t.timestamps null: false
    end
  end
end
