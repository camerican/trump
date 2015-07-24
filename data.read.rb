require 'fileutils'
require 'date'

f = File.new ('./raw.data.txt')
a = f.readlines
buffer = ""
a.each do | line | 
  p = line.split('\t')
  pos = p[4].split(/[&\/]/).each { |m| m.strip }
  srt = p[5].split(/[&\/]/).each { |m| m.strip }

  loc_id = Location.find_by( p[2] )

  buffer += "Organization.create(id: #{p[0]}, name: #{p[1]}, location_id: #{loc_id}, type: Organization.#{p[3]})\n"
  i = 0
  last_good = 0
  loc_start = nil
  pos.each do | position |
    if !str[i].nil?
      loc_start = str[i]
      last_good = i
    else
      loc_start = str[last_good]
    end

    buffer += "OrganizationPosition.create(organization_id: #{p[0]}, location_id: #{loc_id}, start: \"#{loc_start}\".to_date)" 
    i+=1
  end
end
f.close

o = File.new ('./seeds2.rb', 'w+')
o.write buffer
o.close