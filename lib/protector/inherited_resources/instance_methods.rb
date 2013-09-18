module Protector::InheritedResources
  module InstanceMethods
    extend ActiveSupport::Concern

    included do
      alias_method_chain :end_of_association_chain, :protector
    end

    private

    def end_of_association_chain_with_protector
      resource = end_of_association_chain_without_protector
      
      subject = self.class.effective_protector_subject
      
      if subject.kind_of? Symbol
        subject = send subject
      elsif subject
        subject = instance_exec &subject
      end

      if subject && resource.respond_to?(:restrict!)
        resource.restrict! subject
      else
        resource
      end
    end
  end
end
