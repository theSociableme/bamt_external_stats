class GpuStatsController < ApplicationController
  def index
    @gpu_stats = GpuStat.where("created_at > ?", DateTime.now - 2.hours )
    @gpu_stats_by_display = @gpu_stats.group_by(&:display)
  end
end
