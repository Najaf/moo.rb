class String
    def uncapitalize 
      return '' if empty?
      self[0, 1].downcase + self[1..-1]
    end
end
