require 'protector'
require 'inherited_resources'
require 'active_support/all'

require "protector/inherited_resources/version"
require "protector/inherited_resources/instance_methods"
require "protector/inherited_resources/class_methods"

InheritedResources::BaseHelpers.send :include, Protector::InheritedResources::InstanceMethods
InheritedResources::ClassMethods.send :include, Protector::InheritedResources::ClassMethods