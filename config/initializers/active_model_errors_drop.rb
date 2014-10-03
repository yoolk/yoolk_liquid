class ActiveModel::ErrorsDrop < ::Liquid::Drop
  def initialize(errors)
    @errors = errors
  end

  def size
    @errors.size
  end

  def each
    @errors.keys.map(&:to_s).each { |item| yield item }
  end

  def messages
    @errors.messages.stringify_keys
  end
end