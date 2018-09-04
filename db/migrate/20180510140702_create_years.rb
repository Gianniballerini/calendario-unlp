class CreateYears < ActiveRecord::Migration[5.1]
  def change
    create_table :years do |t|
      t.string :name
      t.references :career, foreign_key: true

      t.timestamps
    end
  end
end
