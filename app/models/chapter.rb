class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :sections, :dependent => :delete_all
  #accepts_nested_attributes_for :sections, allow_destroy: true
end
