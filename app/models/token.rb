require 'securerandom'

class Token < ActiveRecord::Base
  belongs_to :user

    # Takes in a user object
    # Returns new token
    def self.generate(user)
        nonce = SecureRandom.hex(10)
        token = Token.new({
            'nonce': nonce,
            'user_id':user.id
        })
        return token
    end
end
