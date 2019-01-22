require 'csv'


class CsvSeed
    def self.read_csv
        arr = []
        
        CSV.foreach("db/seedcontrol/test.csv") do |row|
            arr << row
        end

        arr
    end

    def self.makehash
        nhash = {}
        arr = self.read_csv
        arr.each do |line|
            if line[0] == arr[0][0]
                line.each do |col_name|
                    nhash[col_name.to_sym] = nil
                end            
            end
        end
        nhash
    end

    def self.csv_to_hash
        hashed = []
        toadd = {}
        int = 0
        arr = self.read_csv
        keys = self.makehash.keys
        arr.each do |line|
            if line != arr[0]
                toadd = {}
                int = line.length
                int.times do |i|
                    if keys[i] != :baserating && keys[i] != :height
                        toadd[keys[i]] = line[i]
                        # binding.pry
                    elsif keys[i] == :baserating
                        toadd[keys[i]] = rand(20..100)
                    elsif keys[i] == :height
                        toadd[keys[i]] = rand(155..215)
                    end
                end
                hashed << toadd
            end
        end
        hashed
    end
end


