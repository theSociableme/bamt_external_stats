class GpuStatsController < ApplicationController
  def index
    @gpu_stats = GpuStat.order('created_at DESC').limit(30)
    @gpu_stats_by_display = @gpu_stats.group_by(&:display)
  end
end
