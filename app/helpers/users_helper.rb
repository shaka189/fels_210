module UsersHelper
  def gravatar_for user, options = {size: Settings.gravatar}
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "gravatar")
  end

  def current_user? user
    user == current_user
  end
end
