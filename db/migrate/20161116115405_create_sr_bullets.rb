class CreateSrBullets < ActiveRecord::Migration
  def change
    create_table :sr_bullets do |t|
      t.integer :bullets_id
      t.integer :resume_id

      t.timestamps

    end
  end
end
