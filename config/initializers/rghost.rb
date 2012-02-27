require 'rghost'
require 'image_size'

if RUBY_PLATFORM.downcase.include?("mswin")
  RGhost::Config::GS[:path] = 'C:\\Program Files (x86)\\gs\\gs9.05\\bin\\gswin32c.exe'
else
  RGhost::Config::GS[:path] = '/usr/local/bin/gs'
end