# frozen_string_literal: true

class BumblebeesController < ActionController::Base
  skip_forgery_protection only: :random_stinging

  def index
    @bumblebees = Bumblebee.all

    render json: @bumblebees
  end

  def scheduled_stingings
    @scheduled_stingings_jobs = Delayed::Job.where(
      'handler LIKE ?', '%Bumblebees::StingJob%'
    )

    render json: @scheduled_stingings_jobs
  end

  def random_stinging
    bee_sting = grab_bee_by_random_sting_danger
    bee = grab_bee_by_random_sting_danger

    Delayed::Job.enqueue(Bumblebees::StingJob.new(bee_sting, bee))

    head :ok
  end

  private

  def grab_bee_by_random_sting_danger
    Bumblebee.find_by(sting_danger: %i[low moderate high].sample)
  end
end
