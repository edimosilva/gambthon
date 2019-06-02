class Course < ApplicationRecord
  def average_salarie
    average_salarie_from_catho(job)
  end

  def estagio_average_salarie
    estagio_slug = estagio.gsub!(' ', '-')
    # search_term = "estagio-em-#{name}"
    average_salarie_from_catho(estagio_slug)
  end

  def average_salarie_from_catho(search_term)
    begin
      url = "https://www.catho.com.br/profissoes/busca/#{search_term}/"
      parsed_url = URI.parse(url)
      http = Net::HTTP.new(parsed_url.host, parsed_url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(parsed_url.request_uri)

      response = http.request(request)
      response.inspect
      json_body = JSON.parse(response.body)
      salaries_average(json_body)
    rescue Exception => e # Never do this!
      print e
    end
  end

  def job
    field1
  end

  def ies_logo
    field2
  end

  def full_value
    "R$ #{field3}"
  end

  def bolsa_value
    "R$ #{field4}"
  end

  def valor_do_desconto
    result = field3.to_f - field4.to_f
    result = "#{'%.2f' % result}"
    "R$ #{result}"
  end

  def duracao_curso
    field5
  end

  def link_bolsa
    field6
  end

  def area
    field7
  end

  def state
    field8
  end

  def empregabilidade
    field9
  end

  def intercambio
    field10
  end

  def salaries_average(json)
    begin
      jobs = json['cargos'];
      sum = 0.0
      min_salary = 99999999
      max_salary = 0
      for job in jobs
        salary = job['mediaSalarial'].to_f
        min_salary = salary if salary < min_salary && salary > 0
        max_salary = salary if salary > max_salary
      end
      value = "R$ #{min_salary} - R$ #{max_salary}"
      value
    rescue Exception => e # Never do this!
      print e
    end
  end

  def fix_city_name
    courses = Course.where(city: 'São José dos campos');
    for course in courses
      course.city = 'São José dos Campos'
      course.save
    end
  end

  def distance_to_center
    origin =''
    if city == 'Fortaleza'
      origin = '-3.7338361,-38.550539'
    else
      origin = '-23.1894908,-45.9330526'
    end
    destination = "#{lat},#{lng}"
    get_distance_between(origin, destination)
  end

  def distance_to_ies(origin)
    destination = "#{lat},#{lng}"
    get_distance_between(origin, destination)
  end

  def get_distance_between(origin, destination)
    begin
      p1 = 'AIzaSyDF46INGwHxtPF8O8'
      p2 = 'HzKm779hmNEqR35rc'
      key = "#{p1}#{p2}"
      url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{origin}&destinations=#{destination}&key=#{key}"
      parsed_url = URI.parse(url)
      http = Net::HTTP.new(parsed_url.host, parsed_url.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(parsed_url.request_uri)

      response = http.request(request)
      response.inspect
      json_body = JSON.parse(response.body)
      json_body['rows'][0]['elements'][0]['distance']['value'].to_f / 1000
    rescue Exception => e # Never do this!
      print e
    end
  end
end
