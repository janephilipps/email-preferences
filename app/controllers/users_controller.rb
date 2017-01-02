class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @tokens = Token.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    email_already_exists = email_already_exists?(params[:user][:email])
    if email_already_exists
      redirect_to action: 'new'
    else
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # POST /tokens
  # POST /tokens.json
  def create_token
    @user = User.find(params[:id])
    @token = Token.generate(@user)

    # Save token to DB
    respond_to do |format|
      if @token.save
        format.html { redirect_to @token, notice: 'Token was successfully created.' }
        format.json { render :show, status: :created, location: @token }
      else
        format.html { render :new }
        format.json { render json: @token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    updated_user = user_params

    if params[:user][:do_not_email] == '1'
      updated_user[:marketing] = '0'
      updated_user[:articles] = '0'
      updated_user[:digest] = '0'
    end

    user = Token.consume(params[:user][:nonce])

    if user == nil or user.id.to_s != params[:id] or params[:user][:url_email] != user.email
      flash[:alert] = 'Access denied!'
      redirect_to action: 'edit'
      return
    elsif user.email != params[:user][:email]
      email_already_exists = email_already_exists?(params[:user][:email])
      if email_already_exists
        flash[:alert] = 'A user with that email address already exists!'
        redirect_to action: 'edit'
        return
      end
    else
      respond_to do |format|
        if @user.update(updated_user)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :do_not_email, :marketing, :articles, :digest)
    end

    # Check if a user is trying to create or edit with an email that is already in use
    def email_already_exists?(email)
      if User.exists?(email: email)
        flash[:alert] = 'A user with that email address already exists!'
        return flash
      end
    end
end
