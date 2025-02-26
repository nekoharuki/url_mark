class User < ApplicationRecord
  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)

    if user.new_record?
      existing_user = find_by(email: auth.info.email)
      if existing_user
        user = existing_user
        user.update(provider: auth.provider, uid: auth.uid)
      else
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = SecureRandom.hex(10) # 仮パスワード
        user.save
      end
    end

    user
  end
end
