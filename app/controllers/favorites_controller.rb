class FavoritesController < ApplicationController
 #redirect_toを使用せず非同期でページをレンダリングすること
  def create
    @favorite = current_user.favorites.create(blog_id: params[:blog_id])
    @blog = @favorite.blog
    respond_to do |format|
      format.html { redirecto_to :blogs }
      format.js {render :index }
    end 
  end

 #redirect_toを使用せず非同期でページをレンダリングすること
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @blog = @favorite.blog
    @favorite.destroy if @favorite
    respond_to do |format|
      format.html { redirecto_to :blogs }
      format.js  {render :index }
    end  
  end
end
