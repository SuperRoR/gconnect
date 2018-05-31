## Fields
##############
# id integer NOT NULL DEFAULT nextval('departments_id_seq'::regclass),
# name character varying,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL
# hotel_id integer
##############

class Department < ApplicationRecord
  belongs_to :hotel
  has_many :products, dependent: :destroy
end
