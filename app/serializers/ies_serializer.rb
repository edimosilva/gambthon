class IesSerializer < ActiveModel::Serializer
  attributes :ies_name

  def ies_name
    self.object
  end
end
