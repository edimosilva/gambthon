class AddMissingFields1 < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :field11, :string
    add_column :courses, :field12, :string
    add_column :courses, :field13, :string
    add_column :courses, :field14, :string
    add_column :courses, :field15, :string
    add_column :courses, :field16, :string
    add_column :courses, :field17, :string
    add_column :courses, :field18, :string
    add_column :courses, :field19, :string
    add_column :courses, :field20, :string
    add_column :courses, :ies_full, :string
    add_column :courses, :estagio, :string
    add_column :courses, :about, :string
    add_column :courses, :relatede_course, :string
    add_column :courses, :mec_score, :string
    add_column :courses, :course_grade, :string
    add_column :courses, :cep, :string
    add_column :courses, :lat, :string
    add_column :courses, :lng, :string
  end
end
