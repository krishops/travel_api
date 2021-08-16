class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :content, :string
      t.column :author, :string
      t.column :country, :string
      t.column :city, :string
    end
  end
end
