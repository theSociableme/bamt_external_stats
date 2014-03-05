class GpuStatsController < ApplicationController
  def index
    @gpu_stats = GpuStat.last(60)
    @gpu_stats_by_display = @gpu_stats.group_by(&:display)
  end
end
