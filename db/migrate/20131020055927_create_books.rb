class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
