class Visitor < ApplicationRecord
  enum visist_status: [:abnormal, :normal]
  default_scope { order('visit_time desc') }
end
