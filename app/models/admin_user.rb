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
  belongs_to :department, optional: true
  as_enum :role, [:super_admin , :hotel_admin, :department_manager], source: :role, map: :string
  validates :role, presence: true

  def admin_users
    if self.super_admin?
      AdminUser.all
    elsif self.hotel_admin?
      AdminUser.where(hotel_id: self.hotel_id)
    elsif self.department_manager?
      AdminUser.where(id:self.id)
    end
  end
  def hotels
    if self.super_admin?
      Hotel.friendly.all
    elsif self.hotel_admin?
      Hotel.friendly.where(id: self.hotel_id)
    elsif self.department_manager?
      Hotel.where(id: self.hotel_id).friendly
    end
  end
  def departments
    if self.super_admin?
      Department.all
    elsif self.hotel_admin?
      self.hotel.departments
    elsif self.department_manager?
      Department.where(id: self.department_id)
    end
  end

  def products
    if self.super_admin?
      Product.all
    elsif self.hotel_admin?
      self.hotel.products
    elsif self.department_manager?
      self.department.products
    end
  end

  def rooms
    if self.super_admin?
      Room.all
    elsif self.hotel_admin?
      self.hotel.rooms
    elsif self.department_manager?
      self.hotel.rooms
    end
  end

  def orders
    if self.super_admin?
      Order.all
    elsif self.hotel_admin?
      self.hotel.orders
    elsif self.department_manager?
      self.hotel.orders.joins(:order_details).where(order_details:{ product: self.department.products })
    end
  end

  def order_details
    if self.super_admin?
      OrderDetail.all
    elsif self.hotel_admin?
      OrderDetail.where(id:self.hotel.order_details)
    elsif self.department_manager?
      OrderDetail.where(product: self.department.products)
    end
  end
end
