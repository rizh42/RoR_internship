module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      @history = {}
      names.each do |name|
        var_name = "@#{name}".to_sym

        define_method(name) { @history[name] }

        define_method("#{name}=".to_sym) do |value|
          history[name] << value
          instance_variable_set(var_name, value)
        end
        define_method ("#{name}_history") do
          @history[name]
        end
      end
    end

    def strong_attr_accessor(name, type)
      define_method(name) { instance_variable_get(name) }

      define_method("#{name}=".to_sym) do |value|
        raise 'Wrong type of variable!' if type != value.type
        instance_variable_set(name, value)
      end
    end
  end
end
