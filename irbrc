# amazing print
begin
#  require "amazing_print"
 # AmazingPrint.irb!
rescue LoadError => err
  #warn "Couldn't load awesome_print: #{err}"
end

# Random time generator
class Time
  def self.random(from=Time.at(0), to=Time.now)
    Time.at rand(to.to_f - from.to_f) + from.to_f
  end
end
