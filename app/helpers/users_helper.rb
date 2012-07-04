module UsersHelper
 # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 10 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar",:height => '40', :width => '40')
  end
end
