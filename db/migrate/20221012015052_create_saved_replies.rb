class CreateSavedReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_replies do |t|
      t.string :title

      t.timestamps
    end
  end
end
