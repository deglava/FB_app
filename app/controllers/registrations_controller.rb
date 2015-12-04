class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:Fname,:Lname, :gender, :DOB, :email, :about, :address, :fav_quotes,:password,
                                 :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:image, :Fname,:Lname, :gender, :DOB, :email, :About,:Address, :Fav_quotes,:password,
                                 :password_confirmation, :current_password)
  end
end