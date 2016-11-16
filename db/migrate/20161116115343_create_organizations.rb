class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :user_id
      t.string :organization
      t.date :start_month
      t.string :end_month
      t.string :location

      t.timestamps

    end
  end
end
