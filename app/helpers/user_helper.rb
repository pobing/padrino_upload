# Helper methods defined here can be accessed in any controller or view in the application

PadrinoUpload::App.helpers do

  def sign_in(user)
    response.set_cookie('ticket', {:value => user.ticket, :path => "/", :expires => user.ticket_expires_at, :httponly => true})
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    # binding.pry
    @current_user ||= User.find_by(ticket: request.cookies["ticket"])
  end

  def sign_out
    current_user = nil
    request.cookies.delete("ticket")
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_in_user
    unless signed_in?
      json error: 1, message: "you haven't login "
    end
  end

end
