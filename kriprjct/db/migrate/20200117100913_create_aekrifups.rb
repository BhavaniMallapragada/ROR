class CreateAekrifups < ActiveRecord::Migration[5.1]
  def change
    create_table :aekrifups do |t|
      t.integer :PATIENT_ID
      t.string :SITE_NAME
      t.string :COUNTRY_NAME
      t.string :FOLLOW_UP

      t.timestamps
    end
  end
end
