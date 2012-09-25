Dir.glob('./lib/*.rb') {|file| require_relative File.basename(file) }
