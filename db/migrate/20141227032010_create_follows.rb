class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer            :user_id           # フォローしている人のID
      t.integer            :follow_user_id    # フォローされている人のID
      t.timestamps
    end
  end
end