# frozen_string_literal: true

module Bumblebees
  class StingJob
    def initialize(bee_sting, bee)
      @bee_sting = bee_sting
      @bee       = bee
    end

    def perform
      @is_stinged = @bee_sting.sting?(@bee)
    end

    def max_attempts
      2
    end

    def success(job)
      Rails.logger.info('*' * 10)
      Rails.logger.info("#{job}: #{@is_stinged ? 'STINGED' : 'NOT STINGED'}")
      Rails.logger.info('*' * 10)
    end
  end
end
