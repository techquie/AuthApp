class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        puts "Hello ********************************************************************"
        @customer = Customer.from_omniauth(request.env['omniauth.auth'])
        puts "***************************** #{@customer.inspect}"
        if @customer.persisted?
          flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'GitHub'
          sign_in_and_redirect @customer, event: :authentication
        else
          session['devise.github_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
          redirect_to new_customer_registration_url, alert: @customer.errors.full_messages.join("\n")
        end
    end
  end