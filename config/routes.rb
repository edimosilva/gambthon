Rails.application.routes.draw do
  get 'myseed', to: 'courses#myseed'
  get 'delete_all', to: 'courses#deleteall'
  get 'courses', to: 'courses#list'
  get 'courses_by_ies', to: 'courses#courses_by_ies'
  get 'get_all_ies', to: 'courses#get_all_ies'
  get 'get_course_by_name_and_ies', to: 'courses#get_course_by_name_and_ies'
  get 'catcho', to: 'courses#catcho'
end
