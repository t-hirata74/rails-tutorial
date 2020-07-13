class CreateUsers < ActiveRecord::Migration[6.0] # [6.0]は、どの時点のrailsバージョンでmigrateしたのかを明示している
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
