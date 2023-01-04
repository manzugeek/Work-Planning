class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :start_at
      t.integer :end_at
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
