class KittensController < ApplicationController
    
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.xml { render xml: @kittens }
      format.json { render json: @kittens }
    end
  end
  
  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render xml: @kitten }
      format.json { render json: @kitten }
    end
  end
  
  def new
    @kitten = Kitten.new
  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = 'Yar kitten succesfully created'
      redirect_to @kitten
    else
      flash.now[:danger] = 'Yar kitten unsuccesfully not created'
      render :new
    end
  end
  
  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.save
      flash[:success] = "Yar kitten succesfully updated"
      @kitten.update_attributes(kitten_params)
      redirect_to @kitten
    else
      flash.now[:danger] = "Something gone wrong.Unsuccesfull update atempt!"
      render :edit
    end
  end
  
  def destroy
    @kitten = Kitten.find(params[:id]).destroy
    flash.now[:success] = 'Yar succesfully get rid of that kitten!'
    redirect_to root_url
  end
  
  private
  
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
    
end
