class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :password_digest
      t.string :sex
      t.string :pref

      t.timestamps
    end
  end
end
