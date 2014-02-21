class Api::V1::GpuStatsController < Api::V1::BaseController
  inherit_resources
  skip_before_filter :verify_authenticity_token


end