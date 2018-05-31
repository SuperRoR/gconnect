## Fields
##############
# id integer NOT NULL DEFAULT nextval('admin_users_id_seq'::regclass),
# email character varying NOT NULL DEFAULT ''::character varying,
# encrypted_password character varying NOT NULL DEFAULT ''::character varying,
# reset_password_token character varying,
# reset_password_sent_at timestamp without time zone,
# remember_created_at timestamp without time zone,
# sign_in_count integer NOT NULL DEFAULT 0,
# current_sign_in_at timestamp without time zone,
# last_sign_in_at timestamp without time zone,
# current_sign_in_ip character varying,
# last_sign_in_ip character varying,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL,
# hotel_id integer,
# is_super_admin boolean DEFAULT false,
##############

class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :hotel, optional: true
  validates :hotel, presence: true, unless: :is_super_admin

  def hotels
    Hotel.where(id: self.hotel.id).friendly
  end
end
