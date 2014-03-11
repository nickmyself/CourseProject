SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `MovieStar`.`NATION`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`NATION` (
  `NationID` INT NOT NULL ,
  `NationName` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`NationID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`MOVIE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`MOVIE` (
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
    REFERENCES `MovieStar`.`NATION` (`NationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`GENRE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`GENRE` (
  `GenereName` VARCHAR(20) NOT NULL ,
  `GenereDescription` TEXT NULL ,
  PRIMARY KEY (`GenereName`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`DIRECTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`DIRECTOR` (
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
    REFERENCES `MovieStar`.`NATION` (`NationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`ACTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`ACTOR` (
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
    REFERENCES `MovieStar`.`NATION` (`NationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`MOVIE_GENRE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`MOVIE_GENRE` (
  `MOVIE_MovieID` BIGINT NOT NULL ,
  `GENRE_GenereName` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`MOVIE_MovieID`, `GENRE_GenereName`) ,
  INDEX `fk_MOVIE_has_GENRE_GENRE1_idx` (`GENRE_GenereName` ASC) ,
  INDEX `fk_MOVIE_has_GENRE_MOVIE_idx` (`MOVIE_MovieID` ASC) ,
  CONSTRAINT `fk_MOVIE_has_GENRE_MOVIE`
    FOREIGN KEY (`MOVIE_MovieID` )
    REFERENCES `MovieStar`.`MOVIE` (`MovieID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_has_GENRE_GENRE1`
    FOREIGN KEY (`GENRE_GenereName` )
    REFERENCES `MovieStar`.`GENRE` (`GenereName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`MOVIE_DIRECTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`MOVIE_DIRECTOR` (
  `MOVIE_MovieID` BIGINT NOT NULL ,
  `DIRECTOR_DirectorID` BIGINT NOT NULL ,
  PRIMARY KEY (`MOVIE_MovieID`, `DIRECTOR_DirectorID`) ,
  INDEX `fk_MOVIE_has_DIRECTOR_DIRECTOR1_idx` (`DIRECTOR_DirectorID` ASC) ,
  INDEX `fk_MOVIE_has_DIRECTOR_MOVIE1_idx` (`MOVIE_MovieID` ASC) ,
  CONSTRAINT `fk_MOVIE_has_DIRECTOR_MOVIE1`
    FOREIGN KEY (`MOVIE_MovieID` )
    REFERENCES `MovieStar`.`MOVIE` (`MovieID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_has_DIRECTOR_DIRECTOR1`
    FOREIGN KEY (`DIRECTOR_DirectorID` )
    REFERENCES `MovieStar`.`DIRECTOR` (`DirectorID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`USER`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`USER` (
  `UserID` BIGINT NOT NULL AUTO_INCREMENT ,
  `UserName` VARCHAR(60) NOT NULL ,
  `Password` VARCHAR(64) NOT NULL ,
  `Email` VARCHAR(100) NOT NULL ,
  `Nickname` VARCHAR(45) NULL ,
  PRIMARY KEY (`UserID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`REVIEW`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`REVIEW` (
  `Review_ReviewID` BIGINT NOT NULL ,
  `SummaryContent` TEXT NOT NULL ,
  PRIMARY KEY (`Review_ReviewID`) ,
  INDEX `fk_Summary_Review1_idx` (`Review_ReviewID` ASC) ,
  CONSTRAINT `fk_Summary_Review1`
    FOREIGN KEY (`Review_ReviewID` )
    REFERENCES `MovieStar`.`REVIEW` (`ReviewID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`COMMENT`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`COMMENT` (
  `CommentID` BIGINT NOT NULL ,
  `Content` TEXT NOT NULL ,
  `CommentTime` DATETIME NOT NULL ,
  `Likes` INT NOT NULL DEFAULT 0 ,
  `Dislikes` INT NOT NULL DEFAULT 0 ,
  `USER_UserID` BIGINT NOT NULL ,
  `Review_ReviewID` BIGINT NOT NULL ,
  PRIMARY KEY (`CommentID`) ,
  INDEX `fk_COMMENT_USER1_idx` (`USER_UserID` ASC) ,
  INDEX `fk_COMMENT_Review1_idx` (`Review_ReviewID` ASC) ,
  CONSTRAINT `fk_COMMENT_USER1`
    FOREIGN KEY (`USER_UserID` )
    REFERENCES `MovieStar`.`USER` (`UserID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMMENT_Review1`
    FOREIGN KEY (`Review_ReviewID` )
    REFERENCES `MovieStar`.`REVIEW` (`ReviewID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`REVIEW`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`REVIEW` (
  `Review_ReviewID` BIGINT NOT NULL ,
  `SummaryContent` TEXT NOT NULL ,
  PRIMARY KEY (`Review_ReviewID`) ,
  INDEX `fk_Summary_Review1_idx` (`Review_ReviewID` ASC) ,
  CONSTRAINT `fk_Summary_Review1`
    FOREIGN KEY (`Review_ReviewID` )
    REFERENCES `MovieStar`.`REVIEW` (`ReviewID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`LONGREVIEW`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`LONGREVIEW` (
  `Review_ReviewID` BIGINT NOT NULL ,
  `ReviewTitle` VARCHAR(50) NOT NULL ,
  `ReviewContent` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Review_ReviewID`, `ReviewTitle`) ,
  INDEX `fk_LONGREVIEW_Review1_idx` (`Review_ReviewID` ASC) ,
  CONSTRAINT `fk_LONGREVIEW_Review1`
    FOREIGN KEY (`Review_ReviewID` )
    REFERENCES `MovieStar`.`REVIEW` (`ReviewID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MovieStar`.`MOVIE_ACTOR`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MovieStar`.`MOVIE_ACTOR` (
  `MOVIE_MovieID` BIGINT NOT NULL ,
  `ACTOR_ActorID` BIGINT NOT NULL ,
  PRIMARY KEY (`MOVIE_MovieID`, `ACTOR_ActorID`) ,
  INDEX `fk_MOVIE_has_ACTOR_ACTOR1_idx` (`ACTOR_ActorID` ASC) ,
  INDEX `fk_MOVIE_has_ACTOR_MOVIE1_idx` (`MOVIE_MovieID` ASC) ,
  CONSTRAINT `fk_MOVIE_has_ACTOR_MOVIE1`
    FOREIGN KEY (`MOVIE_MovieID` )
    REFERENCES `MovieStar`.`MOVIE` (`MovieID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MOVIE_has_ACTOR_ACTOR1`
    FOREIGN KEY (`ACTOR_ActorID` )
    REFERENCES `MovieStar`.`ACTOR` (`ActorID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
