SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`NATION`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`NATION` (
  `NationID` INT NOT NULL ,
  `NationName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`NationID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`MOVIE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`MOVIE` (
  `MovieID` BIGINT NOT NULL AUTO_INCREMENT ,
  `MovieName` VARCHAR(45) NOT NULL ,
  `RunTime` INT NOT NULL ,
  `ReleaseDate` DATE NOT NULL ,
  `Language` VARCHAR(45) NOT NULL ,
  `Rating` DECIMAL(4,2) NOT NULL ,
  `Plot` LONGTEXT NULL ,
  `Poster` TEXT NULL COMMENT ' /* comment truncated */ /*url*/' ,
  `ReleaseCountry` INT NOT NULL ,
  PRIMARY KEY (`MovieID`) ,
  INDEX `fk_MOVIE_NATION1_idx` (`ReleaseCountry` ASC) ,
  CONSTRAINT `fk_MOVIE_NATION1`
    FOREIGN KEY (`ReleaseCountry` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`NATION` (`NationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`GENRE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`GENRE` (
  `GenereName` VARCHAR(20) NOT NULL ,
  `GenereDescription` TEXT NULL ,
  PRIMARY KEY (`GenereName`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`DIRECTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`DIRECTOR` (
  `DirectorID` BIGINT NOT NULL AUTO_INCREMENT ,
  `DirectorFirstName` VARCHAR(45) NOT NULL ,
  `DirectorMiddleName` VARCHAR(45) NULL ,
  `DirectLastName` VARCHAR(45) NOT NULL ,
  `BirthDay` DATE NULL ,
  `Description` VARCHAR(45) NULL ,
  `Nationality` INT NOT NULL ,
  PRIMARY KEY (`DirectorID`) ,
  INDEX `fk_DIRECTOR_NATION1_idx` (`Nationality` ASC) ,
  CONSTRAINT `fk_DIRECTOR_NATION1`
    FOREIGN KEY (`Nationality` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`NATION` (`NationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`ACTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`ACTOR` (
  `ActorID` BIGINT NOT NULL AUTO_INCREMENT ,
  `ActorFirstName` VARCHAR(45) NOT NULL ,
  `AcotMiddleName` VARCHAR(45) NULL ,
  `ActorLastName` VARCHAR(45) NOT NULL ,
  `Birthday` DATE NULL ,
  `Description` VARCHAR(45) NULL ,
  `Nationality` INT NOT NULL ,
  PRIMARY KEY (`ActorID`) ,
  INDEX `fk_ACTOR_NATION1_idx` (`Nationality` ASC) ,
  CONSTRAINT `fk_ACTOR_NATION1`
    FOREIGN KEY (`Nationality` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`NATION` (`NationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`MOVIE_GENRE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`MOVIE_GENRE` (
  `MOVIE_MovieID` BIGINT NOT NULL ,
  `GENRE_GenereName` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`MOVIE_MovieID`, `GENRE_GenereName`) ,
  INDEX `fk_MOVIE_has_GENRE_GENRE1_idx` (`GENRE_GenereName` ASC) ,
  INDEX `fk_MOVIE_has_GENRE_MOVIE_idx` (`MOVIE_MovieID` ASC) ,
  CONSTRAINT `fk_MOVIE_has_GENRE_MOVIE`
    FOREIGN KEY (`MOVIE_MovieID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`MOVIE` (`MovieID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_has_GENRE_GENRE1`
    FOREIGN KEY (`GENRE_GenereName` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`GENRE` (`GenereName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`MOVIE_DIRECTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`MOVIE_DIRECTOR` (
  `MOVIE_MovieID` BIGINT NOT NULL ,
  `DIRECTOR_DirectorID` BIGINT NOT NULL ,
  PRIMARY KEY (`MOVIE_MovieID`, `DIRECTOR_DirectorID`) ,
  INDEX `fk_MOVIE_has_DIRECTOR_DIRECTOR1_idx` (`DIRECTOR_DirectorID` ASC) ,
  INDEX `fk_MOVIE_has_DIRECTOR_MOVIE1_idx` (`MOVIE_MovieID` ASC) ,
  CONSTRAINT `fk_MOVIE_has_DIRECTOR_MOVIE1`
    FOREIGN KEY (`MOVIE_MovieID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`MOVIE` (`MovieID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_has_DIRECTOR_DIRECTOR1`
    FOREIGN KEY (`DIRECTOR_DirectorID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`DIRECTOR` (`DirectorID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`USER`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`USER` (
  `UserID` BIGINT NOT NULL AUTO_INCREMENT ,
  `UserName` VARCHAR(60) NOT NULL ,
  `Password` VARCHAR(64) NOT NULL ,
  `Email` VARCHAR(100) NOT NULL ,
  `Nickname` VARCHAR(45) NULL ,
  PRIMARY KEY (`UserID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`REVIEW`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`REVIEW` (
  `ReviewID` BIGINT NOT NULL AUTO_INCREMENT ,
  `ReviewTime` DATETIME NOT NULL ,
  `Rating` VARCHAR(45) NOT NULL ,
  `Likes` INT NOT NULL DEFAULT 0 ,
  `Dislikes` INT NOT NULL DEFAULT 0 ,
  `IsLong` BINARY NOT NULL DEFAULT 0 ,
  `USER_UserID` BIGINT NOT NULL ,
  `MOVIE_MovieID` INT NOT NULL ,
  PRIMARY KEY (`ReviewID`) ,
  INDEX `fk_Review_USER1_idx` (`USER_UserID` ASC) ,
  INDEX `fk_Review_MOVIE1_idx` (`MOVIE_MovieID` ASC) ,
  CONSTRAINT `fk_Review_USER1`
    FOREIGN KEY (`USER_UserID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`USER` (`UserID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_MOVIE1`
    FOREIGN KEY (`MOVIE_MovieID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`MOVIE` (`MovieID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`COMMENT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`COMMENT` (
  `CommentID` BIGINT NOT NULL ,
  `Review_ReviewID` BIGINT NOT NULL ,
  PRIMARY KEY (`CommentID`, `Review_ReviewID`) ,
  INDEX `fk_COMMENT_Review1_idx` (`Review_ReviewID` ASC) ,
  CONSTRAINT `fk_COMMENT_Review1`
    FOREIGN KEY (`Review_ReviewID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`REVIEW` (`ReviewID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`SHORTREVIEW`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`SHORTREVIEW` (
  `Review_ReviewID` BIGINT NOT NULL ,
  `SummaryContent` TEXT NOT NULL ,
  PRIMARY KEY (`Review_ReviewID`) ,
  INDEX `fk_Summary_Review1_idx` (`Review_ReviewID` ASC) ,
  CONSTRAINT `fk_Summary_Review1`
    FOREIGN KEY (`Review_ReviewID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`REVIEW` (`ReviewID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`LONGREVIEW`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`LONGREVIEW` (
  `Review_ReviewID` BIGINT NOT NULL ,
  `ReviewTitle` VARCHAR(50) NOT NULL ,
  `ReviewContent` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Review_ReviewID`) ,
  INDEX `fk_LONGREVIEW_Review1_idx` (`Review_ReviewID` ASC) ,
  CONSTRAINT `fk_LONGREVIEW_Review1`
    FOREIGN KEY (`Review_ReviewID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`REVIEW` (`ReviewID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`MOVIE_ACTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`MOVIE_ACTOR` (
  `MOVIE_MovieID` BIGINT NOT NULL ,
  `ACTOR_ActorID` BIGINT NOT NULL ,
  PRIMARY KEY (`MOVIE_MovieID`, `ACTOR_ActorID`) ,
  INDEX `fk_MOVIE_has_ACTOR_ACTOR1_idx` (`ACTOR_ActorID` ASC) ,
  INDEX `fk_MOVIE_has_ACTOR_MOVIE1_idx` (`MOVIE_MovieID` ASC) ,
  CONSTRAINT `fk_MOVIE_has_ACTOR_MOVIE1`
    FOREIGN KEY (`MOVIE_MovieID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`MOVIE` (`MovieID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_has_ACTOR_ACTOR1`
    FOREIGN KEY (`ACTOR_ActorID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`ACTOR` (`ActorID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `class-2014-1-17-610-557-01_jz337`.`COMMENTCONTENT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `class-2014-1-17-610-557-01_jz337`.`COMMENTCONTENT` (
  `COMMENT_CommentID` BIGINT NOT NULL ,
  `Content` TEXT NOT NULL ,
  `CommentTime` DATETIME NOT NULL ,
  `Likes` INT NULL DEFAULT 0 ,
  `Dislikes` INT NULL DEFAULT 0 ,
  `USER_UserID` BIGINT NOT NULL ,
  INDEX `fk_COMMENTCONTENT_USER1_idx` (`USER_UserID` ASC) ,
  PRIMARY KEY (`COMMENT_CommentID`) ,
  CONSTRAINT `fk_COMMENTCONTENT_USER1`
    FOREIGN KEY (`USER_UserID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`USER` (`UserID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMMENTCONTENT_COMMENT1`
    FOREIGN KEY (`COMMENT_CommentID` )
    REFERENCES `class-2014-1-17-610-557-01_jz337`.`COMMENT` (`CommentID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
