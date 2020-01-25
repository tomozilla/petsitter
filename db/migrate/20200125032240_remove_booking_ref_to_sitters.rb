class RemoveBookingRefToSitters < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sitters, :booking
  end
end
