class CreateAes < ActiveRecord::Migration[5.1]
  def change
    create_table :aes do |t|
      t.integer :PATIENT_ID
      t.string :SITE_NAME
      t.string :COUNTRY_NAME
      t.integer :DELAY_DAYS

      t.timestamps
    end
  end
end
