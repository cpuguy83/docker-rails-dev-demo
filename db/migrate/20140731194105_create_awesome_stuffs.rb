class CreateAwesomeStuffs < ActiveRecord::Migration
  def change
    create_table :awesome_stuffs do |t|
      t.string :name

      t.timestamps
    end
    add_index :awesome_stuffs, :name
  end
end
