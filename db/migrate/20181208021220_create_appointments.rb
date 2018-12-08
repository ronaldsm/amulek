class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.text :family
      t.text :contact_info
      t.text :other_info
      t.references :companionship, foreign_key: true

      t.timestamps
    end
  end
end
