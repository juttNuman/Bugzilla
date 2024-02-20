class NotificationMailer < ApplicationMailer
    def new_project_assign_notification(user, project)
        @user = user
        @project=project
        mail(to: @user.email, subject: 'New Project Assign')
    end

    def update_project_notification(user, project)
        @user = user
        @project=project
        mail(to: @user.email, subject: 'Project update')
    end

    def new_bug_assign_notification(user, bug)
        @user = user
        @bug=bug
        mail(to: @user.email, subject: 'New Bug Assign')
    end

    def update_bug__notification(user, bug)
        @bug=bug
        @user = user
        mail(to: @user.email, subject: 'Bug updated')
    end

end

