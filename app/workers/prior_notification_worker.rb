# Create sub order for subscribed orders
class PriorNotificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'subcription'
  
  def perform
    Spree::Subscription.eligible_for_prior_notification.find_in_batches do |batches|
      batches.map(&:send_prior_notification)
    end
  end
end