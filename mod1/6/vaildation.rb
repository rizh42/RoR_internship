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

    def validate_presence(var)
      raise 'Variable is nil!' if var.nil? || var.empty?
    end

    def validate_format(var, template)
      raise "Variable doesn't match the template" if var !~ template
    end

    def validate_type(var, type)
      raise "Variable doesn't match the type" if var.is_a? type
    end
  end

  module InstanceMethods
    def validate!(name, type, argument = nil)
      var = instance_variable_get("@#{name}")
      case type
      when :presence
        validate_presence(var)
      when :format
        validate_format(var, argument)
      when :type
        validate_type(var, argument)
      end
    end

    def valid?
      self.class.validations.each do |validation|
        validation!(validation[0], validation[1], validation[2])
      end
      true
    rescue StandardError
      false
    end
  end
end
