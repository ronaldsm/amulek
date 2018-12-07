class CreateCompanionships < ActiveRecord::Migration[5.2]
  def change
    create_table :companionships do |t|
      t.string :label

      t.timestamps
    end
  end
end
