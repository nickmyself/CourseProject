-- Password Length should more than 4
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.USER
ADD CHECK ( CHAR_LENGTH(Password)>4);

-- Check email address format use regular expression
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.USER
ADD CHECK ( Email REGEXP '[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}');

-- Short review content shuold be more than 40 characters
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.SHORTREVIEW
ADD CHECK ( CHAR_LENGTH(SummaryContent)>40);

-- Long review content shold be more than 100 characters
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.LONGREVIEW
ADD CHECK ( CHAR_LENGTH(REVIEWContent)>100);

-- Long comment content shold be more than 20 characters
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.COMMENT
ADD CHECK ( CHAR_LENGTH(CONTENT)>20);

-- Actor birth date shuold be formated like YYYY-MM-DD
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.ACTOR
ADD CHECK ( Birthday REGEXP '^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$');

-- Director birth date shuold be formated like YYYY-MM-DD
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.DIRECTOR
ADD CHECK ( Birthday REGEXP '^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$');

-- Release Date shuold be formated like YYYY-MM-DD
ALTER TABLE `class-2014-1-17-610-557-01_jz337`.MOVIE
ADD CHECK ( ReleaseDate REGEXP '^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$');

