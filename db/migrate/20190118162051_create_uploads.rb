class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :image

      t.timestamps
    end
  end
end
