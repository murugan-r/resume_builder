class CreatePurposeStatements < ActiveRecord::Migration
  def change
    create_table :purpose_statements do |t|
      t.integer :user_id

      t.timestamps

    end
  end
end
