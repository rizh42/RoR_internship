module Vaildation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, argument = nil)
      @validations ||= []
      @validations << [name, type, argument]
    end
  end

  module InstanceMethods
    def validate!(name, type, argument = nil)
      var = instance_variable_get("@#{name}")
      send "validate_#{type}", var, argument
    end

    def valid?
      self.class.validations.each do |validation|
        validation!(validation[0], validation[1], validation[2])
      end
      true
    rescue StandardError
      false
    end

    def validate_presence(var, _arg)
      raise 'Variable is nil!' if var.nil? || var.empty?
    end

    def validate_format(var, template)
      raise "Variable doesn't match the template" if var !~ template
    end

    def validate_type(var, type)
      raise "Variable doesn't match the type" if var.is_a? type
    end
  end
end
