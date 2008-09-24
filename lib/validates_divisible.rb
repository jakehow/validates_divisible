# ValidatesDivisible
module ValidatesDivisible
  def validates_divisible(*attr_names)
    configuration = { 
        :message => "was not a multiple." 
      }
    configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
    validates_each attr_names do |m, a, v| 
      m.errors.add(a, configuration[:message]) if m.send(a) % configuration[:by] != 0
    end
  end
end