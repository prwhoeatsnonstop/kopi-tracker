class KopisController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  def index
  # test to see if we are at /parks/:id/rangers or /rangers
  if params.has_key?(:roast_id)
    # get all the rangers for a specific park
    @kopis = Kopi.where(roast_id: params[:roast_id] )
  else
    # get all rangers
    @kopis = Kopi.all
    @roasts = Roast.all
    @origins = Origin.all
  end
end

    def show
    # deal with the case that we are trying to get a kopi for a roast that doesn't exist
# RECHECK, LOGIC SEEMS TO BE WRONG
    @kopi = Kopi.find(params[:id])

    if params[:roast_id].to_i != @kopi.roast.id
      render plain: "Roast yet to be discovered!"
      # do something
    end
  end

  def new
    @roasts = Roast.all
    @origins = Origin.all
  end

  def create
    @kopi = Kopi.new(kopi_params)

    @kopi.save
    redirect_to @kopi
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def kopi_params
    params.require(:kopi).permit(:name, :roast_id, :origin_id)
  end

end