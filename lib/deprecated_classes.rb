require 'xing'
require 'active_support/deprecation'

Xing::DEPRECATED_CLASSES = {
  'HypermediaJSONMapper'      => 'Xing::Mappers::Base',
  'BaseSerializer'            => 'Xing::Serializers::Base',
  'ResourcesSerializer'       => 'Xing::Serializers::RootResources',
  'JsonTreeLister'            => 'Xing::Services::JsonTreeLister',
  'ActiveModelErrorConverter' => 'Xing::Services::ErrorConverter'
}


Xing::DEPRECATED_CLASSES.each do |old, new|

  # with great power comes great responsibility
  Object.const_set(old, ActiveSupport::Deprecation::DeprecatedConstantProxy.new(old, new))
end
