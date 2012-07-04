class PicturesController < ApplicationController

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.create( params[:picture] )
                if @picture.save
                        flash.now[:success] = "Image Uploaded"
                        redirect_to @picture
                else
                        render 'new'
                end 
	end

	def index
		@pictures = Picture.all
	end
	
	def show
		@picture = Picture.find(params[:id])
		#send_data @picture.photo, :type => 'image/jpg', :disposition => 'inline'
	end

	def destroy
                Picture.find(params[:id]).destroy
                flash.now[:success] = "Image Deleted."
                redirect_to pictures_path
        end

	def showbytag
		@pictures = Picture.all
		@tags = []
		@split_tags = []
		@pictures.each do |picture|
			@split_tags = (picture.tag).split(" ")
			#if picture.tag != ''
				#@tags.push(picture.tag)
			@split_tags.each do |t|
				@tags.push(t)
			end
		end	
		@tags = @tags.uniq
	end

	def displaybytag
		@pictures = Picture.all
		@tag = params[:tag]
	end
end
