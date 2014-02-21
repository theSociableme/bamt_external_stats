class CreateGpuStats < ActiveRecord::Migration
  def change
    create_table :gpu_stats do |t|
      t.integer :gpu_id
      t.integer :current_core_voltage
      t.integer :current_load
      t.integer :current_mem_clock
      t.integer :current_performance_level
      t.integer :current_powertune
      t.integer :current_temp_0
      t.integer :current_core_clock
      t.string  :desc
      t.decimal :display, scale: 2, precision: 5
      t.integer :fan_rpm
      t.integer :fan_speed
      t.integer :hardware_errors
      t.integer :hashrate
      t.integer :last_share_time
      t.string  :miner
      t.string  :pool_url
      t.integer :shares_accepted
      t.integer :shares_invalid
      t.string :status
      t.string :uptime

      t.timestamps
    end
  end
end
