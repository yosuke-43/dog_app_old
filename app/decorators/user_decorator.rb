class UserDecorator < Draper::Decorator
  delegate_all

  def user_san
    "#{object.name}さん"
  end

end
