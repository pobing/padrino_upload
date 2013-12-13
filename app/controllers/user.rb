PadrinoUpload::App.controllers :user do
  before do
    sign_in_user
  end

  get :index do
    # binding.pry
    @name="jdd"
    @users = User.all
    render 'user/index'
  end

  get :new do
    render 'user/new'
  end

  post :create do
    user = User.new(:name=>params[:name], :age=>params[:age],:email=>params[:email],:image=>params[:file])
    if user.save
     redirect url(:user, :index)
    end
  end

  delete :user, :map=>"/user/:id" do
    # binding.pry
    user = User.find params[:id]
    user.destroy
    redirect url(:user, :index)
  end

  get :auth, :map => '/auth/:provider/callback' do
    auth    = request.env["omniauth.auth"]
    account = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
              User.create_with_omniauth(auth)
    set_current_account(account)
    redirect "http://" + request.env["HTTP_HOST"] + url(:profile)
  end
end
