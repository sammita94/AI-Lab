;; First program in LISP
;; Write a LISP program to search, insert and delete an element from a list

(set 'content (read-file ("try.txt"))'

(println 
	"Words: " (length (find-all "\\w+" content))
  " Bytes: " ((file-info (main-args 2)) 0))

(exit)

[try.txt file has some text say, “My name is Gautam Sarker. I am an AI prof.”]

 				--------------------------------------

;;assign new list to list1
(set 'list1 (list 'a 'b 'c))

;;search an element
(find 'b list1)

;;delete an element
(pop  list1)
list1

;;insert an element
(set 'list1 (append '(d)  list1))
list1
