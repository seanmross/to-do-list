class Api::ItemsController < ApiController
  before_action :authenticated?
  before_action :get_list

  def index
    items = @list.items
    render json: items, each_serializer: ItemSerializer
  end

  def create
    item = @list.items.build(item_params)

    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = @list.items.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:description, :completed)
  end

  def get_list
    @list = List.find(params[:list_id])
  end

end
