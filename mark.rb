class Helper
    def e(a)
        a.gsub("%HC"){
            r = File.basename(filename, ".*")
            case File.extname(filename)
            when ".c", ".cpp"
                next r +".h"
            when ".h"
                next r + ".c"
            end
        }
    end
end