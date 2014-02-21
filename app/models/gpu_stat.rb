class GpuStat < ActiveRecord::Base

  belongs_to :gpu


  attr_accessible :gpu_id, :current_core_voltage, :current_load, :current_mem_clock, :current_performance_level, :current_powertune,
                  :current_temp_0, :current_core_clock, :desc, :display, :fan_rpm, :fan_speed, :hardware_errors, :hashrate,
                  :last_share_time, :miner, :pool_url, :shares_accepted, :shares_invalid,:status,:uptime


end
