require 'ostruct'

module HashToOpenStruct
  def self.call(obj)
    case obj
    when Array
      obj.map { |v| call(v) }
    when Hash
      obj.each { |k, v| obj[k] = call(v) }
      OpenStruct.new(obj)
    else
      obj
    end
  end
end
