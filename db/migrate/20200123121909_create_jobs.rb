class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.datetime :date
      t.string :location
      t.string :description
      t.integer :number_of_dogs
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
