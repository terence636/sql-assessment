
-- Top 25 .edu schools in term of total users;
select email_domain, count(email_domain) from users
group by email_domain 
having email_domain like "%.edu"
order by count(email_domain) desc
limit 25;


-- How many.edu learners are located in New York 
select city, count(city) from users
group by city 
having city='new york';
-- Ans: 50 users

-- How many using mobile app
select mobile_app, count(mobile_app) from users
group by mobile_app
having mobile_app='mobile-user';
-- Ans: 330 users

-- query for total sign up for hour 18 to 19 on 02Oct2018
select count(sign_up_at) as 02_10_18_TO_19 from users
where sign_up_at between '2018-10-02 18:00:00' and '2018-10-02 19:00:00';

-- JOIN filter out school that enrol in JS
select u.email_domain, p.learn_javascript as JS_Course from users u
inner join progress p on u.user_id = p.user_id
where not p.learn_javascript = '';

-- my.tccd.edu
select u.email_domain as school, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.email_domain = 'my.tccd.edu';

-- new yorkers
select u.city as city, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'new york';

-- my.tccd.edu total students for each subject
select d.school, 
count(if(not d.learn_cpp='',1,null)) as learn_cpp,
count(if(not d.learn_sql='',1,null)) as learn_sql,
count(if(not d.learn_html='',1,null)) as learn_html,
count(if(not d.learn_javascript='',1,null)) as learn_javascript,
count(if(not d.learn_java='',1,null)) as learn_java
from (
select u.email_domain as school, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.email_domain = 'my.tccd.edu') d
group by 1;

-- uark.edu total students for each subject
select d.school, 
count(if(not d.learn_cpp='',1,null)) as learn_cpp,
count(if(not d.learn_sql='',1,null)) as learn_sql,
count(if(not d.learn_html='',1,null)) as learn_html,
count(if(not d.learn_javascript='',1,null)) as learn_javascript,
count(if(not d.learn_java='',1,null)) as learn_java
from (
select u.email_domain as school, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.email_domain = 'uark.edu') d
group by 1;


-- New yorkers - total students for each subjects
select d.city, 
count(if(not d.learn_cpp='',1,null)) as learn_cpp,
count(if(not d.learn_sql='',1,null)) as learn_sql,
count(if(not d.learn_html='',1,null)) as learn_html,
count(if(not d.learn_javascript='',1,null)) as learn_javascript,
count(if(not d.learn_java='',1,null)) as learn_java
from (
select u.city as city, p.learn_cpp as learn_cpp, p.learn_sql as learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'new york') d
group by 1;


-- Chicago - total students for each subjects
select d.city, 
count(if(not d.learn_cpp='',1,null)) as learn_cpp,
count(if(not d.learn_sql='',1,null)) as learn_sql,
count(if(not d.learn_html='',1,null)) as learn_html,
count(if(not d.learn_javascript='',1,null)) as learn_javascript,
count(if(not d.learn_java='',1,null)) as learn_java
from (
select u.city as city, p.learn_cpp as learn_cpp, p.learn_sql as learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'chicago') d
group by 1;
-- ANS 


-- Number of new yorkers students taking cpp
select d.city, count(d.learn_cppl) as learn_cpp from (
select u.city as city, p.learn_cpp as learn_cpp, p.learn_sql as learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'new york' and not p.learn_cpp = '') d
group by 1;
-- ANS is 16

-- Number of new yorkers students taking sql
select d.city, count(d.learn_sql) as learn_sql from (
select u.city, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'new york' and not p.learn_sql = '') d
group by 1;
-- ANS is 25

-- Number of new yorkers students taking html
select d.city, count(d.learn_html) as learn_html from (
select u.city, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'new york' and not p.learn_html = '') d
group by 1;
-- ANS is 14

-- Number of new yorkers students taking java
select d.city, count(d.learn_java) as learn_javascript from (
select u.city, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'new york' and not p.learn_javascript = '') d
group by 1;
-- ANS is 29

-- Number of new yorkers students taking java
select d.city, count(d.learn_java) as learn_java from (
select u.city, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java from users u
inner join progress p on u.user_id = p.user_id
where u.city = 'new york' and not p.learn_java = '') d
group by 1;
-- ANS is 8



