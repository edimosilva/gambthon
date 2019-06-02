class CourseSerializer < ActiveModel::Serializer
  attributes :name, :full_name, :ies_name, :ies_logo, :city, :average_salarie, :estagio_average_salarie, :valor_completo, :valor_com_desconto, :valor_do_desconto

  def full_name
    "#{self.object.name} - #{self.object.ies} - #{self.object.city}"
  end

  def ies_name
    self.object.ies
  end

  def ies_logo
    self.object.ies_logo
  end

  def valor_completo
    object.full_value
  end

  def valor_com_desconto
    object.bolsa_value
  end

  def valor_do_desconto
    object.valor_do_desconto
  end

  def average_salarie
    self.object.average_salarie
  end

  def estagio_average_salarie
    self.object.estagio_average_salarie
  end

end
