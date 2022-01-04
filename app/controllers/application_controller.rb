class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #ログインしていないユーザーをログインページの画面に促す
  before_action :configure_permitted_parameters, if: :devise_controller?
  #nameカラムの保存を可能とする記述
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
    #devise_parameter_sanitizerメソッドを使うことで設定されているにストロングパラメーター対して、新たなパラメーターを追加することができる。
  end
end
