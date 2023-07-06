#The following query script contains the creation of LinkdedIn Database

USE linkedin

CREATE TABLE Users1(User_id int PRIMARY KEY, Name varchar(100), email varchar(100), password char(100), location char(100), join_date date);

CREATE TABLE Profiles(Profile_id int, headline varchar(25), summary varchar(50), industry varchar(25), website varchar(50), connections int,User_id int, PRIMARY KEY(Profile_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) on delete cascade);

CREATE TABLE Connections(connection_id int, User_id int, connection_user_id int, connection_status varchar(20), PRIMARY KEY(connection_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE Experience(Experience_id int, User_id int, company_name varchar(50), title varchar(50), location varchar(50), start_date date, end_date date, PRIMARY KEY(Experience_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE Likes(Like_id int, Post_id int, User_id int, PRIMARY KEY(Like_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE Skills(skill_id int, User_id int, skill_name varchar(50), PRIMARY KEY(skill_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE Post(Post_id int, User_id int, content varchar(50), post_date date, PRIMARY KEY(Post_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE Shares(Share_id int, post_id int, User_id int, PRIMARY KEY(Share_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE  Groups1(Group_id int, User_id int, group_name varchar(50), description_of_group varchar(255), create_date date, PRIMARY KEY(Group_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE Group_members(group_member_id int, Group_id int, User_id int, PRIMARY KEY(Group_member_id), FOREIGN KEY(Group_id) REFERENCES Groups1(Group_id) ON DELETE CASCADE, FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE  Education(Education_id int, User_id int, school_name varchar(50), degree varchar(50), field varchar(50), start_date date, end_date date,PRIMARY KEY(Education_id), FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

CREATE TABLE Comments(Comment_id int, post_id int, User_id int, content varchar(250), comment_date date, PRIMARY KEY(Comment_id), FOREIGN KEY(Post_id) REFERENCES Post(Post_id) ON DELETE CASCADE, FOREIGN KEY(User_id) REFERENCES Users1(User_id) ON DELETE CASCADE)

DESCRIBE Comments

select *from Users1

# 1 Value insertion for users1 table
INSERT into Users1 values(1, "Muhammed", "ullrich.yasmine@ohara.com", 123456, "Nunavut", "2010-10-13")
INSERT into Users1 values(2, "Ruben Dartt", "waelchi.tate@hotmail.com", 123456, "West", "2012-02-20")
INSERT into Users1 values(3, "Liz Pelletier", "reyes.lemke@yahoo.com", 123456, "West", "2011-07-15")
INSERT into Users1 values(4, "Jo Maela", "jbraun@gmail.com", 123456, "West", "2010-12-07")
INSERT into Users1 values(5, "Liz Pelletier", "doyle.jaylon@koelpin.com", 123456, "West", "2009-09-23")
INSERT into Users1 values(6, "Fernando Toninho", "scotty.ritchie@rau.com", 123456, "Prarie", "2009-09-23")
INSERT into Users1 values(7, "Julie Creighton", "bsatterfield@dicki.com", 123456, "West", "2009-02-15")
INSERT into Users1 values(8, "Darius Baxter", "brekke.francis@schaefer.com", 123456, "West", "2008-07-10")
INSERT into Users1 values(9, "Reina Cox", "bebert@gottlieb.com", 123456, "West", "2007-12-03")
INSERT into Users1 values(10, "Jeramiah Murray", "clarabelle.anderson@morissette.net", 123456, "Ontario", "2007-04-27")
INSERT into Users1 values(11, "Savanah Woodward", "alberto45@volkman.com", 123456, "West", "2006-09-19")
INSERT into Users1 values(12, "Ralph Bryan", "mante.austyn@paucek.biz", 123456, "Prarie", "2006-02-11")
INSERT into Users1 values(13, "Marks", "gerry.legros@hegmann.org", 123456, "Prarie", "2005-07-06")
INSERT into Users1 values(14, "Kinley Osborn", "theodore.wisozk@gmail.com", 123456, "Quebec", "2004-11-28")
INSERT into Users1 values(15, "Mckayla", "khalid.simonis@gmail.com", 123456, "Quebec", "2004-04-22")

# 2 Value insertion for Groups table 	
INSERT into Profiles values(1, "CPA at EY", "Content Maker", "Recruitement", "EY India", 40, 4)
INSERT into Profiles values(2, "SDE at PWC", "Web Developer", "Consultant", "PwC India", 50, 3)
INSERT into Profiles values(3, "DE at Netflix", "Data Engineer", "Technical", "Netflix India", 60, 2)
INSERT into Profiles values(4, "ITM at IBM", "IT  manager", "Technical", "IBM - India", 70, 6)
INSERT into Profiles values(5, "CS at IBM", "Support Assistant", "Recruitement", "IBM - India", 50, 7)

# 3 Value insertion for Connections table
INSERT into Connections values(1, 5, 1, "active")
INSERT into Connections values(2, 6, 2, "reachable")
INSERT into Connections values(3, 7, 3, "active")
INSERT into Connections values(4, 4, 4, "active")
INSERT into Connections values(5, 9, 5, "reachable")

# 4 Value insertion for Education table
INSERT into Education values(1, 1, "HKBK", "Bachelor", "ISE", "2010-10-13", "2012-02-20")
INSERT into Education values(2, 2, "HKBK", "Bachelor", "ISE", "2012-02-20", "2013-07-15")
INSERT into Education values(3, 4, "HKBK", "Bachelor", "ISE", "2011-07-15", "2014-07-15")
INSERT into Education values(4, 7, "SVN", "Bachelor", "ISE", "2011-07-15", "2012-07-15")
INSERT into Education values(5, 5, "SVN", "Bachelor", "ISE", "2011-07-15", "2015-07-15")
INSERT into Education values(6, 8, "SVN", "Bachelor", "ISE", "2011-07-15", "2015-07-15")

# 5 Value insertion for Experience table
INSERT into Experience values(1, 2, "EY", "Content Maker", "West", "2010-10-13", "2012-02-20")
INSERT into Experience values(2, 4, "PWC", "Web Developer", "Prarie", "2010-10-13", "2012-02-20")
INSERT into Experience values(3, 5, "Netflix", "Data Engineer", "West", "2010-10-13", "2012-02-20")
INSERT into Experience values(4, 6, "IBM", "IT  manager", "West", "2010-10-13", "2012-02-20")
INSERT into Experience values(5, 7, "Oracle", "Support Assistant", "West", "2010-10-13", "2012-02-20")
INSERT into Experience values(6, 8, "Adobe", "Product Designer", "Ontario", "2010-10-13", "2012-02-20")

# 6 Value insertion for Skill table
INSERT into Skills values(1, 1, "Java")
INSERT into Skills values(2, 2, "Python")
INSERT into Skills values(3, 4, "UI Designing")
INSERT into Skills values(4, 5, "Data Engineer")
INSERT into Skills values(5, 7, "Web Development")
INSERT into Skills values(6, 8, "Deveops")

# 7 Value insertion for Posts table
INSERT INTO Post values(1, 8, "Image", "2012-10-13")
INSERT INTO Post values(2, 2, "Image", "2014-02-20")
INSERT INTO Post values(3, 3, "PDF", "2013-07-15")
INSERT INTO Post values(4, 6, "Video", "2014-07-15")
INSERT INTO Post values(5, 5, "Video", "2015-07-15")

#Value insertion for Comments table
INSERT  into Comments values(1, 2, 2, "Good", "2012-10-13")
INSERT  into Comments values(2, 3, 3, "Good", "2014-02-20")
INSERT  into Comments values(3, 5, 7, "Bad", "2013-07-15")
INSERT  into Comments values(4, 4, 6, "Bad", "2014-07-15")
INSERT  into Comments values(5, 2, 5, "Good", "2015-07-15")
INSERT  into Comments values(6, 1, 8, "Good", "2014-02-20")

#Value insertion for 








