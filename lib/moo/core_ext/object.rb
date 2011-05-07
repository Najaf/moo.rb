class Object
  def complain_if_not_a(klass, error = ArgumentError)
    unless self.is_a? klass
      raise error, "Expected instance of '#{klass.to_s}', got a '#{self.class}'"
    end
  end
end
