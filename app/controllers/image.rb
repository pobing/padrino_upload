PadrinoUpload::App.controllers do

  post '/image' do 
    image = Image.new
    image.name = params[:file][:filename]
    image.mime_type = params[:file][:type]
    image.size = params[:file][:tempfile].size
    image.file = params[:file]
    status 201
    json id: image.id if image.save
  end

  get '/image' do
    render 'image/new'
  end

  get '/image/:id' do 
    image = Image.find_by(id: params[:id])
    halt 404 if image.nil?
    # params[:type] type normal,thumb,small...
    url = if params[:type]
          type = params[:type].to_sym
          image.file.url(type)
          else
            image.file.url
          end
    json url: url
  end
  
  delete '/image/:id' do 
    image = Image.find params[:id]
    image.remove_file! # remove image file first
    image.destroy
    status 204
  end

end