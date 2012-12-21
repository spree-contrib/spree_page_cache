module Spree
  AnalyticsHelper.module_eval do
    def completed_analytics_tags
      commerce_tracking_present = JSON.parse(cookies[:flash])['commerce_tracking'] rescue false

      return {} unless commerce_tracking_present && @order && @order.complete?
      { :confirm => { :orderid => @order.number,
          :total => @order.total,
          :shipping => @order.ship_total,
          :tax => @order.tax_total,
          :discount => @order.adjustment_total,
          :subtotal => @order.item_total,
          :products => products_for_order }
      }
    end
  end
end
