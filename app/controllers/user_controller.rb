class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    pw = Digest::MD5.hexdigest(params[:password])
    User.create(
      email: params[:email],
      password: pw
    )
    redirect_to '/user/login'
  end

  def login
  end

  def login_process
    pw = Digest::MD5.hexdigest(params[:password])
    user = User.find_by(email: params[:email])
    if user
      if user.password == pw
        session[:user_id] = user.id
        flash[:notice] = '성공적으로 로그인 되었습니다.'
        redirect_to '/'
      else
        flash[:alert] = '비밀번호가 틀렸습니다.'
        redirect_to '/user/login'
      end
    else
      flash[:alert] = '존재하지 않는 이메일입니다.'
      redirect_to '/user/new'
    end
  end

  def logout
    session.clear
    flash[:notice] = '로그아웃되었습니다.'
    redirect_to '/'
  end
  
  def note
  end
end
