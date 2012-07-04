class Picture < ActiveRecord::Base
  attr_accessible :photo, :tag
  has_attached_file :photo, :styles => { :medium => "300x300>",:large => "1000x1000>", :thumb => "100x100>" }
end
