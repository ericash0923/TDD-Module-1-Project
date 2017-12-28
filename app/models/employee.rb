class Employee < User
  def position 
    if self.hours < 40 
      'Part-Time'
    else
      'Full-Time'
    end
  end
  
  def phone_number
    "718-555-#{self.phone}"
  end
end