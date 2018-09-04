class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.time :start_time
      t.time :end_time
      t.boolean :recurrent
      t.date :start_date
      t.date :end_date
      t.string :description
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
