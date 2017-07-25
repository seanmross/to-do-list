class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    item = Item.new(params.require(:item).permit(:description))

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
