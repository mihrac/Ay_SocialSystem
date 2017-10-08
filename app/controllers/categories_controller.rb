class CategoriesController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show] 
  
  def new
    if current_user.admin?
    @category = Category.new
  else
    flash[:notice] = "Hobbaa! Yetkiler aşılıyor Albayım!"
    redirect_to root_path

  end
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if current_user.admin?

    if @category.save
      flash[:notice] = "Kategoriniz Kaydedildi."
    else
     flash[:notice] = "Bilinmeyen Bir Nedenle, Kategoriniz Kaydedilemedi."
      render 'new'
    end

  else
    flash[:notice] = "Hobbaa! Yetkiler aşılıyor Albayım!"
    redirect_to root_path
  end

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
 
 if current_user.admin?

  if @category.update(category_params)
    flash.now[:alert] = "kaydettik"
    redirect_to @category
  else
    flash.now[:alert] = "Yanlış giden bir şeyler var başkan! Kaydedemedik"
    render :edit
  end

else
  flash.now[:alert] = "Oooo birileri yetkileri aşmaya çalışıyor Albayım!"

end

 
  end




  def destroy
  end

  def show
  end



  private

def category_params

  params.require(:category).permit(:name, :catrole)
  
end

end
