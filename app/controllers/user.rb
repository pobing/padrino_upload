PadrinoUpload::App.controllers :user do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index do
    @name="jdd"
    @users = User.all
    render 'user/index'
  end

  get :new do
    render 'user/new'
  end

  post :create do
   logger.info "ppp #{params}"
   user = User.new(:name=>params[:name], :age=>params[:age],:email=>params[:email])
   if user.save
    redirect url(:user, :index)
   end
  end

end
