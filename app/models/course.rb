class Course < ApplicationRecord
  def average_salarie
    url = "https://www.catho.com.br/profissoes/busca/#{job()}/"
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
