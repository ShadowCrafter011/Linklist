class LinkListController < ApplicationController
  before_action :authenticate_user!
  before_action :require_owned_list!, only: [ :show, :new_link, :create_link ]

  def new
    @link_list = current_user.link_lists.new
  end

  def create
    @link_list = current_user.link_lists.new(link_list_params)
    if @link_list.save
      flash.notice = "Link list created"
      redirect_to list_path(@link_list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy; end

  def new_link
    @link = @link_list.links.new
  end

  def create_link
    @link = @link_list.links.new(link_params)

    if @link.save
      flash.notice = "Link added to list \"#{@link.link_list.name}\""
      redirect_to list_path(@link.link_list)
    else
      render :new_link, status: :unprocessable_entity
    end
  end

  private
  def link_list_params
    params.require(:link_list).permit(:name)
  end

  def link_params
    params.require(:link).permit(:name, :link)
  end

  def require_owned_list!
    unless current_user.link_lists.exists? params[:link_list_id]
      flash.alert = "This list does not exist"
      return redirect_to root_path
    end

    @link_list = current_user.link_lists.find params[:link_list_id]
  end
end
