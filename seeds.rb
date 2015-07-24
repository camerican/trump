require './main'
require 'date'

def usParse string
  string
end

Location.create(id: 1, name: "New York, NY")
Location.create(id: 2, name: "South Carolina")
Location.create(id: 3, name: "Atlantic City, NJ")
Location.create(id: 4, name: "Bermuda")
Location.create(id: 5, name: "Palm Beach, Florida")
Location.create(id: 6, name: "Waterbury, CT")
Location.create(id: 7, name: "St. Martin, French West India")
Location.create(id: 8, name: "Turnberry, Scotland")
Location.create(id: 9, name: "Brazil")
Location.create(id: 10, name: "British Columbia (Canada)")
Location.create(id: 11, name: "Doonbeg, Ireland")

Position.create(id: 1, name: "President")
Position.create(id: 2, name: "Director")
Position.create(id: 3, name: "Secretary")
Position.create(id: 4, name: "Chairman")
Position.create(id: 5, name: "Treasurer")
Position.create(id: 6, name: "Secretary")
Position.create(id: 7, name: "Member")
Position.create(id: 8, name: "Vice President")
Position.create(id: 9, name: "Partner")


Organization.create(id: 1, name:"4 Shadow Tree Lane LLC", location_id: 1, type: Organization.LLC)
Organization.create(id: 2, name:"4 Shadow Tree Lane Member Corp", location_id: 2, type: Organization.Corporation)

OrganizationPosition.create(organization_id:1,position_id:1,start: Date.strptime("9/26/12", "%m/%d/%y"))
OrganizationPosition.create(organization_id:2,position_id:1,start: Date.strptime("9/26/12", "%m/%d/%y"))
OrganizationPosition.create(organization_id:2,position_id:2,start: Date.strptime("9/26/12", "%m/%d/%y"))
OrganizationPosition.create(organization_id:2,position_id:4,start: Date.strptime("9/26/12", "%m/%d/%y"))

