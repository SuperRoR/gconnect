class Order < ApplicationRecord
  has_many :order_details
  belongs_to :wevo_user
  belongs_to :assignee, class_name: "WevoUser", foreign_key: "assignee_id", required: false

  default_scope { order(created_at: :desc) }
end
