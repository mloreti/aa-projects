class Course < ActiveRecord::Base

  has_many :enrollments,
    class_name: :Enrollment,
    primary_key: :id,
    foreign_key: :course_id


  belongs_to :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User

  has_many :enrolled_students,
    through: :enrollments,
    source: :users

    # def prerequisite
    #   if self.prereq_id
    #     Course.find(prereq_id)
    #   else
    #     "No prereqs"
    #   end
    # end


  # def instructor
  #   User.find(instructor_id)
  # end
end
