class Outfit < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :temp, :name
  validates :rain, inclusion: [true, false]
  has_attached_file :image_upload, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_presence_of :image_upload
  validates_attachment_content_type :image_upload, content_type: /\Aimage\/.*\Z/


  TEMPERATURES = ['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']

  #Methods to return random outfits from db based on temp range and criteria



  def self.outfit(current_user, temperature, rain_status)
    if current_user
      Outfit.where(user_id: current_user.id, temp: temperature , rain: rain_status).sample
    end
  end

  # def self.freezing_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'freezing', rain: false).sample
  #   end
  # end

  # def self.freezing_rain_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'freezing', rain: true).sample
  #   end
  # end

  # def self.cold_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'cold', rain: false).sample
  #   end
  # end

  # def self.cold_rain_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'cold', rain: true).sample
  #   end
  # end

  # def self.cool_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'cool', rain: false).sample
  #   end
  # end

  # def self.cool_rain_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'cool', rain: true).sample
  #   end
  # end

  # def self.warm_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'warm', rain: false).sample
  #   end
  # end

  # def self.warm_rain_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'warm', rain: true).sample
  #   end
  # end

  # def self.hot_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'hot', rain: false).sample
  #   end
  # end
  
  # def self.hot_rain_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'hot', rain: true).sample
  #   end
  # end
      
  # def self.super_hot_rain_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'super hot', rain: true).sample
  #   end
  # end
      
  # def self.super_hot_outfit(current_user)
  #   if current_user
  #     Outfit.where(user_id: current_user.id, temp: 'super hot', rain: false).sample
  #   end
  # end

end
