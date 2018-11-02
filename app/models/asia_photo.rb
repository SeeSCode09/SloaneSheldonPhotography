class AsiaPhoto < ApplicationRecord

  validates :image, presence: true
  validates :caption, presence: true

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
  AsiaPhoto.next(self.id).first
end

def previous
  AsiaPhoto.previous(self.id).first
end

end
