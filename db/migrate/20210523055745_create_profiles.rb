class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :about_me
      t.text :motivations
      t.text :interests
      t.text :background

      t.timestamps
    end
  end
end
