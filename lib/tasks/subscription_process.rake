namespace :subscription do
  desc "process all subscriptions whom orders are to be created"
  task process: :environment do |t, args|
    SubscriptionProcessWorker.perform_async
  end
end
