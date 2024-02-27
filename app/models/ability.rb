class Ability
  include CanCan::Ability

 def initialize(user)
 
  
   if user.manager?
    can :read, Project
    can :create, Project
    can :update, Project, creator_id: user.id
    can :destroy, Project, creator_id: user.id
    can :create, Collaboration
    can :destroy, Collaboration
    can :create, Bug
    can :read , Bug
   elsif user.qa?
    can :read, Project
    cannot :update, Project
    cannot :destroy, Project
    can :create, Bug
    cannot :create, Collaboration
    cannot :destroy, Collaboration
    can :read , Bug
   else
    can :read,Project
    cannot :update, Project
    cannot :destroy, Project
    cannot :edit,Project
    cannot :create,Bug
    can :edit_status, Bug, id: user.bugs.pluck(:id)
    can :read,Bug
    can :update,Bug
    can :assign ,Bug
   end

  end

  
end
 

