class Student < ApplicationRecord
  has_one :student_info

  def details
    {
      name: name,
      age: age,
      city: student_info.try(:city),
      sex: student_info.try(:sex)
    }
  end

  def other_info
    {
      name: name,
      age: age,
    }
  end

  def info
    {
      city: student_info.try(:city),
      sex: student_info.try(:sex)
    }
  end
end
