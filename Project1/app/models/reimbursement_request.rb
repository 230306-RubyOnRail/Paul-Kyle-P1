class ReimbursementRequest < ApplicationRecord
  belongs_to :personnel, foreign_key: :personnel_id
end
