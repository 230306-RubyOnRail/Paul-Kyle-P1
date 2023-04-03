class Personnel < ApplicationRecord
  has_many :reimbursement_requests, dependent: :destroy
  has_one :job
  has_one :login_token, dependent: :destroy

  def authenticate(password)
    if pass == password
      true
    else
      false
    end
  end
end
