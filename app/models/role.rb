class Role < ActiveRecord::Base
  has_many :auditions

  #def auditions
  #  self.auditions
  #end

  def actors
    #self.auditions.pluck(:actor)
    self.auditions.map do |audition| #self.auditions gives the audition of this role from self
      audition.actor
    end
  end

  def locations
    #self.auditions.pluck(:location)
    self.auditions.map do |audition|
      audition.location
    end
  end

  def lead
    #grabs the first true
    self.auditions.find_by(hired: true) || 'no actor has been hired for this role'
  end

  def understudy
    #get all the hired auditions array and then grabbing second
    self.auditions.where(hired: true).second || 'no actor has been hired for understudy for this role'
  end
end