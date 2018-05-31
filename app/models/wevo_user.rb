## Fields
##############
# id integer NOT NULL DEFAULT nextval('wevo_users_id_seq'::regclass),
# wevo_server_id integer,
# email character varying NOT NULL,
# user_display_name character varying,
# phone_number character varying NOT NULL,
# is_verified boolean NOT NULL DEFAULT false,
# extension character varying,
# auth_token character varying,
# wevopbx_domain character varying,
# wevopbx_local_domain character varying,
# remember_token character varying,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL,
# room_id integer
##############

class WevoUser < ApplicationRecord
  has_one :wevo_device
  belongs_to :room

  def is_admin?
    self.role.role_name == "Admin"
  end

  def self.admin_extension
    where(role: Role.find_by(role_name: "Admin")).first.extension
  end
end
