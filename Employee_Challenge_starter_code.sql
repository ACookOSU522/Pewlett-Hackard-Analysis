-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (______) _____,
--______,
--______,
--______

--INTO nameyourtable
--FROM _______
--WHERE _______
--ORDER BY _____, _____ DESC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT  
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM Employees as e 
inner join titles as ti 
on (e.emp_no = ti.emp_no)
WHERE e.birth_date between '1952-01-01' and '1955-12-31'
ORDER BY e.emp_no ASC, ti.to_date DESC;

select * from retirement_titles
------------------------------------------------------------
SELECT DISTINCT ON (r.emp_no)
r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r
WHERE r.to_date = '9999-01-01'
ORDER BY r.emp_no ASC, r.to_date DESC;

select * from unique_titles
------------------------------------------------------------
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles 
GROUP BY title
ORDER BY count DESC

select * from retiring_titles
-----------------------------------------------------------

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date,
ti.title

into mentorship_eligibility
FROM Employees as e
inner join dept_emp as d
on (e.emp_no = d.emp_no)
inner join titles as ti
on (e.emp_no = ti.emp_no)
WHERE d.to_date = '9999-01-01' 
and e.birth_date between '1965-01-01' and '1965-12-31'
ORDER BY e.emp_no ASC, ti.to_date DESC


select * from mentorship_eligibility