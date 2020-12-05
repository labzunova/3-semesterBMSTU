class CreateOutputs < ActiveRecord::Migration[6.0]
  def change
    create_table :outputs do |t|
      t.string :input
      t.text :result
      t.string :max
      t.timestamps
    end
    add_index :outputs, :input, unique: true
  end
end
