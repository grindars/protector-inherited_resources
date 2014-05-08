class Dummy < ActiveRecord::Base
  protect do |current_user|
    unless current_user.nil?
      can :read
      can :create
      can :update
      can :destroy
    end
  end
end
