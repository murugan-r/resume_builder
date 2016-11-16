class CreateSrSkills < ActiveRecord::Migration
  def change
    create_table :sr_skills do |t|
      t.integer :resume_id
      t.integer :skills_id

      t.timestamps

    end
  end
end
