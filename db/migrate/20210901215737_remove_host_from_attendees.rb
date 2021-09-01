class RemoveHostFromAttendees < ActiveRecord::Migration[5.2]
  def change
    remove_column :attendees, :host
  end
end
