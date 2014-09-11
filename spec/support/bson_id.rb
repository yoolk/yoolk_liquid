module BSON
  class Id
    attr_reader :id

    def initialize(id)
      @id = id
    end

    def to_s
      id.to_s
    end
  end
end