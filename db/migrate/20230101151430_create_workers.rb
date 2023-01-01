class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :title
      t.string :dept
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
