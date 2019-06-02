class CourseSerializer < ActiveModel::Serializer
  attributes :name, :full_name, :ies_name, :ies_logo, :city, :average_salarie, :estagio_average_salarie, :valor_completo, :valor_com_desconto, :valor_do_desconto, :duracao_curso, :link_bolsa, :area, :state, :empregabilidade, :intercambio,:ies_full, :estagio, :about, :relatede_course, :mec_score, :course_grade, :cep, :lat, :lng

  def full_name
    "#{object.name} - #{object.ies} - #{object.city}"
  end

  def ies_name
    object.ies
  end

  def ies_logo
    object.ies_logo
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
    object.average_salarie
  end

  def estagio_average_salarie
    object.estagio_average_salarie
  end

  def duracao_curso
    object.duracao_curso
  end

  def area
    object.area
  end

  def state
    object.state
  end

  def empregabilidade
    object.empregabilidade
  end

  def link_bolsa
    object.link_bolsa
  end

  def intercambio
    object.intercambio
  end
end
