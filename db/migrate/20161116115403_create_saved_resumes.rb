class CreateSavedResumes < ActiveRecord::Migration
  def change
    create_table :saved_resumes do |t|
      t.integer :user_id
      t.string :resume_name

      t.timestamps

    end
  end
end
