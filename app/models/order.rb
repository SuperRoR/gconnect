## Fields
##############
# id integer NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
# status character varying NOT NULL DEFAULT 'PENDING'::character varying,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL,
# room_id integer
##############

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :room
  delegate :hotel, :to => :room, :allow_nil => true
  # belongs_to :assignee, class_name: "WevoUser", foreign_key: "assignee_id", required: false
  as_enum :status, [:pending, :acknowledge, :serving, :finish], source: :status, map: :string
  default_scope { order(created_at: :desc) }
  validates :room, presence: true
end
