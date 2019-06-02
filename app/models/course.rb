class Course < ApplicationRecord
  def average_salarie
    average_salarie_from_catho(job)
  end

  def estagio_average_salarie
    search_term = "estagio-em-#{name}"
    average_salarie_from_catho(search_term)
  end

  def average_salarie_from_catho(search_term)
    url = "https://www.catho.com.br/profissoes/busca/#{search_term}/"
    parsed_url = URI.parse(url)
    http = Net::HTTP.new(parsed_url.host, parsed_url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(parsed_url.request_uri)

    response = http.request(request)
    response.inspect
    json_body = JSON.parse(response.body)
    salaries_average(json_body)
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
    "R$ #{field3.to_f - field4.to_f}"
  end


  def salaries_average(json)
    jobs = json['cargos'];
    sum = 0.0
    min_salary = 99999999
    max_salary = 0
    for job in jobs
      salary = job['mediaSalarial'].to_f
      min_salary = salary if salary < min_salary
      max_salary = salary if salary > max_salary
    end
    value = "R$ #{min_salary} - R$ #{max_salary}"
    value
  end
end
