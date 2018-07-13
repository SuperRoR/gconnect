## Fields
##############
# id integer NOT NULL DEFAULT nextval('order_details_id_seq'::regclass),
# order_id integer NOT NULL,
# product_id integer NOT NULL,
# amount integer NOT NULL DEFAULT 0,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL
##############

class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :product
  delegate :room, :to => :order, :allow_nil => true
  delegate :hotel, :to => :room, :allow_nil => true
end
