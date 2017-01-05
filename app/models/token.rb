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

  # Takes in a nonce
  # Returns associated User or nil
  def self.consume(nonce)
    token = Token.find_by(nonce: nonce)
    if token
        user = User.find_by(id: token.user_id)
        token.destroy
        return user
    else
        return nil
    end
  end
end
