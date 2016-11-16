class CreateSrPurposeStatements < ActiveRecord::Migration
  def change
    create_table :sr_purpose_statements do |t|
      t.integer :purpose_statements_id
      t.integer :resume_id

      t.timestamps

    end
  end
end
