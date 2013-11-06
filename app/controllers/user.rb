PadrinoUpload::App.controllers :user do
  
  get :index do
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
    binding.pry
    user = User.find params[:id]
    user.destroy
    redirect url(:user, :index)
  end

end
