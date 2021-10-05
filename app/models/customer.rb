class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]


  def self.from_omniauth(access_token)
     data = access_token.info
     puts "Hello 2 *************** #{data} ***************************************************** #{data['email']} *********** "
        
     customer = Customer.where(email: data['email']).first
    
     # Uncomment the section below if you want users to be created if they don't exist
     unless customer
       customer = Customer.create(name: data['name'],
         email: data['email'],
         password: Devise.friendly_token[0,20]
       )
    end
    
    customer
  end

#   def self.from_omniauth(auth)
#     where(email:  auth.info.email).first_or_create do |customer|
#     #customer.provider = auth.provider
#     customer.name = auth.info.name
#     #customer.uid = auth.uid
#     customer.email = auth.info.email
#     customer.password = Devise.friendly_token[0,20]
#   end
# end
      
end









