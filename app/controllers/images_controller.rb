class ImagesController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show] 



 def index
    @images = Image.all
  end

  def new
  	@image = Image.new
	end

  
  def create
	@image = current_user.images.build(image_params)


    if @image.save
      flash[:notice] = "Resim Kaydedildi."
    else
     flash[:notice] = "Bilinmeyen Bir Nedenle, Resminiz Kaydedilemedi."
      render 'new'
  end



  end






  def destroy
  end




  private

def image_params

	params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
	
end


def postimg_params

  params.require(:image).permit(:image, :category_id, :post_id)


  
end



end
