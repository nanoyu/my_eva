class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
  end
end
