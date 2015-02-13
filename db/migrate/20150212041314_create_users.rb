class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :remember_digest
      t.boolean :member

      t.timestamps null: false
    end
  end
end
