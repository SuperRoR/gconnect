## Fields
##############
# id integer NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
# status character varying NOT NULL DEFAULT 'PENDING'::character varying,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL,
# room_id integer
##############

class Order < ApplicationRecord
  ORDERSTATUS = ["PENDING", "ACKNOWLEDGE", "SERVING", "FINISH"]
  has_many :order_details, dependent: :destroy
  belongs_to :room
  # belongs_to :assignee, class_name: "WevoUser", foreign_key: "assignee_id", required: false
  validates :status, :inclusion => { :in => ORDERSTATUS }
  default_scope { order(created_at: :desc) }
end
