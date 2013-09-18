class OptoutController < InheritedResources::Base
  protector_subject nil
  defaults :resource_class => Dummy
end
