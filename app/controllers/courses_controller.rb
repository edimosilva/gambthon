require 'net/http'

class CoursesController < ApplicationController
  def catcho
    render json: Course.first, each_serializer: CourseSerializer
  end

  def myseed
    Course.create(name: 'Enfermagem', ies: 'UNICHRISTUS', ies_full:'Unichristus - Centro Universitário Christus', city: 'Fortaleza', estagio:'estagio em enfermagem', about:'O curso de Enfermagem forma profissionais capazes de atuar para prevenir, promover, proteger e restabelecer a saúde das pessoas, trabalhando em parceria com outros profissionais do setor.', mec_score:'4', course_grade: 'https://unichristus.edu.br/graduacao/enfermagem/estrutura-curricular/', cep:'XXXXXX',lat:'my_lat',lng:'my_lng', field1: 'enfermeiro', field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png', field3:'1339.60', field4: '669.80', field5:'4', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/enfermagem', relatede_course:'Biomedicina', field7: 'CB', field8: 'CE', field9: '83%', field10: '-');

     Course.create(name: 'Enfermagem', ies: 'UNICHRISTUS2', ies_full:'Unichristus - Centro Universitário Christus', city: 'Fortaleza', estagio:'estagio em enfermagem', about:'O curso de Enfermagem forma profissionais capazes de atuar para prevenir, promover, proteger e restabelecer a saúde das pessoas, trabalhando em parceria com outros profissionais do setor.', mec_score:'4', course_grade: 'https://unichristus.edu.br/graduacao/enfermagem/estrutura-curricular/', cep:'XXXXXX',lat:'my_lat',lng:'my_lng', field1: 'enfermeiro', field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png', field3:'1339.60', field4: '669.80', field5:'4', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/enfermagem', relatede_course:'Biomedicina', field7: 'CB', field8: 'CE', field9: '83%', field10: '-');

    Course.create(name: 'Enfermagem', ies: 'UNICHRISTUS3', ies_full:'Unichristus - Centro Universitário Christus', city: 'São José', estagio:'estagio em enfermagem', about:'O curso de Enfermagem forma profissionais capazes de atuar para prevenir, promover, proteger e restabelecer a saúde das pessoas, trabalhando em parceria com outros profissionais do setor.', mec_score:'4', course_grade: 'https://unichristus.edu.br/graduacao/enfermagem/estrutura-curricular/', cep:'XXXXXX',lat:'my_lat',lng:'my_lng', field1: 'enfermeiro', field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png', field3:'1339.60', field4: '669.80', field5:'4', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/enfermagem', relatede_course:'Biomedicina', field7: 'CB', field8: 'CE', field9: '83%', field10: '-');

    Course.create(name: 'Direito', ies: 'UNICHRISTUS3', ies_full:'Unichristus - Centro Universitário Christus', city: 'São José', estagio:'estagio em enfermagem', about:'O curso de Enfermagem forma profissionais capazes de atuar para prevenir, promover, proteger e restabelecer a saúde das pessoas, trabalhando em parceria com outros profissionais do setor.', mec_score:'4', course_grade: 'https://unichristus.edu.br/graduacao/enfermagem/estrutura-curricular/', cep:'XXXXXX',lat:'my_lat',lng:'my_lng', field1: 'enfermeiro', field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png', field3:'1339.60', field4: '669.80', field5:'4', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/enfermagem', relatede_course:'Biomedicina', field7: 'CB', field8: 'CE', field9: '83%', field10: '-');
    render json: { data: Course.all }
  end

  def get_all_cities
    render json: Course.all.pluck(:city).uniq, each_serializer: CitySerializer
  end

  def get_all_ies_by_city
    city_name = params['city'];
    ies_by_city = Course.where(city: city_name).pluck(:ies).uniq;
    render json: ies_by_city, each_serializer: IesSerializer
  end

  def courses_by_ies
    ies_name = params['ies'];
    courses_by_ies = Course.where(ies: ies_name).pluck(:name).uniq;
    render json: courses_by_ies, each_serializer: CoursesByIesSerializer
  end

  def get_course_by_name_and_ies
    course_name = params['name'];
    ies = params['ies'];
    course = Course.find_by(name: course_name, ies: ies);
    render json: course, each_serializer: CourseSerializer
  end

  def get_all_ies
    render json: Course.all.pluck(:ies).uniq, each_serializer: IesSerializer
  end

  def deleteall
    Course.destroy_all
    render json: { data: Course.all }
  end

  def list
    render json: { data: Course.all }
  end
end
