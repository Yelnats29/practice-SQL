-- 1. List the names of all NFL teams'
Select name from teams;
         name         
----------------------
 Buffalo Bills
 Miami Dolphins
 New England Patriots
 New York Jets
 Baltimore Ravens
 Cincinnati Bengals
 Cleveland Browns
 Pittsburgh Steelers


-- 2. List the stadium name and head coach of all NFC teams
select stadium, head_coach from teams where conference = 'NFC';
            stadium            |  head_coach   
-------------------------------+---------------
 AT&T Stadium                  | Jason Garrett
 MetLife Stadium               | Tom Coughlin
 Lincoln Financial Field       | Chip Kelly
 FedExField                    | Jay Gruden


-- 3. List the head coaches of the AFC South
select head_coach from teams where division = 'South' and  conference = 'AFC';
   head_coach   
----------------
 Bill OBrien
 Chuck Pagano
 Gus Bradley
 Ken Whisenhunt

-- 4. The total number of players in the NFL
  select count(*), name from players group by name;

-- 5. The team names and head coaches of the NFC North and AFC East
select name, head_coach from teams where division = 'North' and conference = 'NFC';
       name        |  head_coach   
-------------------+---------------
 Chicago Bears     | Marc Trestman
 Detroit Lions     | Jim Caldwell
 Green Bay Packers | Mike McCarthy
 Minnesota Vikings | Mike Zimmer


select name, head_coach from teams where division = 'East' and conference = 'AFC';
         name         |   head_coach   
----------------------+----------------
 Buffalo Bills        | Doug Marrone
 Miami Dolphins       | Joe Philbin
 New England Patriots | Bill Belichick
 New York Jets        | Rex Ryan

-- 6. The 50 players with the highest salaries
select name, salary from players order by salary DESC limit 50;
          name           |  salary  
-------------------------+----------
 Peyton Manning          | 18000000
 Drew Brees              | 15760000
 Dwight Freeney          | 14035000
 Elvis Dumervil          | 14000000

-- 7. The average salary of all NFL players
 select AVG(salary) from players group by position;
         avg          
----------------------
 1547756.253807106599
 1617443.128491620112
 1921833.333333333333

-- 8. The names and positions of players with a salary above 10_000_000
select name, position from players where salary > 10000000;
          name           | position 
-------------------------+----------
 Jake Long               | T
 Joe Thomas              | T
 Dwight Freeney          | DE
 Peyton Manning (buyout) | QB
 Peyton Manning          | QB
 Elvis Dumervil          | DE

-- 9. The player with the highest salary in the NFL
 select name, salary from players order by salary DESC limit 1;
      name      |  salary  
----------------+----------
 Peyton Manning | 18000000
-- 10. The name and position of the first 100 players with the lowest salaries
  select name, position from players order by salary ASC limit 100;

-- 11. The average salary for a DE in the nfl
  select AVG(salary) as average from players where position = 'DE';
        average          
----------------------
 2161326.377049180328

-- 12. The names of all the players on the Buffalo Bills
SELECT players.name, teams.name FROM players, teams WHERE players.team_id=teams.id AND teams.name LIKE 'Buffalo Bills';
        name        |     name      
--------------------+---------------
 Mario Williams     | Buffalo Bills
 Drayton Florence   | Buffalo Bills
 Shawne Merriman    | Buffalo Bills
-- 13. The total salary of all players on the New York Giants
select SUM(salary) as sum_salary from players join teams on players.team_id = teams.id where teams.name = 'New York Giants';
 sum_salary 
------------
   74179466

-- 14. The player with the lowest salary on the Green Bay Packers
 select MIN(salary) as min_salary from players join teams on players.team_id = teams.id where teams.name = 'Green Bay Packers';
 min_salary 
------------
     390000

SELECT players.name AS player_name, players.salary
FROM players
JOIN teams ON players.team_id = teams.id
WHERE teams.name = 'Green Bay Packers'
ORDER BY players.salary ASC
LIMIT 1;
  player_name   | salary 
----------------+--------
 Shaky Smithson | 390000
