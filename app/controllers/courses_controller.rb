require 'net/http'

class CoursesController < ApplicationController
  def catcho
    render json: Course.first, each_serializer: CourseSerializer
  end

  def distance_to_ies
    origin = params[:user_lat_lng]
    ies_name = params[:ies]
    course = Course.where(ies: ies_name)[0]
    render json: { data: course.distance_to_ies(origin) }
  end

  def courses_by_city
    city_name = params['city'];
    courses_by_city = Course.where(city: city_name).pluck(:name).uniq;
    render json: courses_by_city
  end

  def set_lat_andlng
    ies = params['ies']
    lat = params['lat']
    lng = params['lng']
    courses = Course.where(ies: ies)
    for course in courses
      course.lat = lat
      course.lng = lng
      course.save
    end
  end

  def get_all_cities
    render json: Course.all.pluck(:city).uniq
  end

  def get_all_ies_by_city
    city_name = params['city'];
    ies_by_city = Course.where(city: city_name).pluck(:ies).uniq;
    render json: ies_by_city
  end

  def get_all_ies_by_course_and_city
    course_name = params['name'];
    city = params['city'];
    course = Course.where(name: course_name, city: city).pluck(:ies).uniq;
    render json: course
  end


  def courses_by_ies
    ies_name = params['ies'];
    courses_by_ies = Course.where(ies: ies_name).pluck(:name).uniq;
    render json: courses_by_ies
  end

  def get_course_by_name_and_ies
    course_name = params['name'];
    ies = params['ies'];
    course = Course.find_by(name: course_name, ies: ies);
    render json: course, serializer: CourseSerializer
  end

  def get_course_by_name_and_ies_and_city
    course_name = params['name'];
    ies = params['ies'];
    city = params['city'];

    course = Course.find_by(name: course_name, ies: ies, city: city);
    render json: course, serializer: CourseSerializer
  end
  def deleteall
    Course.destroy_all
    render json: { data: Course.all }
  end

  def list
    render json: Course.all, each_serializer: CourseSerializer
  end

  def get_all_ies
    render json: Course.all.pluck(:ies).uniq, each_serializer: IesSerializer
  end

  def myseed
    Course.create(name:'Enfermagem',ies:'UNICHRISTUS',ies_full:'Unichristus - Centro Universitário Christus',city:'Fortaleza',estagio:'estagio em enfermagem',about:'O curso de Enfermagem forma profissionais capazes de atuar para prevenir, promover, proteger e restabelecer a saúde das pessoas, trabalhando em parceria com outros profissionais do setor.',mec_score:'4',course_grade:'https://unichristus.edu.br/graduacao/enfermagem/estrutura-curricular/',cep:'60160-230',lat:'',lng:'',field1:'Enfermeiro',field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png',field3:'1339,6',field4:'669,8',field5:'4', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/enfermagem',relatede_course:'2',field7:'CB',field8:'CE',field9:'83%',field10:'-')
    Course.create(name:'Biomedicina',ies:'UNICHRISTUS',ies_full:'Unichristus - Centro Universitário Christus',city:'Fortaleza',estagio:'estagio em Ciencias Biomedicas',about:'O curso de Biomedicina, também chamado de Ciências Biológicas modalidade Médica ou ainda de Ciências Biomédicas, faz parte das Ciências Biológicas. É voltado para a pesquisa das doenças humanas, suas causas e formas de tratamento.',mec_score:'4',course_grade:'https://unichristus.edu.br/graduacao/biomedicina/estrutura-curricular/',cep:'60160-230',lat:'',lng:'',field1:'Biomedico',field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png',field3:'1418,4',field4:'709,2',field5:'4', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/biomedicina',relatede_course:'1',field7:'CB',field8:'CE',field9:'-',field10:'sim')
    Course.create(name:'Direito',ies:'UNICHRISTUS',ies_full:'Unichristus - Centro Universitário Christus',city:'Fortaleza',estagio:'estagio em direito',about:'O curso de Direito prepara profissionais para cuidar da aplicação das leis e normas jurídicas vigentes em um país ou região. Durante as aulas, o estudante adquire conhecimento teórico e técnico sobre Legislação Brasileira e Legislação Internacional, além de visão crítica e consciência política e social.',mec_score:'5',course_grade:'https://unichristus.edu.br/graduacao/direito/estrutura-curricular/',cep:'60160-230',lat:'',lng:'',field1:'Advogado',field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png',field3:'1539,6',field4:'769,8',field5:'5', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/direito',relatede_course:'',field7:'CH',field8:'CE',field9:'',field10:'')
    Course.create(name:'Arquitetura',ies:'UNICHRISTUS',ies_full:'Unichristus - Centro Universitário Christus',city:'Fortaleza',estagio:'estagio em arquitetura',about:'O curso de Arquitetura e Urbanismo forma profissionais capazes de projetar, planejar, construir e organizar espaços internos e externos, de acordo com critérios de estética, conforto e funcionalidade, em correspondência às necessidades sociai',mec_score:'5',course_grade:'https://unichristus.edu.br/graduacao/arquitetura-e-urbanismo/estrutura-curricular/',cep:'60160-230',lat:'',lng:'',field1:'Arquiteto',field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png',field3:'1684,8',field4:'842,4',field5:'5', field6:'https://querobolsa.com.br/ffb-faculdade-farias-brito/cursos?c=Arquitetura%20e%20Urbanismo&l=graduacao&lc=fortaleza&ls=ce',relatede_course:'',field7:'CE',field8:'CE',field9:'',field10:'')
    Course.create(name:'Psicologia',ies:'FBUNI',ies_full:'FBUNI - Centro Universitário Fárias Brito',city:'Fortaleza',estagio:'estagio em psicologia',about:'O curso de Psicologia forma profissionais capazes de diagnosticar, prevenir e tratar doenças mentais, distúrbios emocionais e de personalidade.',mec_score:'5',course_grade:'http://fbuni.edu.br/sites/default/files/12487018-_matriz_curricular_psicologia_2.pdf',cep:'60175-230',lat:'',lng:'',field1:'Psicologo',field2:'http://blog.fbuni.edu.br/wp-content/uploads/2018/10/Logo-FB-UNI-300x150.png',field3:'1418,4',field4:'709,2',field5:'5', field6:'https://querobolsa.com.br/ffb-faculdade-farias-brito/cursos?c=Psicologia&l=graduacao&lc=fortaleza&ls=ce',relatede_course:'2',field7:'CH',field8:'CE',field9:'',field10:'')
    Course.create(name:'Direito',ies:'FBUNI',ies_full:'FBUNI - Centro Universitário Fárias Brito',city:'Fortaleza',estagio:'estagio em direito',about:'O curso de Direito prepara profissionais para cuidar da aplicação das leis e normas jurídicas vigentes em um país ou região. Durante as aulas, o estudante adquire conhecimento teórico e técnico sobre Legislação Brasileira e Legislação Internacional, além de visão crítica e consciência política e social.',mec_score:'5',course_grade:'http://fbuni.edu.br/sites/default/files/ffb/noticias/anexos/1294856592.54749294_CURRaICULO%20NOVaISSIMO.pdf',cep:'60175-230',lat:'',lng:'',field1:'Advogado',field2:'http://blog.fbuni.edu.br/wp-content/uploads/2018/10/Logo-FB-UNI-300x150.png',field3:'1571,58',field4:'942,95',field5:'5', field6:'https://querobolsa.com.br/ffb-faculdade-farias-brito/cursos/direito',relatede_course:'',field7:'CH',field8:'CE',field9:'',field10:'sim')
    Course.create(name:'Arquitetura',ies:'FBUNI',ies_full:'FBUNI - Centro Universitário Fárias Brito',city:'Fortaleza',estagio:'estagio em arquitetura',about:'O curso de Arquitetura e Urbanismo forma profissionais capazes de projetar, planejar, construir e organizar espaços internos e externos, de acordo com critérios de estética, conforto e funcionalidade, em correspondência às necessidades sociai',mec_score:'5',course_grade:'http://fbuni.edu.br/graduacao/arquitetura-e-urbanismo',cep:'60175-230',lat:'',lng:'',field1:'Arquiteto',field2:'http://blog.fbuni.edu.br/wp-content/uploads/2018/10/Logo-FB-UNI-300x150.png',field3:'1627,08',field4:'878,62',field5:'5', field6:'https://querobolsa.com.br/ffb-faculdade-farias-brito/cursos?c=Arquitetura%20e%20Urbanismo&l=graduacao&lc=fortaleza&ls=ce',relatede_course:'',field7:'CE',field8:'CE',field9:'',field10:'')
    Course.create(name:'Enfermagem',ies:'UNIP',ies_full:'Universidade Paulista - UNIP',city:'São José dos Campos',estagio:'estagio em direito',about:'O curso de Enfermagem forma profissionais capazes de atuar para prevenir, promover, proteger e restabelecer a saúde das pessoas, trabalhando em parceria com outros profissionais do setor.',mec_score:'4',course_grade:'https://www.unip.br/presencial/ensino/graduacao/tradicionais/bio_enfermagem.aspx',cep:'12240-420',lat:'',lng:'',field1:'Enfermeiro',field2:'https://www.acejundiai.com.br/wp-content/uploads/2018/07/UNIP-Logomarca.png',field3:'2066,25',field4:'681,86',field5:'4', field6:'https://querobolsa.com.br/unip/cursos?ad=Acesso%20UNIP%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20Limoeiro,%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20SP&c=Enfermagem&l=graduacao&lat=-23.2561814&lng=-45.94613730000003',relatede_course:'',field7:'CB',field8:'SP',field9:'83%',field10:'sim')
    Course.create(name:'Biomedicina',ies:'UNIP',ies_full:'Universidade Paulista - UNIP',city:'São José dos Campos',estagio:'estagio em Ciencias Biomedicas',about:'O curso de Biomedicina, também chamado de Ciências Biológicas modalidade Médica ou ainda de Ciências Biomédicas, faz parte das Ciências Biológicas. É voltado para a pesquisa das doenças humanas, suas causas e formas de tratamento.',mec_score:'5',course_grade:'https://www.unip.br/presencial/ensino/graduacao/tradicionais/bio_biomedicina.aspx',cep:'12240-420',lat:'',lng:'',field1:'Biomedico',field2:'https://www.acejundiai.com.br/wp-content/uploads/2018/07/UNIP-Logomarca.png',field3:'2327,74',field4:'837,99',field5:'5', field6:'https://querobolsa.com.br/unip/cursos?ad=Acesso%20UNIP%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20Limoeiro,%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20SP&c=Biomedicina&l=graduacao&lat=-23.2561814&lng=-45.94613730000003',relatede_course:'',field7:'CB',field8:'SP',field9:'-',field10:'sim')
    Course.create(name:'Psicologia',ies:'UNIP',ies_full:'Universidade Paulista - UNIP',city:'São José dos Campos',estagio:'estagio em psicologia',about:'O curso de Psicologia forma profissionais capazes de diagnosticar, prevenir e tratar doenças mentais, distúrbios emocionais e de personalidade.',mec_score:'5',course_grade:'https://www.unip.br/presencial/ensino/graduacao/tradicionais/hum_psicologia.aspx',cep:'12240-420',lat:'',lng:'',field1:'Psicologo',field2:'https://www.acejundiai.com.br/wp-content/uploads/2018/07/UNIP-Logomarca.png',field3:'2139,64',field4:'877,25',field5:'5', field6:'https://querobolsa.com.br/unip/cursos?ad=Acesso%20UNIP%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20Limoeiro,%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20SP&c=Psicologia&l=graduacao&lat=-23.2561814&lng=-45.94613730000003',relatede_course:'',field7:'CB',field8:'SP',field9:'70%',field10:'sim')
    Course.create(name:'Direito',ies:'UNIP',ies_full:'Universidade Paulista - UNIP',city:'São José dos Campos',estagio:'estagio em direito',about:'O curso de Direito prepara profissionais para cuidar da aplicação das leis e normas jurídicas vigentes em um país ou região. Durante as aulas, o estudante adquire conhecimento teórico e técnico sobre Legislação Brasileira e Legislação Internacional, além de visão crítica e consciência política e social.',mec_score:'4',course_grade:'https://www.unip.br/presencial/ensino/graduacao/tradicionais/hum_direito.aspx',cep:'12240-420',lat:'',lng:'',field1:'Advogado',field2:'https://www.acejundiai.com.br/wp-content/uploads/2018/07/UNIP-Logomarca.png',field3:'1908,17',field4:'839,59',field5:'4', field6:'https://querobolsa.com.br/unip/cursos?ad=Acesso%20UNIP%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20Limoeiro,%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20SP&c=Direito&l=graduacao&lat=-23.2561814&lng=-45.94613730000003',relatede_course:'',field7:'CH',field8:'SP',field9:'-',field10:'sim')
    Course.create(name:'Arquitetura',ies:'UNIP',ies_full:'Universidade Paulista - UNIP',city:'São José dos Campos',estagio:'estagio em arquitetura',about:'O curso de Arquitetura e Urbanismo forma profissionais capazes de projetar, planejar, construir e organizar espaços internos e externos, de acordo com critérios de estética, conforto e funcionalidade, em correspondência às necessidades sociai',mec_score:'5',course_grade:'https://unichristus.edu.br/graduacao/arquitetura-e-urbanismo/estrutura-curricular/',mec_score:'5',course_grade:'https://www.unip.br/presencial/ensino/graduacao/tradicionais/exatas_arq_urbanismo.aspx',cep:'12240-420',lat:'',lng:'',field1:'Arquiteto',field2:'https://www.acejundiai.com.br/wp-content/uploads/2018/07/UNIP-Logomarca.png',field3:'2139,64',field4:'663,29',field5:'5', field6:'https://querobolsa.com.br/unip/cursos?ad=Acesso%20UNIP%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20Limoeiro,%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20SP&c=Arquitetura&l=graduacao&lat=-23.2561814&lng=-45.94613730000003',relatede_course:'',field7:'CE',field8:'SP',field9:'-',field10:'sim')
    Course.create(name:'Publicidade',ies:'UNIP',ies_full:'Universidade Paulista - UNIP',city:'São José dos Campos',estagio:'estagio em comunicacao',about:'O curso de Publicidade e Propaganda forma profissionais especializados em campanhas e peças publicitárias. Durante as aulas, o estudante aprende a planejar, criar, produzir, difundir e gerenciar a comunicação publicitária, além de ações promocionais e de incentivo, identidade corporativa, eventos e patrocínio e atividades de marketing e assessoria.',mec_score:'4',course_grade:'https://www.unip.br/presencial/ensino/graduacao/tradicionais/hum_com_social_publ_prop.aspx',cep:'12240-420',lat:'',lng:'',field1:'publicitario',field2:'https://www.acejundiai.com.br/wp-content/uploads/2018/07/UNIP-Logomarca.png',field3:'1815,94',field4:'544,78',field5:'4', field6:'https://querobolsa.com.br/unip/cursos?ad=Acesso%20UNIP%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20Limoeiro,%20S%C3%A3o%20Jos%C3%A9%20dos%20Campos%20-%20SP&c=Publicidade%20e%20Propaganda&l=graduacao&lat=-23.2561814&lng=-45.94613730000003',relatede_course:'',field7:'CH',field8:'SP',field9:'75%',field10:'-')
    Course.create(name:'Enfermagem',ies:'Anhanguera',ies_full:'Anhanguera',city:'São José dos Campos',estagio:'estagio em enfermagem',about:'O curso de Enfermagem forma profissionais capazes de atuar para prevenir, promover, proteger e restabelecer a saúde das pessoas, trabalhando em parceria com outros profissionais do setor.',mec_score:'5',course_grade:'https://www.anhanguera.com/graduacao/cursos/enfermagem.php',cep:'12236-660',lat:'',lng:'',field1:'Enfermeiro',field2:'https://upload.wikimedia.org/wikipedia/pt/8/83/Anhanguera_Educacional_logo.png',field3:'1402,67',field4:'995,9',field5:'5', field6:'https://querobolsa.com.br/busca-cursos/resultados?c=Enfermagem&l=graduacao&lc=sao-jose-dos-campos&ls=sp&u=anhanguera%7CFaculdades%20Anhanguera%20%28ANHANGUERA%29',relatede_course:'',field7:'CB',field8:'SP',field9:'83%',field10:'-')
    Course.create(name:'Biomedicina',ies:'Anhanguera',ies_full:'Anhanguera',city:'São José dos Campos',estagio:'estagio em Ciencias Biomedicas',about:'O curso de Biomedicina, também chamado de Ciências Biológicas modalidade Médica ou ainda de Ciências Biomédicas, faz parte das Ciências Biológicas. É voltado para a pesquisa das doenças humanas, suas causas e formas de tratamento.',mec_score:'5',course_grade:'https://www.anhanguera.com/graduacao/cursos/biomedicina.php',cep:'12236-660',lat:'',lng:'',field1:'Biomedico',field2:'https://upload.wikimedia.org/wikipedia/pt/8/83/Anhanguera_Educacional_logo.png',field3:'1318,67',field4:'936,26',field5:'5', field6:'https://querobolsa.com.br/busca-cursos/resultados?c=Biomedicina&l=graduacao&lc=sao-jose-dos-campos&ls=sp&u=anhanguera%7CFaculdades%20Anhanguera%20%28ANHANGUERA%29',relatede_course:'',field7:'CB',field8:'SP',field9:'-',field10:'sim')
    Course.create(name:'Psicologia',ies:'Anhanguera',ies_full:'Anhanguera',city:'São José dos Campos',estagio:'estagio em psicologia',about:'O curso de Psicologia forma profissionais capazes de diagnosticar, prevenir e tratar doenças mentais, distúrbios emocionais e de personalidade.',mec_score:'5',course_grade:'https://www.anhanguera.com/graduacao/cursos/psicologia.php',cep:'12236-660',lat:'',lng:'',field1:'Psicologo',field2:'https://upload.wikimedia.org/wikipedia/pt/8/83/Anhanguera_Educacional_logo.png',field3:'1465,33',field4:'1040,38',field5:'5', field6:'https://querobolsa.com.br/busca-cursos/resultados?c=Psicologia&l=graduacao&lc=sao-jose-dos-campos&ls=sp&u=anhanguera%7CFaculdades%20Anhanguera%20%28ANHANGUERA%29',relatede_course:'',field7:'CB',field8:'SP',field9:'70%',field10:'-')
    Course.create(name:'Direito',ies:'Anhanguera',ies_full:'Anhanguera',city:'São José dos Campos',estagio:'estagio em direito',about:'O curso de Direito prepara profissionais para cuidar da aplicação das leis e normas jurídicas vigentes em um país ou região. Durante as aulas, o estudante adquire conhecimento teórico e técnico sobre Legislação Brasileira e Legislação Internacional, além de visão crítica e consciência política e social.',mec_score:'4',course_grade:'https://www.anhanguera.com/graduacao/cursos/direito.php',cep:'12236-660',lat:'',lng:'',field1:'Advogado',field2:'https://upload.wikimedia.org/wikipedia/pt/8/83/Anhanguera_Educacional_logo.png',field3:'1332',field4:'852,48',field5:'4', field6:'https://querobolsa.com.br/busca-cursos/resultados?c=Direito&l=graduacao&lc=sao-jose-dos-campos&ls=sp&u=anhanguera%7CFaculdades%20Anhanguera%20%28ANHANGUERA%29',relatede_course:'',field7:'CH',field8:'SP',field9:'-',field10:'-')
    Course.create(name:'Arquitetura',ies:'Anhanguera',ies_full:'Anhanguera',city:'São José dos Campos',estagio:'estagio em arquitetura',about:'O curso de Arquitetura e Urbanismo forma profissionais capazes de projetar, planejar, construir e organizar espaços internos e externos, de acordo com critérios de estética, conforto e funcionalidade, em correspondência às necessidades sociai',mec_score:'5',course_grade:'https://unichristus.edu.br/graduacao/arquitetura-e-urbanismo/estrutura-curricular/',mec_score:'5',course_grade:'https://www.anhanguera.com/graduacao/cursos/arquitetura-e-urbanismo.php',cep:'12236-660',lat:'',lng:'',field1:'Arquiteto',field2:'https://upload.wikimedia.org/wikipedia/pt/8/83/Anhanguera_Educacional_logo.png',field3:'1333,33',field4:'946,66',field5:'5', field6:'https://querobolsa.com.br/busca-cursos/resultados?c=Arquitetura&l=graduacao&lc=sao-jose-dos-campos&ls=sp&u=anhanguera%7CFaculdades%20Anhanguera%20%28ANHANGUERA%29',relatede_course:'',field7:'CE',field8:'SP',field9:'-',field10:'-')
    Course.create(name:'Publicidade',ies:'Anhanguera',ies_full:'Anhanguera',city:'São José dos Campos',estagio:'estagio em comunicacao',about:'O curso de Publicidade e Propaganda forma profissionais especializados em campanhas e peças publicitárias. Durante as aulas, o estudante aprende a planejar, criar, produzir, difundir e gerenciar a comunicação publicitária, além de ações promocionais e de incentivo, identidade corporativa, eventos e patrocínio e atividades de marketing e assessoria.',mec_score:'4',course_grade:'https://www.anhanguera.com/graduacao/cursos/publicidade-e-propaganda.php',cep:'12236-660',lat:'',lng:'',field1:'publicitario',field2:'https://upload.wikimedia.org/wikipedia/pt/8/83/Anhanguera_Educacional_logo.png',field3:'593,33',field4:'400,5',field5:'4', field6:'https://querobolsa.com.br/busca-cursos/resultados?c=Publicidade%20e%20Propaganda&l=graduacao&lc=sao-jose-dos-campos&ls=sp&u=anhanguera%7CFaculdades%20Anhanguera%20%28ANHANGUERA%29',relatede_course:'',field7:'CH',field8:'SP',field9:'100%',field10:'-')


    courses = Course.where(ies: 'UNIP')
    for course in courses
      course.lat = '-23.255861'
      course.lng = '-45.9499927'
      course.save
    end
    courses = Course.where(ies: 'UNICHRISTUS')
    for course in courses
      course.lat = '-3.7342325'
      course.lng = '-38.4953481'
      course.save
    end
    courses = Course.where(ies: 'FBUNI')
    for course in courses
      course.lat = '-3.7364886'
      course.lng = '-38.4883957'
      course.save
    end


    courses = Course.where(ies: 'Anhanguera')
    for course in courses
      course.lat = '-23.259853'
      course.lng = '-45.9123172'
      course.save
    end

    render json: { data: Course.all }
  end
end
