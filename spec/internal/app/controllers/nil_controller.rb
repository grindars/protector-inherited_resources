class NilController < InheritedResources::Base
  protector_subject :nil_current_user
  defaults :resource_class => Dummy
end
