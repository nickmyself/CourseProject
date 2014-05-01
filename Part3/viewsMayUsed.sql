--show movies of a genre
SELECT * FROM `class-2014-1-17-610-557-01_jz337`.GENRE  G
JOIN `class-2014-1-17-610-557-01_jz337`.MOVIE_GENRE MG ON G.GenreID = MG.GENRE_GenreID 
JOIN `class-2014-1-17-610-557-01_jz337`.MOVIE M ON M.MovieID = MG.MOVIE_MovieID 
ORDER BY GenreName

--show movie actor
SELECT * FROM `class-2014-1-17-610-557-01_jz337`.MOVIE M
JOIN `class-2014-1-17-610-557-01_jz337`.MOVIE_ACTOR MA ON MA.MOVIE_MovieID = M.MovieID
JOIN `class-2014-1-17-610-557-01_jz337`.ACTOR A ON A.ActorID = MA.ACTOR_ActorID

--show movie director
SELECT * FROM `class-2014-1-17-610-557-01_jz337`.DIRECTOR D
JOIN `class-2014-1-17-610-557-01_jz337`.MOVIE_DIRECTOR MD ON MD.DIRECTOR_DirectorID = D.DirectorID
JOIN `class-2014-1-17-610-557-01_jz337`.MOVIE M ON M.MovieID = MD.MOVIE_MovieID

--show release country
SELECT * FROM `class-2014-1-17-610-557-01_jz337`.MOVIE M
JOIN `class-2014-1-17-610-557-01_jz337`.RELEASE_COUNTRY RC ON M.MovieID = RC.MOVIE_MovieID;

--show movie short review
SELECT * FROM `class-2014-1-17-610-557-01_jz337`.MOVIE M
JOIN `class-2014-1-17-610-557-01_jz337`.REVIEW R ON R.MOVIE_MovieID = M.MovieID
JOIN `class-2014-1-17-610-557-01_jz337`.SHORTREVIEW SR ON SR.REVIEW_ReviewID = R.ReviewID
--show movie long review
SELECT MovieName,ReviewID,ReviewTitle,ReviewContent FROM `class-2014-1-17-610-557-01_jz337`.MOVIE M
JOIN `class-2014-1-17-610-557-01_jz337`.REVIEW R ON R.MOVIE_MovieID = M.MovieID
JOIN `class-2014-1-17-610-557-01_jz337`.LONGREVIEW LR ON LR.REVIEW_ReviewID = R.ReviewID

--show user short review
SELECT * FROM `class-2014-1-17-610-557-01_jz337`.USER U 
JOIN `class-2014-1-17-610-557-01_jz337`.REVIEW R ON R.USER_UserID = U.UserID
JOIN `class-2014-1-17-610-557-01_jz337`.SHORTREVIEW SR ON SR.REVIEW_ReviewID = R.ReviewID

--show user long review
SELECT * FROM `class-2014-1-17-610-557-01_jz337`.USER U 
JOIN `class-2014-1-17-610-557-01_jz337`.REVIEW R ON R.USER_UserID = U.UserID
JOIN `class-2014-1-17-610-557-01_jz337`.LONGREVIEW LR ON LR.REVIEW_ReviewID = R.ReviewID

--show review comment
SELECT R.ReviewID,U.UserName AS 'Writeer',R.ReviewTime,R.Likes,R.Dislikes,C.Content,C.CommentTime,C.Likes AS 'CommentLikes',C.Dislikes AS 'CommentDislikes', U2.UserName AS 'Commentor' FROM  `class-2014-1-17-610-557-01_jz337`.REVIEW R 
JOIN `class-2014-1-17-610-557-01_jz337`.`COMMENT` C ON C.REVIEW_ReviewID = R.ReviewID 
JOIN `class-2014-1-17-610-557-01_jz337`.USER U ON U.UserID = R.USER_UserId
JOIN  `class-2014-1-17-610-557-01_jz337`.USER U2 ON U2.UserID = C.USER_UserId

--show user comment
SELECT R.ReviewID,U.UserName AS 'Writeer',R.ReviewTime,R.Likes,R.Dislikes,C.Content,C.CommentTime,C.Likes AS 'CommentLikes',C.Dislikes AS 'CommentDislikes', U2.UserName AS 'Commentor' FROM  `class-2014-1-17-610-557-01_jz337`.REVIEW R 
JOIN `class-2014-1-17-610-557-01_jz337`.`COMMENT` C ON C.REVIEW_ReviewID = R.ReviewID 
JOIN `class-2014-1-17-610-557-01_jz337`.USER U ON U.UserID = R.USER_UserId
JOIN  `class-2014-1-17-610-557-01_jz337`.USER U2 ON U2.UserID = C.USER_UserId
