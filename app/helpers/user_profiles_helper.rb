module UserProfilesHelper
  def present_user_profile(profile)
    out = ""
    out << "#{profile.name}" if profile.name.present?
    out << "\n#{profile.address1}" if profile.address1.present?
    out << "\n#{profile.address2}" if profile.address2.present?
    out << "\n#{profile.city}, #{profile.state} #{profile.ZIP}"
    out << "\n#{profile.country}"

    out.gsub("\n", "<br>").html_safe
  end
end
