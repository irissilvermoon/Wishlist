module WishListsHelper
  def can_edit_wish_list?
    @user == current_user
  end
end
