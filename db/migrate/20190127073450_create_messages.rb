class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
