json.extract! customer, :id, :email, :name, :password, :contact, :dob, :gender, :created_at, :updated_at
json.url customer_url(customer, format: :json)
