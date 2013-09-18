class CustomUserController < InheritedResources::Base
  protector_subject :custom_current_user
  defaults :resource_class => Dummy
end
