class Node < ActiveRecord::Base
  has_and_belongs_to_many :stories
  validates :sentence, :presence => true
end
