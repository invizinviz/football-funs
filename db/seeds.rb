# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.delete_all

Team.create(name: "ARSENAL", description: "ARSENAL FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/a/arsenal/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 34613288, channel: "arsenal", twitter: "arsenal") 

Team.create(name: "ASTON VILLA", description: "ASTON VILLA FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/a/aston-villa/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 27489253, channel: "aston", twitter: "AVFCOfficial", instagram_id: 1392032629)

Team.create(name: "BURNLEY", description: "BURNLEY FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/b/burnley/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 441309926, channel: "burnley", twitter: "BurnleyOfficial")

Team.create(name: "CHELSEA", description: "CHELSEA FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/c/chelsea/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 22910295, channel: "chelsea", twitter: "ChelseaFC")

Team.create(name: "CRYSTAL PALACE ", description: "CRYSTAL PALACE  FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/c/crystal-palace/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 85307509, channel: "crystal", twitter: "CPFC")

Team.create(name: "EVERTON", description: "EVERTON FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/e/everton/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 15891449, channel: "everton", twitter: "Everton")

Team.create(name: "HULL CITY", description: "HULL CITY", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/h/hull/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 104450912, channel: "hull", twitter: "HullCity")

Team.create(name: "LEICESTER", description: "LEICESTER FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/l/leicester/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 122392884, channel: "leicester", twitter: "OfficialFOXES")

Team.create(name: "LIVERPOOL", description: "LIVERPOOL FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/l/liverpool/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 19583545, channel: "liverpool", twitter: "LFC")

Team.create(name: "MANCHESTER CITY", description: "MANCHESTER CITY FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/m/man-city/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 14573900, channel: "man-city", twitter: "MCFC")

Team.create(name: "MANCHESTER UNITED", description: "MANCHESTER UNITED FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/m/man-utd/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 558797310, channel: "man-utd", twitter: "ManUtd")

Team.create(name: "NEWCASTLE", description: "NEWCASTLE UNITED FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/n/newcastle/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 35758259, channel: "newcastle", twitter: "NUFC")

Team.create(name: "QUEENS PARK RANGERS", description: "QUEENS PARK RANGERS FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/q/qpr/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 71210107, channel: "qpr", twitter: "QPRFC")

Team.create(name: "SOUTHAMPTON", description: "SOUTHAMPTON FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/southampton/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 46143892, channel: "southampton", twitter: "SouthamptonFC")

Team.create(name: "STOKE CITY", description: "STOKE CITY FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/stoke/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 44335177, channel: "stoke", twitter: "stokecity")

Team.create(name: "SUNDERLAND", description: "SUNDERLAND ASSOCIATION FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/sunderland/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 27844464, channel: "sunderland", twitter: "SunderlandAFC")

Team.create(name: "SWANSEA", description: "SWANSEA FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/swansea/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 472385266, channel: "swansea", twitter: "SwansOfficial")

Team.create(name: "TOTTENHAM", description: "TOTTENHAM HOTSPUR FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/s/spurs/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 121402638, channel: "spurs", twitter: "SpursOfficial")

Team.create(name: "WEST BROMWICH ", description: "WEST BROMWICH ALBION FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/w/west-brom/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 280412626, channel: "west-brom", twitter: "WBAFCofficial")

Team.create(name: "WEST HAM ", description: "WEST HAM UNITED FOOTBALL CLUB", img: "http://www.premierleague.com/content/dam/premierleague/shared-images/clubs/w/west-ham/logo.png/_jcr_content/renditions/cq5dam.thumbnail.140.100.png", tweetstream_id: 156247074, channel: "west-ham", twitter: "whufc_official")



