class MySecondJob
  include Sidekiq::Job

  def perform(user_id, project_id)
    user = User.find(user_id)
    project = Project.find(project_id)
    NotificationMailer.update_project_notification(user, project).deliver_now
  end

end
