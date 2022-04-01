class ShortLinksController < ApplicationController
  before_action :set_short_link, only: %i[ show destroy ]

  # GET /short_links or /short_links.json
  def index
    @short_links = ShortLink.all
    @short_link = ShortLink.new
  end

  # GET /short_links/1 or /short_links/1.json
  def show
  end

  # GET /short_links/new
  # def new
  #   @short_link = ShortLink.new
  # end

  # GET /short_links/1/edit
  # def edit
  # end

  # POST /short_links or /short_links.json
  def create
    @short_link = ShortLink.new(short_link_params)

    respond_to do |format|
      if @short_link.save
        # Build a two-element hash with full and shortened URL of the user's last shortening.
        # Don't store the full @short_link to reduce the amount of data passed in session.
        # In this app, the amount of extra data is negligible, but in a prod app with a million users,
        # it could add significant overhead. Seems like good practice.
        users_last_short_link = { full_url: @short_link["full_url"], short_link: @short_link.short_link }

        # Store the users_last_short_link hash in the :shortened_link key to use back in the the index 
        session[:shortened_link] = users_last_short_link

        # Redirect back to the root_path (short_links#index)
        format.html { redirect_to root_path, notice: "Short link was successfully created." }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @short_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /short_links/1 or /short_links/1.json
  def destroy
    @short_link.destroy

    respond_to do |format|
      format.html { redirect_to short_links_url, notice: "Short link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_link
      @short_link = ShortLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def short_link_params
      params.require(:short_link).permit(:full_url, :short_link)
    end
end
