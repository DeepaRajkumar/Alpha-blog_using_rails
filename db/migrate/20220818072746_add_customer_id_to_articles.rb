class AddCustomerIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :customer_id, :int
  end
end
