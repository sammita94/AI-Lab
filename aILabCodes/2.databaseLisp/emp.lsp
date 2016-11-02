(set 'Employees '(
("E1" (details (id 1) (gender "F") (salary 40000)))
("E2" (details (id 2) (gender "M") (salary 50000)))
("E3" (details (id 3) (gender "M") (salary 60000)))
))

(setf (assoc "E1" Employees) '("E1" (details (id 1) (gender "F") (salary 70000)))) 

Employees