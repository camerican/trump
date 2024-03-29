# Operation Trump

This site is an experimental viral web campaign built in Ruby on a Sinatra framework.

## Setup

To get up and running with the project, you can set up your local database as follows:

```
#run migration
bundle exec rake db:migrate 
#generate seed file
ruby data.read.rb #generate
#load seed data
ruby seeds.rb
```

## Page Layout

| Page | Route | ERB |
| --- | --- | --- |
| Welcome | / | index.erb |
| Hall of Losers | /hall | hall.erb |
| Job Creator | /jobs | jobs.erb |
| Classy Quotes | /quotes | quotes.erb |
| Team | /team | team.erb |

## Database Schema

### organizations Table
| field | type |
| --- | --- |
| name | string |
| location_id | integer |
| type | integer |

### locations Table
| field | type |
| --- | --- |
| name | string |
| geo_x | float |
| geo_y | float |

### positions Table
| field | type |
| --- | --- |
| name | string |

### organization_positions Table
| field | type |
| --- | --- |
| organization_id | integer |
| position_id | integer |
| start | datetime |
| end | datetime |
