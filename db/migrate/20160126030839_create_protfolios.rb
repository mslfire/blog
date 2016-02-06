class CreateProtfolios < ActiveRecord::Migration
  def change
    create_table :protfolios do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
