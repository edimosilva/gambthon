class CoursesByIesSerializer < ActiveModel::Serializer
  attributes :course_name

  def course_name
    self.object
  end

end
