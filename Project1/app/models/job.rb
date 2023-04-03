class Job < ApplicationRecord
  belongs_to :personnel, foreign_key: :title
end
