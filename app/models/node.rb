class Node < ActiveRecord::Base
  validates :sentence, :presence => true
end
