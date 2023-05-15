class Api::V1::StudentController < ApplicationController
  before_action :set_student

  def index
  end

  def show
    render json: { message: 'Student Data', data: @student.details }, status: 404
  end

  def other_info
    render json: { message: 'Student Data', data: @student.other_info }, status: 404
  end

  def info
    render json: { message: 'Student Data', data: @student.info }, status: 404
  end

  private

  def set_student
    @student = Student.find_by_id(params[:id])

    return if @student.present?

    render json: { message: 'Student not found' }, status: 404
  end
end
