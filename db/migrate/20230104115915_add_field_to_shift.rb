class AddFieldToShift < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :slot, :text
  end
end
