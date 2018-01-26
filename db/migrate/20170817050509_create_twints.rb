class CreateTwints < ActiveRecord::Migration
  def change
    create_table :twints do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
