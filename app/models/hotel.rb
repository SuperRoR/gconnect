## Fields
##############
# id integer NOT NULL DEFAULT nextval('hotels_id_seq'::regclass),
# name character varying,
# description character varying,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL
##############

class Hotel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :admin_users, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :orders, through: :rooms, dependent: :destroy
  has_many :order_details, through: :orders, dependent: :destroy
  has_many :wevo_users, through: :rooms, dependent: :destroy
  has_many :wevo_devices, through: :wevo_users, dependent: :destroy
  has_many :departments, dependent: :destroy
  has_many :products, through: :departments, dependent: :destroy

end
