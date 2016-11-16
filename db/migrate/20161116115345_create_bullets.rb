class CreateBullets < ActiveRecord::Migration
  def change
    create_table :bullets do |t|
      t.integer :organization_id

      t.timestamps

    end
  end
end
