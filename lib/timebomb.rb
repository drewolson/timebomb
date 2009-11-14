require 'rubygems'
require 'timecop'

[:Given, :When, :Then].each do |method|
  self.send(method, /^(.+) (\d+) (seconds?|minutes?|hours?|days?|weeks?|months?|years?) (ago|from now)$/) do |string, number, time_unit, time_direction|
    Timecop.freeze(number.to_i.send(time_unit).send(time_direction.gsub(' ','_'))) do
      self.send(method, string)
    end
  end
end

