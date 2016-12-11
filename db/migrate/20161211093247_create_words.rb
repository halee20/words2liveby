class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :word
      t.string :author
      t.integer :user_id

      t.timestamps

    end
  end
end
