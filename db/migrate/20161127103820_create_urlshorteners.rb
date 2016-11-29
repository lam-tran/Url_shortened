class CreateUrlshorteners < ActiveRecord::Migration[5.0]
  def change
    create_table :urlshorteners do |t|
      t.string :url
      t.string :shortened
      t.integer :clicks, :default => 0
      t.datetime :expiration

      t.timestamps
    end
  end
end
