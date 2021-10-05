class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :contact
      t.date :dob
      t.boolean :gender

      t.timestamps
    end
  end
end
