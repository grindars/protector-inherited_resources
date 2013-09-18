module Protector::InheritedResources
  module ClassMethods
    def protector_subject(subject)
      subject = false if subject.nil?
      @protector_subject = subject
    end

    def effective_protector_subject
      return @protector_subject unless @protector_subject.nil?
      
      if superclass.respond_to? :effective_protector_subject
        superclass.effective_protector_subject
      else
        :current_user
      end
    end
  end
end
