class Deal < ActiveRecord::Base
  belongs_to :member
  attr_accessible :actualprice, :address, :contact, :discountprice, :enddate, :location, :startdate, :dealtype, :dealname

  validates :actualprice, :address, :contact, :discountprice, :enddate, :location, :startdate, :dealtype, :dealname, :presence => true
  validates :discountprice, :numericality => {:less_than_or_equal_to => :actualprice} 
  validates :location, length: { maximum: 20}
  validates :contact, length: {minimum:10, maximum: 15}
  validates :actualprice, length:{maximum:10}
#  validate  :date_not_proper
  validate  :end_greater_than_start
  validates_numericality_of :contact, :discountprice, :actualprice

def end_greater_than_start
 if startdate.nil? 
  errors.add(:startdate, "Not in proper format")
 end
 
 if enddate.nil?
  errors.add(:enddate,"Not in proper format")
  return
 end 

 if startdate < Date.today 
  errors.add(:startdate,"Should be greater than today's date")
  return
 end
 
 if startdate > enddate
  errors.add(:startdate,"cannot be greater than enddate")
 end
end 

def date_not_proper
 if startdate == nil
   errors.add(:startdate,"Date not given in proper format")
 end 
 if enddate == nil
   errors.add(:enddate,"Date not given in proper format")
 end
end

end
