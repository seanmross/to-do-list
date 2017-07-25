class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    list = List.new(params.require(:list).permit(:name, :private))

    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
