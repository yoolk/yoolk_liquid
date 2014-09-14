# RSpec matcher for alias_method.
# https://gist.github.com/1950961
# Usage:
#
#     describe User do
#       it { should alias_from(:username).to(:email) }
#     end


RSpec::Matchers.define :alias_from do |alias_method|
  match do |subject|
    begin
      subject.send(alias_method)
    rescue NoMethodError
      raise "expected alias_method from #{alias_method} to #{@original_method} but #{alias_method} is not defined"
    end

    expect(subject.method(alias_method)).to eq(subject.method(@original_method))
  end

  description do
    "RSpec matcher for alias_method"
  end

  failure_message do |text|
    "expected alias_method from #{alias_method} to #{@original_method}"
  end

  failure_message_when_negated do |text|
    "do not expected alias_method from #{alias_method} to #{@original_method}"
  end

  chain(:to) { |original_method| @original_method = original_method }
end