class CitySerializer < ActiveModel::Serializer
attributes :city_name

  def city_name
    self.object
  end
end
