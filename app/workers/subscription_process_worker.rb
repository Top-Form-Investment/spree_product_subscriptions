# Create sub order for subscribed orders
class SubscriptionProcessWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'subcription'
  
  def perform
    Spree::Subscription.eligible_for_subscription.find_in_batches do |batches|
      batches.map(&:process)
    end
  end

end