class Api::V1::GpuStatsController < ApplicationController
  inherit_resources
  skip_before_filter :verify_authenticity_token


end