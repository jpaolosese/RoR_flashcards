class DecksController < ApplicationController
  before_action :set_deck, only: %i[ show edit update destroy ]

  # GET /decks or /decks.json
  def index
    @decks = Deck.where(user_id: params[:user_id]).all
  end

  # GET /decks/1 or /decks/1.json
  def show
    @deck = Deck.where(user_id: params[:user_id], id: params[:id]).first
  end

  # GET /decks/new
  def new
    @deck = Deck.create
  end

  # GET /decks/1/edit
  def edit

  end

  # POST /decks or /decks.json
  def create
    d_params = deck_params
    d_params[:card_count] = 0
    d_params[:user_id] = @current_user
    @deck = Deck.new(deck_params)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to user_decks_url, notice: "Deck was successfully created." }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1 or /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to user_decks_url(@deck), notice: "Deck was successfully updated." }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1 or /decks/1.json
  def destroy
    @deck.destroy

    respond_to do |format|
      format.html { redirect_to user_decks_url, notice: "Deck was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_params
      params.require(:deck).permit(:topic, :card_count, :user_id)
    end
end
