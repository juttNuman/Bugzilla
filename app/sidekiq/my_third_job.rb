class MyThirdJob
  include Sidekiq::Job

  def perform(user_id, bug_id)
    user = User.find(user_id)
    bug = Bug.find(bug_id)
    NotificationMailer.new_bug_assign_notification(user, bug).deliver_now
  end

end
