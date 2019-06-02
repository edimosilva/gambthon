class CourseSerializer < ActiveModel::Serializer
  attributes :name, :ies_name, :city

  def ies_name
    self.object.ies
  end
end
