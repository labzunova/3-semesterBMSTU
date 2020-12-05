# frozen_string_literal: true

# Model result
class Output < ApplicationRecord
  validates :input, presence: true, numericality: { greater_than_or_equal_to: 0 }, uniqueness: true
  validates :result, presence: true
end
