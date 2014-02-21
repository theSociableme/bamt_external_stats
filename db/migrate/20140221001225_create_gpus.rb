class CreateGpus < ActiveRecord::Migration
  def change
    create_table :gpus do |t|
      t.string :name

      t.timestamps
    end
  end
end
