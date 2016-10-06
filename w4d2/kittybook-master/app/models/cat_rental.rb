class CatRental < ActiveRecord::Base
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "%{value} is not a status..." }
  validate :overlapping_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def approve!
    self.status = "APPROVED"
  end

  def overlapping_request
    start_date = self.start_date
    end_date = self.end_date
    overlap = []
    CatRental.all.each do |cat_rental|
      overlap << cat_rental if (cat_rental.start_date <= start_date && cat_rental.end_date >= start_date) || (cat_rental.start_date <= end_date && cat_rental.end_date >= end_date)
    end
    overlap
  end

  def overlapping_approved_request
    overlaps = overlapping_request
    if overlaps.any? { |date| date.status == "APPROVED" }
      self.errors[:date] << "is overlapping"
    end
  end

  def overlapping_pending_request
    overlaps = overlapping_request
    if overlaps.any? { |date| date.status == "PENDING" }
      self.errors[:date] << "is overlapping"
    end
  end

end
