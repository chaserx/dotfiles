require 'irb/completion'
require 'irb/ext/save-history'

# awesome print
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

# irb history
ARGV.concat [ "--readline", "--prompt-mode", "simple" ]
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

# Random time generator
class Time
  def self.random(from=Time.at(0), to=Time.now)
    Time.at rand(to.to_f - from.to_f) + from.to_f
  end
end
