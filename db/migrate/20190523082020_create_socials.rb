class CreateSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :socials do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
