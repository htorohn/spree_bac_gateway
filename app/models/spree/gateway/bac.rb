module Spree
  class Gateway::BAC < Gateway
    preference :keyid, :string
    preference :hashkey, :string


    def provider_class
      ActiveMerchant::Billing::BacGateway
    end


    # def purchase(money, creditcard, options = {})
    # 	options[:key_id] = :keyid.to_s

    # 	provider.purchase(money, creditcard, options)
    # end


  end
end
