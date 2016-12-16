class Advice < ActiveRecord::Base
has_many :advices




validates :title, presence: true, length: {maximum: 140}
validates :body, presence: true

end
