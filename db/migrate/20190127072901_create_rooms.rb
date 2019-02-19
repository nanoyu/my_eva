class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name

      t.timestamps
    end
  end
end
