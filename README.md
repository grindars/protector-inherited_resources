# Protector::InheritedResources

Integrates [Protector](https://github.com/inossidabile/protector) and [Inherited Resources](https://github.com/josevalim/inherited_resources.git).

With this gem installed, Inherited Resources will automatically restrict collections and resources with `current_user`.

## Installation

Add this line to your application's Gemfile:

    gem 'protector-inherited_resources'

And then execute:

    $ bundle

## Example

No changes to controller code are required if `current_user` should be used to restrict models. However, if it's necessary to change that behavior, you can use `protector_subject` method:

```ruby
class FoosController < InheritedResources::Base
  protector_subject :current_admin_user
  # or
  protector_subject { User.first }
  # or, to disable integration entirely,
  protector_subject false
```

## Maintainers

* Sergey Gridasov (@grindars)

## License

It is free software, and may be redistributed under the terms of MIT license.
