## Fields
##############
# id integer NOT NULL DEFAULT nextval('rooms_id_seq'::regclass),
# hotel_id integer,
# room_number character varying,
# sub_number integer DEFAULT 1,
# status character varying DEFAULT 'checkout'::character varying,
# "from" timestamp without time zone,
# "to" timestamp without time zone,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL
##############

class Room < ApplicationRecord
  belongs_to :hotel
  has_many :orders, dependent: :destroy

  def current_orders
    orders.where("created_at >= ?", from)
  end

  def check_in
    self.from = Time.now
    self.save
  end

  def generate_qr_code_url
    "/api/signin?code=#{code}&hotel_name=#{self.hotel.friendly_id}"
  end
end
