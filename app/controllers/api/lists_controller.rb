class Api::ListsController < ApiController
  before_action :authenticated?
  before_action :get_user, except: [:index]

  def index
    lists = List.all
    render json: lists, each_serializer: ListSerializer
  end

  def show
    list = @user.lists.find(params[:id])
    render json: list, each_serializer: ListSerializer
  end

  def create
    list = @user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
   list = @user.lists.find(params[:id])
   if list.update(list_params)
     render json: list
   else
     render json: { errors: list.errors }, status: :unprocessable_entity
   end
  end

  def destroy
    begin
      list = @user.lists.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :private)
  end

  def get_user
    @user = User.find params[:user_id]
  end

end
