class Api::V1::DesignationsController < Api::V1::BaseController
  def index
    object = perform(sanity_params)
    render json: object
  end

  private

  def perform(arg)
    arg = sanity_params
    fields = arg[:fields].to_h
    case arg[:action]
    when 'create'
      Designation.create(fields)
    when 'update'
      obj = Designation.find_by_id(fields['id'])
      obj.update(fields)
      obj
    when 'destroy'
      obj = Designation.find_by_id(fields['id'])
      obj.destroy
    when 'where'
      Designation.where(fields)
    end
  rescue StandardError => e
    { error: e.to_s }
  end

  def sanity_params
    params.require(:payload).permit(:action, fields: [:name, :id])
  end
end
