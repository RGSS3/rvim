require 'erb'

file = File.read(ARGV[0])

class Helper
    def get_binding
        binding
    end

    def filename
        ARGV[0]
    end

    def c_header_def(f = filename)
b = File.basename(filename).gsub(".", "_").upcase + "_"
%{#ifndef #{b}
#define #{b}

#endif}
    end
end

require_relative "mark.rb"

def init_erb(file)
    erb = ERB.new(file)
    erb
end

begin
h = Helper.new
b = h.get_binding
loop do
    g = init_erb(file).result(b)
    break if g == file 
    file = g
end
File.write(ARGV[0] + ".result", file)

rescue Exception
    File.write(ARGV[0] + ".result", $!.backtrace.unshift($!.to_s).join("\n"))
end