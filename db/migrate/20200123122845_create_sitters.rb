class CreateSitters < ActiveRecord::Migration[5.2]
  def change
    create_table :sitters do |t|
      t.string :name
      t.string :location
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
