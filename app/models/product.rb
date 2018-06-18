## Fields
##############
# id integer NOT NULL DEFAULT nextval('products_id_seq'::regclass),
# name character varying NOT NULL,
# category_id integer,
# price integer NOT NULL,
# amount integer NOT NULL DEFAULT 0,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL,
# icon character varying,
# department_id integer
##############

class Product < ApplicationRecord
  mount_uploader :icon, IconUploader
  belongs_to :department
  delegate :hotel, :to => :department, :allow_nil => true
end
