class AddDatesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :starts_at, :datetime
    add_column :jobs, :ends_at, :datetime
  end
end
