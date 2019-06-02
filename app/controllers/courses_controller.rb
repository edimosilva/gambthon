require 'net/http'

class CoursesController < ApplicationController
  def catcho
    render json: Course.first, each_serializer: CourseSerializer
  end

  def myseed
    Course.create(name: 'Enfermagem', ies: 'UNICHRISTUS', city: 'Fortaleza', field1: 'enfermeiro', field2:'https://upload.wikimedia.org/wikipedia/commons/2/20/Logo_Unichristus.png', field3:'1339.60', field4: '669.80', field5:'4', field6:'https://querobolsa.com.br/unichristus-centro-universitario-christus/cursos/enfermagem', field7: 'CB', field8: 'CE', field9: '83%', field10: '-');

    Course.create(name: 'Marketing', ies: 'rep', city: 'São José', field1: 'nota 7');
    Course.create(name: 'Ciencias da Computação', ies: 'UNI', city: 'São José', field1: 'nota 9');
    Course.create(name: 'Sistemas de Informação', ies: 'FAC10', city: 'São José', field1: 'nota 8');
    Course.create(name: 'Design', ies: 'UNIQUERO', city: 'São José', field1: 'nota 8');
    Course.create(name: 'Direito', ies: 'QUEROUNI', city: 'São José', field1: 'nota 10');
    Course.create(name: 'Administração', ies: 'FAC100', city: 'São José', field1: 'nota 6');
    Course.create(name: 'Medicina', ies: 'UNI100', city: 'São José', field1: 'nota 5');
    Course.create(name: 'Psicologia', ies: 'FAC10', city: 'São José', field1: 'nota 9.5');
    Course.create(name: 'Engenharia Civil', ies: 'UNI_DUNI', city: 'São José', field1: 'nota 7.4');
    Course.create(name: 'Engenharia Elétrica', ies: 'UNI_DUNI_DE', city: 'São José', field1: 'nota 6.9');
    render json: { data: Course.all }
  end

  def get_all_ies
    render json: Course.all.pluck(:ies).uniq, each_serializer: IesSerializer
  end

  def get_course_by_name_and_ies
    course_name = params['name'];
    ies = params['ies'];
    course = Course.find_by(name: course_name, ies: ies);
    render json: course, each_serializer: CourseSerializer
  end

  def courses_by_ies
    ies_name = params['ies'];
    courses_by_ies = Course.where(ies: ies_name);
    render json: courses_by_ies, each_serializer: CoursesByIesSerializer
  end

  def deleteall
    Course.destroy_all
    render json: { data: Course.all }
  end

  def list
    render json: { data: Course.all }
  end
end
