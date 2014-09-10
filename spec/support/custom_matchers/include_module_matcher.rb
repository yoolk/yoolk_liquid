# Usage:
#
#     describe Post do
#       it { should include_module(Commentable) }
#     end

RSpec::Matchers.define :include_module do |expected|

  match do |actual|
    expected.in? actual.class.included_modules
  end

  description do
    "include module #{expected}"
  end

  failure_message do |actual|
    "Expected to include #{expected} but was not included"
  end

  failure_message_when_negated do |actual|
    "Did not expect to include #{expected}"
  end
end