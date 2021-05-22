# -*- encoding:  utf-8 -*-
$KCODE = "u" unless defined?(Encoding)
require "rubygems"
require "irb/ext/save-history"
begin
  require("awesome_print")
  AwesomePrint.irb!
rescue LoadError
end

#History configuration
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf.merge! :PROMPT_MODE  => :SIMPLE, :AUTO_INDENT  => true

alias q exit
