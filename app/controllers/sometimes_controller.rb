class SometimesController < ApplicationController
  before_action :set_sometime, only: %i[ show edit update destroy ]

  # GET /sometimes or /sometimes.json
  def index
    @sometimes = Sometime.all
  end

  # GET /sometimes/1 or /sometimes/1.json
  def show
  end

  # GET /sometimes/new
  def new
    @sometime = Sometime.new
  end

  # GET /sometimes/1/edit
  def edit
  end

  # POST /sometimes or /sometimes.json
  def create
    @sometime = Sometime.new(sometime_params)

    respond_to do |format|
      if @sometime.save
        format.html { redirect_to sometime_url(@sometime), notice: "Sometime was successfully created." }
        format.json { render :show, status: :created, location: @sometime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sometime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sometimes/1 or /sometimes/1.json
  def update
    respond_to do |format|
      if @sometime.update(sometime_params)
        format.html { redirect_to sometime_url(@sometime), notice: "Sometime was successfully updated." }
        format.json { render :show, status: :ok, location: @sometime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sometime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sometimes/1 or /sometimes/1.json
  def destroy
    @sometime.destroy!

    respond_to do |format|
      format.html { redirect_to sometimes_url, notice: "Sometime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sometime
      @sometime = Sometime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sometime_params
      params.require(:sometime).permit(:trip_id, :name, :completed)
    end
end
