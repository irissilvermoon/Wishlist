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

  has_many :outbound_subscriptions, :class_name => 'Subscription', :foreign_key => :watcher_id
  has_many :watching, :through => :outbound_subscriptions
  has_many :inbound_subscriptions, :class_name => 'Subscription', :foreign_key => :watching_id
  has_many :watchers, :through => :inbound_subscriptions
  # attr_accessible :title, :body

  def to_s
    "#{email}"
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.associate_existing(auth) ||
           User.where(:provider => auth.provider, :uid => auth.uid).first_or_initialize

    unless user.persisted?
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0,20]

      user.save
    end

    user
  end

  def self.associate_existing(auth)
    user = User.where(:email => auth.info.email).first

    if user
      user.provider = auth.provider
      user.uid      = auth.uid

      user.save
    end

    user
  end
end
