class CourseSerializer < ActiveModel::Serializer
  attributes :name, :full_name, :ies_name, :ies_full, :ies_logo, :city, :average_salarie, :estagio_average_salarie, :valor_completo, :valor_com_desconto, :valor_do_desconto, :duracao_curso, :link_bolsa, :area, :state, :empregabilidade, :intercambio, :about, :mec_score, :course_grade, :cep, :lat, :lng, :lat_lng, :distance_to_center

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
    a = object.area
    if a == 'CE'
      return 'Ciências Exatas'
    elsif a == 'CB'
      return 'Ciências Biológicas'
    elsif a == 'CH'
      return 'Ciências Humanas'
    end

    a
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

  def distance_to_center
    d = object.distance_to_center
    d = d.to_s.gsub('.', ',')

    "#{d} KM" if d
  end

  def lat_lng
    "#{object.lat},#{object.lng}"
  end
end
