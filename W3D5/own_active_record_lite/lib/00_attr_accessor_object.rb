class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) { instance_variable_get("@#{name}") }
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end
  end
end

# attr_accessor :title, :name
#
# def name
#   @name
# end
#
# def name=(value)
#   puts value
#   @name = value
# end
#
# Cat.new
#
# cat.name #@name
# cat.name = "hellokitty"
