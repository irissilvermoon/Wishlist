module PurchasesHelper
  def disable_purchase_checkbox?(item)
    if item.purchased?
      item.purchased_by != current_user
    end
  end
end
