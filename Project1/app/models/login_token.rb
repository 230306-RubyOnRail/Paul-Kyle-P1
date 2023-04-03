class LoginToken < ApplicationRecord
  belongs_to :personnel, foreign_key: :personnel_username
end
