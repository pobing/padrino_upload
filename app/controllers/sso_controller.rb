PadrinoUpload::App.controllers :sso do

  get :new do
    render "sso/new"
  end

  post :signup do
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.save
    json error: 0, message: "success"
  end

  get :login do
    render "sso/login"
  end

  post :signin do
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      sign_in(user)
      user.last_signin_at = Time.now
      json user: user.email
    else
      json error: 1, message: "Invilid email or password"
    end
  end

  get :signout do
    sign_out
    redirect url(:sso, :new)
  end

end