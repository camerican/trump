require 'fileutils'
require 'date'
require './main'

f = File.new ('./raw.data.txt')
a = f.readlines
buffer = "require './main'\nrequire 'date'\n\n"
a.each do | line | 
  #p[0] organization.id
  #p[1] organization.name
  #p[2] location.name
  #p[3] organization.category
  #p[4] position.name
  #p[5] organization_position.start
  #p[6] organiation_position.end

  p = line.split(/\t/)
  pos = p[4].split(/[&\/]/).each { |m| m.strip! } if p[4]
  strt = p[5].split(/[&]/).each { |m| m.strip! } if p[5]

  loc = Location.find_by( name: p[2] )
  loc_id = loc.id if loc
  loc_id ||= "nil"

  buffer += "Organization.create(id: #{p[0]}, name: \"#{p[1]}\", location_id: #{loc_id}, category: \"#{p[3]}\")\n"
  i = 0
  last_good = 0
  loc_start = nil
  pos.each do | position |
    if !strt[i].nil?
      loc_start = strt[i]
      last_good = i
    else
      loc_start = strt[last_good]
    end
    loc_pos = Position.find_by(name: position)
    loc_pos_id = loc_pos.id if loc_pos
    loc_pos_id ||= "nil"


    #date parsing hack: http://stackoverflow.com/questions/17563048/parse-a-date-in-rails
    format_str = "%m/%d/" + (loc_start =~ /\d{4}/ ? "%Y" : "%y")
    date = Date.parse(loc_start) rescue Date.strptime(loc_start, format_str)

    p "OrganizationPosition.create(organization_id: #{p[0]}, position_id: #{loc_pos_id}, start: \"#{date}\")\n" 


    buffer += "OrganizationPosition.create(organization_id: #{p[0]}, position_id: #{loc_pos_id}, start: \"#{date}\")\n" 
    i+=1
  end if pos.kind_of?(Array)
end
f.close

o = File.new("./seeds2.rb", "w+")
o.write buffer
o.close