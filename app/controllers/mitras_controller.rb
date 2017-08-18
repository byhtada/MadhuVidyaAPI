class MitrasController < ApplicationController
  before_action :set_mitra,                     only: [:show, :update]
  before_filter :authenticate_user_from_token,  except: [:create]

  def show
    render json: {mitra:  @mitra}
  end

  def update

    case params[:skill_to_up]

      when 'mantra'
        render json: {error: 1}

      when "kirtan"
        render json: {error: 1}

      else
        print('It is not a string')
    end
  end

  def index
    @mitras = Mitra.all
    render json: @mitras
  end

  def create
    @mitra = Mitra.new(mitra_params)
    if @mitra.save
      render json: @mitra, status: :created, location: @mitra
    else
      render json: @mitra.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @mitra.destroy
  end

  private
  def mitra_params
    params.require(:mitra).permit(:name, :password, :email)
  end

  def set_mitra
    @mitra = Mitra.find(params[:id])
  end
end
