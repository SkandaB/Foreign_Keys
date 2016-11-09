-- Drill down
-- 1. number of correct answers posted in year 2015

	SELECT count(*),calendar.year FROM `activity`,calendar,answer WHERE activity.calendar_id=calendar.id and activity.post_id=answer.post_id and calendar.year=2015 and answer.accepted=1;

-- 2. number of correct answers posted in each quarter of year 2015
	SELECT count(*),QUARTER(calendar.fulldate) as quarter, calendar.year FROM `activity`,calendar,answer WHERE activity.calendar_id=calendar.id and activity.post_id=answer.post_id and answer.accepted=1 AND calendar.year=2015 GROUP BY QUARTER(calendar.fulldate);

-- 3. number of correct answers posted in each month of a quarter of year 2015
	SELECT count(*),calendar.year as year,QUARTER(calendar.fulldate) as quarter, calendar.month as month FROM `activity`,calendar,answer WHERE activity.calendar_id=calendar.id and activity.post_id=answer.post_id and answer.accepted=1 AND calendar.year=2015 GROUP BY QUARTER(calendar.fulldate),calendar.month;

-- Drill up
1. Number of questions posted from a street
	SELECT count(*),user.Street as Street FROM `activity`,user,question WHERE activity.user_id=user.id and activity.post_id=question.post_id and user.Street='101 E Hedding St';
	

-- 2. Number of questions posted from a zip code 95112
	SELECT count(*),user.Street as Street,user.zip_code as zip_code FROM `activity`,user,question WHERE activity.user_id=user.id and activity.post_id=question.post_id and user.zip_code=95112 GROUP BY user.Street;


-- 3. Number of questions posted from city 'San Jose'
	SELECT count(*),user.zip_code as zip_code,user.City FROM `activity`,user,question WHERE activity.user_id=user.id and activity.post_id=question.post_id and user.City='San Jose' GROUP BY user.zip_code;

-- Slice
-- Number of questions posted in an year 2015 for each tag by city
	SELECT count(*),calendar.year,tag.name,user.City as CITY from activity,tag,user,calendar WHERE activity.tag_id=tag.id AND activity.user_id=user.id AND activity.calendar_id=calendar.id and calendar.year=2015 GROUP BY user.City,tag.id ORDER BY count(*) DESC;

-- Dice
-- Total number of correct answers for a particular tag android in each month of 2015
	SELECT calendar.month,count(*) from activity,calendar,tag where activity.calendar_id=calendar.id and activity.tag_id=tag.id and tag.name='android' GROUP by calendar.month;

