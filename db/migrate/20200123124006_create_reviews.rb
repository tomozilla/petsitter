class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.string :comment
      t.references :owner, foreign_key: true
      t.references :sitter, foreign_key: true

      t.timestamps
    end
  end
end
