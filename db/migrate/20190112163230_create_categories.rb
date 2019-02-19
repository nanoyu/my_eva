class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :category_name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
