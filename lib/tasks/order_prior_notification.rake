namespace :subscription do
  desc "send prior notification for replenishment items"
  task prior_notify: :environment do |t, args|
    PriorNotificationWorker.perform_async
  end
end

