class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable :trackable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :provider, :uid

  has_many :wish_lists
  # attr_accessible :title, :body

  def to_s
    "#{email}"
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:email => auth.info.email).first ||
           User.where(:provider => auth.provider, :uid => auth.uid).first_or_initialize

    unless user.persisted?
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0,20]

      user.save
    end

    user
  end
end
