class ReimbursementRequest < ApplicationRecord
  enum status: { pending: 0, approved: 1, rejected: 2 }
  belongs_to :personnel, foreign_key: :personnel_id
end
