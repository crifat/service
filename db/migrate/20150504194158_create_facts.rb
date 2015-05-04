class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
