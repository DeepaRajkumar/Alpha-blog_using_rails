class CreateAddToAdminToCustomer < ActiveRecord::Migration[7.0]
  def change
    create_table :add_to_admin_to_customers do |t|
      add_column :customers, :admin,:boolean,default:false

      t.timestamps
    end
  end
end
