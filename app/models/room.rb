## Fields
##############
# id integer NOT NULL DEFAULT nextval('rooms_id_seq'::regclass),
# hotel_id integer,
# room_number character varying,
# sub_number integer DEFAULT 1,
# status character varying DEFAULT 'checkout'::character varying,
# "from" timestamp without time zone,
# created_at timestamp without time zone NOT NULL,
# updated_at timestamp without time zone NOT NULL,
# days integer DEFAULT 1,
# code character varying DEFAULT ''::character varying,
# ext_no character varying,
# ext_password character varying,
##############

class Room < ApplicationRecord
  SUBACCOUNT = 2
  belongs_to :hotel
  has_many :orders, dependent: :destroy
  after_create :generate_code

  as_enum :status, [:checkout , :checkin], source: :status, map: :string

  def current_orders
    orders.where("created_at >= ?", from)
  end

  def sign_in(phone_type, token1, token2)
    switch_subaccount
    if self.sub_number == 0
      self.ext_phone_type1 = phone_type
      self.ext_device_token_android1 = token1
      self.ext_device_token_ios1 = token2
      self.save
    elsif self.sub_number == 1
      self.ext_phone_type2 = phone_type
      self.ext_device_token_android2 = token1
      self.ext_device_token_ios2 = token2
      self.save
    else
      self.ext_phone_type1 = phone_type
      self.ext_device_token_android1 = token1
      self.ext_device_token_ios1 = token2
      self.save
    end

  end
  def switch_subaccount
    self.sub_number = self.sub_number + 1
    self.sub_number = 0 if self.sub_number >= SUBACCOUNT
    self.save
  end

  def ext_no
    if self.sub_number == 0
      "#{self.hotel.tenant_prefix}#{self.ext_no1}"
    elsif self.sub_number == 1
      "#{self.hotel.tenant_prefix}#{self.ext_no2}"
    else
      "#{self.hotel.tenant_prefix}#{self.ext_no1}"
    end
  end

  def ext_password
    if self.sub_number == 0
      self.ext_password1
    elsif sub_number == 1
      self.ext_password2
    else
      self.ext_password1
    end

  end
  def generate_code
    self.code = SecureRandom.uuid
    self.save
  end

  def generate_qr_code_url
    "/signin/signin?code=#{code}&hotel_name=#{self.hotel.friendly_id}"
  end

  def next_status
    if self.status == :checkout
      :checkin
    else
      :checkout
    end
  end

  def checkin
    self.status = :checkin if from && days>0
    self.save
  end

  def checkout
    self.status = :checkout
    self.from = nil
    self.days = 1
    self.ext_phone_type1 = nil
    self.ext_device_token_android1 = nil
    self.ext_device_token_ios1 = nil
    self.ext_phone_type2 = nil
    self.ext_device_token_android2 = nil
    self.ext_device_token_ios2 = nil
    self.sub_number = 0
    self.save
  end
end
