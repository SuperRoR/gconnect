## Fields
##############
# id integer NOT NULL DEFAULT nextval('hotels_id_seq'::regclass),
# name character varying,
# description character varying,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL,
# slug character varying,
# wevo_pbx_local_domain character varying,
# wevo_pbx_remote_domain character varying,
# use_cloud boolean DEFAULT true,
##############

class Hotel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :message_icon, IconUploader

  has_many :admin_users, dependent: :destroy
  has_many :order_details, through: :orders, dependent: :destroy
  has_many :orders, through: :rooms, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :products, through: :departments, dependent: :destroy
  has_many :departments, dependent: :destroy

  def get_order_details
    OrderDetail.where(id: self.order_details.ids)
  end

  def tenant_prefix
    if self.use_cloud
      "#{format('%05d', id)}"
    else
      ""
    end

  end

  def wevo_pbx_domain
    if self.use_cloud
      self.wevo_pbx_remote_domain
    else
      self.wevo_pbx_local_domain
    end
  end

end
