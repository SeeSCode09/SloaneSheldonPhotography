class AfricaPhoto < ApplicationRecord

  validates :image, presence: true
  validates :caption, presence: true

  default_scope {order(id: :asc)}

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    AfricaPhoto.next(self.id).first
  end

  def previous
    AfricaPhoto.previous(self.id).last
  end

end
