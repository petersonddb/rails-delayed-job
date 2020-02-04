# frozen_string_literal: true

class Bumblebee < ApplicationRecord
  validates :sting_danger, presence: true

  enum sting_danger: {
    low: 'low',
    moderate: 'moderate',
    high: 'high'
  }

  def sting?(bumblebee)
    is_stinged = if high?
                   bumblebee.low? || bumblebee.moderate?
                 elsif moderate?
                   bumblebee.low?
                 else
                   false
                 end

    is_stinged
  end
end
