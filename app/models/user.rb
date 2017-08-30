# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :campaigns
  has_many :campaign_logs, through: :campaigns
end
