
class Gossip
    require 'csv'
    attr_accessor :author, :content

    def initialize (author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv<<[@author, @content]
        end
    end
    def self.all
        all_gossips = []
        CSV.foreach("./db/gossip.csv", "rb") do |row|
        author, content = row
        all_gossips << Gossip.new(author, content)
        end
       
        return all_gossips              
    end
end

