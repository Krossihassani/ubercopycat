class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :rating
      t.references :booking, null: false, foreign_key: true
      t.string :is_driver

      t.timestamps
    end
  end
end
