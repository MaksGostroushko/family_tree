class DropUserTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :users, force: :cascade
  end
end
