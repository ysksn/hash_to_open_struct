require 'ostruct'

module HashToOpenStruct
  def self.call(obj)
    case obj
    when Array
      obj.map { |v| call(v) }
    when Hash
      attrs = obj.each_with_object({}) do |(k, v), h|
                h[k] = call(v)
              end

      OpenStruct.new(attrs)
    else
      obj
    end
  end
end
