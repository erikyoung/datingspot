class Advice < ActiveRecord::Base
has_many :advices


validates_presence_of :body, :title 

end
