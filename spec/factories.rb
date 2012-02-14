FactoryGirl.define do
  # sequence :email do |n|
  #   "customer#{n}@example.com"
  # end

  # sequence :product_name do |n|
  #   "Product #{n}"
  # end

  # sequence :customer_id do |n|
  #   n
  # end

  # sequence :subscription_id do |n|
  #   n
  # end

  # sequence :product_id do |n|
  #   n
  # end

  # factory :customer, :class => Chargify::Customer do |f|
  #   f.first_name { Faker::Name.first_name }
  #   f.last_name { Faker::Name.last_name }
  #   f.email { FactoryGirl.generate(:email) }
  #   f.organization { Faker::Company.name }
  #   f.created_at { 2.days.ago }
  #   f.updated_at { 1.hour.ago }
  # end

  # factory :product, :class => Chargify::Product do |f|
  #   f.name { FactoryGirl.generate(:product_name) }
  # end

  # factory :subscription_with_extra_attrs, :parent => :subscription do |f|
  #   f.customer Chargify::Customer.new
  #   f.product Chargify::Product.new
  #   f.credit_card "CREDIT CARD"
  # end

end
