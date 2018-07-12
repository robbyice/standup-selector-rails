class HostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  def index
    @hosts = Host.all
    render json: @hosts
  end

  def create
    @host = @host.nil? ? Host.new(host_params) : @host

        if @host.save
      head(200)
    else
      head(400)
    end
  end

  def update
    @host.update(host_params)
    head(200)
  end

  def show
    render json: @host
  end

  def destroy
    @host.delete
    head(200)
  end

  private
    def set_host
      #if id isnt found it throws an error and magically automatically does a 404...?
      @host = Host.find(params[:id])
    end

    def host_params
      params.require(:first_name)
      params.require(:last_name)

      params.permit(:first_name, :last_name)
    end
end
