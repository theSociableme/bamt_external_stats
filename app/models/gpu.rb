class Gpu < ActiveRecord::Base
  attr_accessible :name

  has_many :gpu_stats


end
