# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Team.delete_all

Team.create(name: "ARSENAL", description: "ARSENAL FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/a/arsenal/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 34613288, channel: "arsenal") 

Team.create(name: "ASTON VILLA", description: "ASTON VILLA FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/a/aston-villa/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 27489253, channel: "aston")

Team.create(name: "BURNLEY", description: "BURNLEY FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/b/burnley/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 441309926, channel: "burnley")

Team.create(name: "CHELSEA", description: "CHELSEA FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/c/chelsea/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 22910295, channel: "chelsea")

Team.create(name: "CRYSTAL PALACE ", description: "CRYSTAL PALACE  FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/c/crystal-palace/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 85307509, channel: "crystal")

Team.create(name: "EVERTON", description: "EVERTON FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/e/everton/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 15891449, channel: "everton")

Team.create(name: "HULL CITY", description: "HULL CITY", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/h/hull/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 104450912, channel: "hull")

Team.create(name: "LEICESTER", description: "LEICESTER FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/l/leicester/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 122392884, channel: "leicester")

Team.create(name: "LIVERPOOL", description: "LIVERPOOL FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/l/liverpool/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 19583545, channel: "liverpool")

Team.create(name: "MANCHESTER CITY", description: "MANCHESTER CITY FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/m/man-city/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 14573900, channel: "man-city")

Team.create(name: "MANCHESTER UNITED", description: "MANCHESTER UNITED FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/m/man-utd/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 558797310, channel: "man-utd")

Team.create(name: "NEWCASTLE", description: "NEWCASTLE UNITED FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/n/newcastle/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 35758259, channel: "newcastle")

Team.create(name: "QUEENS PARK RANGERS", description: "QUEENS PARK RANGERS FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/q/qpr/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 71210107, channel: "qpr")

Team.create(name: "SOUTHAMPTON", description: "SOUTHAMPTON FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/southampton/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 46143892, channel: "southampton")

Team.create(name: "STOKE CITY", description: "STOKE CITY FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/stoke/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 44335177, channel: "stoke")

Team.create(name: "SUNDERLAND", description: "SUNDERLAND ASSOCIATION FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/sunderland/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 27844464, channel: "sunderland")

Team.create(name: "SWANSEA", description: "SWANSEA FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/swansea/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 472385266, channel: "swansea")

Team.create(name: "TOTTENHAM", description: "TOTTENHAM HOTSPUR FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/spurs/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 121402638, channel: "spurs")

Team.create(name: "WEST BROMWICH ", description: "WEST BROMWICH ALBION FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/w/west-brom/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 280412626, channel: "west-brom")

Team.create(name: "WEST HAM ", description: "WEST HAM UNITED FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/w/west-ham/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 156247074, channel: "west-ham")



