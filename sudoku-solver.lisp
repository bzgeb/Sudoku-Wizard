(load "satisfiable.lisp")

(defvar test1)
(defvar test2)
(defvar test3)
(defvar test4)
(defvar test5)
(defvar test6)
(defvar test7)
(defvar test8)
(defvar test9)
(defvar test10)
(defvar test11)
(defvar test12)
(defvar test13)
(defvar test14)
(defvar test15)
(defvar test16)
(defvar test17)
(defvar test18)
(defvar test19)
(defvar test20)

(setf test1 '( (5 0 0 0 0 0 0 0 0)
               (0 2 8 4 0 0 5 0 3)
               (1 0 0 2 7 0 0 0 6)
               (0 0 3 0 5 2 1 9 0)
               (7 0 6 0 1 0 2 0 8)
               (0 1 9 7 4 0 3 0 0)
               (6 0 0 0 9 4 0 0 2)
               (8 0 1 0 0 6 7 5 0)
               (0 0 0 0 0 0 0 0 4) ))

(setf test2 '( (5 6 0 0 0 4 1 0 0)
               (0 7 0 6 0 0 0 3 0)
               (0 0 0 1 2 0 0 6 0)
               (0 0 0 3 0 8 6 9 2)
               (0 8 0 0 7 0 0 4 0)
               (4 3 2 9 0 6 0 0 0)
               (0 5 0 0 9 7 0 0 0)
               (0 2 0 0 0 1 0 5 0)
               (0 0 9 5 0 0 0 8 6) ))

(setf test3 '( (0 0 4 0 3 0 0 6 0)
               (1 6 0 0 0 2 0 3 0)
               (9 0 2 8 0 6 4 5 0)
               (0 0 0 0 6 0 9 1 0)
               (0 0 0 0 0 0 0 0 0)
               (0 1 8 0 5 0 0 0 0)
               (0 2 6 1 0 5 3 0 4)
               (0 7 0 6 0 0 0 8 2)
               (0 4 0 0 2 0 6 0 0) ))

(setf test4 '( (0 0 0 0 0 4 8 0 0)
               (0 2 0 0 0 3 0 1 0)
               (6 0 1 0 0 0 7 0 5)
               (5 8 0 0 0 9 0 7 0)
               (0 0 4 0 0 0 5 0 0)
               (0 1 0 7 0 0 0 8 6)
               (4 0 3 0 0 0 9 0 2)
               (0 6 0 3 0 0 0 4 0)
               (0 0 2 6 0 0 0 0 0) ))

(setf test5 '( (9 0 8 0 0 2 0 0 0)
               (0 0 0 0 7 0 0 5 8)
               (0 7 0 0 0 9 0 0 0)
               (0 9 4 0 1 8 5 0 7)
               (5 0 0 0 9 0 0 0 1)
               (2 0 1 7 6 0 3 9 0)
               (0 0 0 5 0 0 0 3 0)
               (8 1 0 0 3 0 0 0 0)
               (0 0 0 9 0 0 7 0 6) ))

(setf test6 '( (0 1 0 9 4 2 7 0 0)
               (0 0 0 6 0 0 2 0 0)
               (2 0 0 0 7 1 9 0 0)
               (4 8 0 0 0 0 0 0 2)
               (7 0 0 0 0 0 0 0 9)
               (1 0 0 0 0 0 0 8 6)
               (0 0 7 8 2 0 0 0 1)
               (0 0 1 0 0 9 0 0 0)
               (0 0 8 5 1 6 0 2 0) ))

(setf test7 '( (6 1 0 3 5 4 0 9 0)
               (0 9 0 0 0 0 0 0 4)
               (8 4 0 0 9 0 6 1 0)
               (0 3 0 4 0 0 8 0 0)
               (0 0 0 9 6 1 0 0 0)
               (0 0 1 0 0 3 0 5 0)
               (0 6 4 0 3 0 0 8 2)
               (2 0 0 0 0 0 0 3 0)
               (0 8 0 5 1 2 0 6 9) ))

(setf test8 '( (5 0 0 3 4 0 0 0 1)
               (0 1 4 0 0 6 3 7 0)
               (7 0 3 9 0 8 4 0 0)
               (2 7 9 0 0 0 0 0 0)
               (0 4 0 0 0 0 0 3 0)
               (0 0 0 0 0 0 6 1 7)
               (0 0 7 2 0 3 8 0 6)
               (0 5 6 8 0 0 1 2 0)
               (8 0 0 0 6 4 0 0 9) ))

(setf test9 '( (0 0 5 0 0 7 0 6 8)
               (0 0 0 0 0 0 0 0 0)
               (9 8 0 6 3 0 2 7 0)
               (0 0 6 1 0 0 0 2 4)
               (0 0 0 0 4 0 0 0 0)
               (2 3 0 0 0 8 9 0 0)
               (0 5 8 0 1 3 0 9 2)
               (0 0 0 0 0 0 0 0 0)
               (4 6 0 2 0 0 5 0 0) ))

(setf test10 '( (1 0 0 0 9 6 0 0 0)
                (0 9 0 3 5 7 0 6 8)
                (0 0 0 0 8 0 7 0 0)
                (0 1 0 7 0 0 6 5 0)
                (0 0 0 0 0 0 0 0 0)
                (0 3 4 0 0 9 0 8 0)
                (0 0 1 0 7 0 0 0 0)
                (9 8 0 1 6 4 0 7 0)
                (0 0 0 5 3 0 0 0 6) ))

(setf test11 '( (0 0 0 2 1 9 0 0 6)
                (0 2 7 6 0 0 0 0 5)
                (0 0 0 5 0 3 8 0 0)
                (1 0 0 0 9 0 0 6 0)
                (7 0 0 1 0 8 0 0 3)
                (0 9 0 0 4 0 0 0 7)
                (0 0 9 8 0 1 0 0 0)
                (8 0 0 0 0 6 5 3 0)
                (5 0 0 9 3 7 0 0 0) ))

(setf test12 '( (3 5 0 2 0 0 8 9 0)
                (0 4 0 7 0 8 0 0 0)
                (1 0 8 0 3 0 0 0 0)
                (4 0 5 0 7 2 0 1 0)
                (0 0 6 8 0 1 9 0 0)
                (0 9 0 3 5 0 2 0 7)
                (0 0 0 0 2 0 3 0 5)
                (0 0 0 6 0 5 0 2 0)
                (0 1 2 0 0 3 0 6 9) ))

(setf test13 '( (1 6 0 9 3 0 0 8 0)
                (0 0 0 1 0 0 0 0 9)
                (0 0 0 8 5 0 1 3 0)
                (9 0 5 0 1 0 6 4 2)
                (0 0 0 0 0 0 0 0 0)
                (4 8 2 0 6 0 5 0 1)
                (0 4 3 0 8 2 0 0 0)
                (5 0 0 0 0 3 0 0 0)
                (0 2 0 0 9 1 0 5 6) ))

(setf test14 '( (0 0 0 0 6 3 0 5 4)
                (1 0 5 7 0 0 0 2 3)
                (0 6 7 0 0 2 0 0 0)
                (0 0 0 0 4 0 3 8 6)
                (8 0 0 5 0 6 0 0 1)
                (4 1 6 0 9 0 0 0 0)
                (0 0 0 8 0 0 1 6 0)
                (6 3 0 0 0 7 8 0 5)
                (7 8 0 6 1 0 0 0 0) ))

(setf test15 '( (0 5 4 6 2 0 0 0 0)
                (6 0 7 0 0 8 0 3 1)
                (8 0 0 0 0 5 2 0 4)
                (0 0 0 9 0 1 0 7 0)
                (7 0 0 5 0 4 0 0 6)
                (0 9 0 7 0 2 0 0 0)
                (3 0 1 8 0 0 0 0 2)
                (2 8 0 3 0 0 4 0 9)
                (0 0 0 0 1 6 3 8 0) ))

(setf test16 '( (9 7 0 0 0 3 4 5 0)
                (1 0 0 0 2 4 0 3 0)
                (4 3 0 0 0 9 2 0 6)
                (7 0 4 8 0 0 0 0 0)
                (0 9 0 0 0 0 0 8 0)
                (0 0 0 0 0 2 7 0 5)
                (2 0 7 9 0 0 0 6 8)
                (0 4 0 3 6 0 0 0 7)
                (0 5 3 2 0 0 0 9 4) ))

(setf test17 '( (3 0 8 0 0 0 0 0 0)
                (0 0 0 0 4 0 5 0 7)
                (6 7 0 0 5 8 0 1 9)
                (1 8 0 0 0 0 0 0 0)
                (7 9 0 8 2 3 0 4 5)
                (0 0 0 0 0 0 0 9 3)
                (4 6 0 7 8 0 0 3 1)
                (2 0 9 0 1 0 0 0 0)
                (0 0 0 0 0 0 4 0 6) ))

(setf test18 '( (0 7 6 0 0 3 0 0 0)
                (0 0 0 8 0 0 6 0 0)
                (3 0 0 0 5 0 0 2 4)
                (7 8 3 5 0 0 0 9 0)
                (1 2 9 6 0 8 7 4 5)
                (0 4 0 0 0 7 8 1 3)
                (8 5 0 0 6 0 0 0 2)
                (0 0 7 0 0 1 0 0 0)
                (0 0 0 4 0 0 3 8 0) ))

(setf test19 '( (0 0 0 0 0 8 0 0 0)
                (3 0 8 0 0 0 7 0 0)
                (2 9 4 7 0 0 0 8 1)
                (4 0 0 8 6 0 0 7 0)
                (0 0 0 0 0 0 0 0 0)
                (0 7 0 0 9 2 0 0 6)
                (6 5 0 0 0 1 2 4 3)
                (0 0 3 0 0 0 8 0 9)
                (0 0 0 5 0 0 0 0 0) ))

(setf test20 '( (6 0 0 2 0 5 0 0 0)
                (0 7 0 0 6 0 8 0 0)
                (5 0 0 0 0 4 0 0 0)
                (0 0 9 0 0 0 3 4 2)
                (1 0 8 0 0 0 5 0 6)
                (2 6 3 0 0 0 9 0 0)
                (0 0 0 7 0 0 0 0 9)
                (0 0 7 0 9 0 0 2 0)
                (0 0 0 1 0 3 0 0 7) ))

; returns a list of all the numbers in the nth row of the puzzle
(defun get-row (n puzzle)
    (nth n puzzle))

; returns a list of all the numbers in the nth column of the puzzle
(defun get-col (n puzzle &optional(row 0))
    (let ((element (nth n (get-row row puzzle))))
        (if (null element) element
            (cons element (get-col n puzzle (+ 1 row))))))

; returns a list of all the numbers in the 3x3 block that the element at row and col belong to.
(defun get-block (row col puzzle)
    (if (or (> row 8) (> col 8)) nil
    (let* ((initial-row (* (floor (/ row 3)) 3))
          (initial-col (* (floor (/ col 3)) 3))
          (row1 (get-row initial-row puzzle))
          (row2 (get-row (+ 1 initial-row) puzzle))
          (row3 (get-row (+ 2 initial-row) puzzle))
          (lst1 (cons (nth initial-col row1) (cons (nth (+ 1 initial-col) row1) (list (nth (+ 2 initial-col) row1)))))
          (lst2 (cons (nth initial-col row2) (cons (nth (+ 1 initial-col) row2) (list (nth (+ 2 initial-col) row2)))))
          (lst3 (cons (nth initial-col row3) (cons (nth (+ 1 initial-col) row3) (list (nth (+ 2 initial-col) row3))))))
          (append lst1 lst2 lst3) )))

    
; encode row col and num as a single element.
; example: (encode 1 2 3) returns 123
(defun encode (row col num)
    (+ (* 100 row) (* 10 col) num))


; encode a list in the form (# # #) as an element ###.
; example: (1 2 3) => 123
(defun encode-list (element)
    (let ((row (car element))
          (col (cadr element))
          (num (caddr element)))

          (encode row col num)))


; returns a list of all the elements in the same row as the given element.
; example: given '123 it returns (223 323 423 523 623 723 823 923)
(defun linked-elements-row-helper(element &optional(current-row 1))
    (let ((col (cadr element))
          (num (caddr element)))

    (cond ((> current-row 9) nil)
          ((equal current-row (car element)) (linked-elements-row-helper element (+ 1 current-row)))
          (t (cons (encode current-row col num) (linked-elements-row-helper element (+ 1 current-row)))))))


; returns a list of all the elements in the same col as the given element.
; example: given '123 it returns (113 133 143 153 163 173 183 193)
(defun linked-elements-col-helper(element &optional(current-col 1))
    (let ((row (car element))
          (num (caddr element)))

    (cond ((> current-col 9) nil)
          ((equal current-col (cadr element)) (linked-elements-col-helper element (+ 1 current-col)))
          (t (cons (encode row current-col num) (linked-elements-col-helper element (+ 1 current-col)))))))


(defun linked-elements-block-helper(element)
    (let* ((row (- (car element) 1))
           (col (- (cadr element) 1))
           (num (caddr element))
           (initial-row (+ 1 (* (floor (/ row 3)) 3)))
           (initial-col (+ 1 (* (floor (/ col 3)) 3))))
           
           (remove (encode-list element)
                   (append (list (encode initial-row initial-col num))
                   (list (encode (+ 1 initial-row) initial-col num))
                   (list (encode (+ 2 initial-row) initial-col num))

                   (list (encode initial-row (+ 1 initial-col) num))
                   (list (encode (+ 1 initial-row) (+ 1 initial-col) num))
                   (list (encode (+ 2 initial-row) (+ 1 initial-col) num))

                   (list (encode initial-row (+ 2 initial-col) num))
                   (list (encode (+ 1 initial-row) (+ 2 initial-col) num))
                   (list (encode (+ 2 initial-row) (+ 2 initial-col) num))))))
           

; converts an element to an easier to process list. 
; example: element 123 where 1 is the row number, 2 is the column number,
;          and 3 is the number inserted there is converted to the list (1 2 3).
(defun convert-to-row-col-num (element)
    (let ((row (floor (/ element 100)))
          (col (floor (/ (mod element 100) 10)))
          (num (mod element 10)))

          (cons row (cons col (list num)))))


; returns a list of all the elements linked to a given element.  That is to say, every element in the
; same row, column, or 3x3 block as the given element.
(defun get-linked-elements (element)
    (let ((element-as-list (convert-to-row-col-num element)))
         
         (remove-duplicates 
            (append (linked-elements-block-helper element-as-list) 
                    (linked-elements-row-helper element-as-list)
                    (linked-elements-col-helper element-as-list)))))

(defun get-linked-row-elements (element)
    (let ((element-as-list (convert-to-row-col-num element)))
        
        (remove-duplicates
            (linked-elements-row-helper element-as-list))))


(defun get-linked-col-elements (element)
    (let ((element-as-list (convert-to-row-col-num element)))

        (remove-duplicates
            (linked-elements-col-helper element-as-list))))


(defun get-linked-block-elements (element)
    (let ((element-as-list (convert-to-row-col-num element)))
        
        (remove-duplicates
            (linked-elements-block-helper element-as-list))))

; returns an OR clause made of the given row, col and every possible number (1-9) minus the ones that
; aren't possible in the given puzzle.
(defun row-col-to-or-clause (row col &optional(num 0) (used-numbers '()))
    (cond ((> num 9) '())
          ((= 9 (length used-numbers)) (encode row col (car (set-difference '(1 2 3 4 5 6 7 8 9) used-numbers)))) 
          ((= 0 num) (append (list 'or) (row-col-to-or-clause row col (+ 1 num) used-numbers)))
          (t (if (member num used-numbers)
                (row-col-to-or-clause row col (+ 1 num) used-numbers)
                (append (list (encode row col num)) (row-col-to-or-clause row col (+ 1 num) used-numbers))))))


(defun xor-clause-helper (element-one element-two)
    (list 'or (list 'not element-one) (list 'not element-two)))


(defun xor-clause (lst &optional(one 0) (two 1))
    (cond ((null lst) '())
          ((= one (- (length lst) 1)) '())
          ((equal 'or (nth one lst)) (xor-clause lst (+ 1 one) (+ 2 one)))
          ((= two (length lst)) (xor-clause lst (+ 1 one) (+ 2 one)))
          (t (cons (xor-clause-helper (nth one lst) (nth two lst)) (xor-clause lst one (+ 1 two))))))


; returns a list of clauses which make each of the clauses in
; lst appear exactly once in each cell
(defun xor-cells (lst)
    (cond ((null lst) '())
          ((listp (car lst))
            (if (> (length (car lst)) 1) (append (xor-clause (car lst)) (xor-cells (cdr lst)))))
          (t  (xor-cells (cdr lst)))))


(defun xor-linked-elements-helper (element lst)
    (let ((linked-row-elements (intersection (append (list element) (get-linked-row-elements element)) lst))
          (linked-col-elements (intersection (append (list element) (get-linked-col-elements element)) lst))
          (linked-block-elements (intersection (append (list element) (get-linked-block-elements element)) lst)))
            
            (remove-duplicates (append
                (xor-clause (sort linked-row-elements #'<))
                (xor-clause (sort linked-col-elements #'<))
                (xor-clause (sort linked-block-elements #'<))) :test #'equal)))


(defun xor-linked-elements (lst &optional(full-lst '()))
    (if (null full-lst) (setf full-lst lst))
    (cond ((null lst) '())
          ((equal (car lst) 'or) (xor-linked-elements (cdr lst) full-lst))
          (t (remove-duplicates (append (xor-linked-elements-helper (car lst) full-lst) (xor-linked-elements (cdr lst) full-lst)) :test #'equal))))
         

(defun finalize-cnf (lst)
    (let* ((cell-clauses (xor-cells lst))
           (linked-clauses (xor-linked-elements (flatten lst) )))

        (append lst cell-clauses linked-clauses)))


; helper for the sudoku-to-cnf function.
(defun sudoku-to-cnf-helper (puzzle &optional (row 0) (col 0))
    (let ((element (nth col (get-row row puzzle))))
        (cond ((> row 8) '())
              ((> col 8) (sudoku-to-cnf-helper puzzle (+ 1 row) 0))
              ((equal element 0)
                (cons (row-col-to-or-clause (+ 1 row) (+ 1 col) 0 
                    (remove-duplicates (append (get-row row puzzle) 
                            (get-col col puzzle) 
                            (get-block row col puzzle))))
                        (sudoku-to-cnf-helper puzzle row (+ 1 col))))

              (t (cons (encode (+ 1 row) (+ 1 col) element) (sudoku-to-cnf-helper puzzle row (+ 1 col)))))))


; turns a sudoku puzzle into cnf form.
(defun sudoku-to-cnf (puzzle)
    (if (null puzzle) '()
        (cons 'and (finalize-cnf (sudoku-to-cnf-helper puzzle)))))


; returns a list of the elements between start and end of lst
(defun range (start end lst)
    (if (> start end)  '()
        (cons (nth start lst) (range (+ 1 start) end lst))))


; Returns a sorted list of the elements in the form (SYMBOL T) in the model.
; These correspond to where the numbers in belong in the sudoku puzzle.
(defun get-sudoku-values (model)
    (cond ((null model) '())
          ((null (cadr (car model))) (get-sudoku-values (cdr model)))
          ((cadr (car model)) (sort (cons (car (car model)) (get-sudoku-values (cdr model))) #'<))))


; Returns the num value of every element in a given row.
; These elements are in the form ### where the last # corresponds to the number
; and the first two # corresponds to the row and col where it belongs.
(defun decode-row (row)
    (if (null row) '()
        (cons (mod (car row) 10) (decode-row (cdr row)))))


(defun translate-model-to-sudoku-helper (sudoku-values &optional(current-row 0))
    (cond ((null sudoku-values) '())
          ((> current-row 8) '())
          (t (cons (decode-row (range (* 9 current-row) (+ 8 (* 9 current-row)) sudoku-values)) (translate-model-to-sudoku-helper sudoku-values (+ 1 current-row))))))


(defun translate-model-to-sudoku (model)
    (let ((sudoku-values (get-sudoku-values model)))
        (translate-model-to-sudoku-helper sudoku-values)))


(defun solve-sudoku-puzzle (puzzle)
	(translate-model-to-sudoku (satisfiable (sudoku-to-cnf puzzle))))


(format t "~%Test Cases!~%")

(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test1))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test2))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test3))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test4))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test5))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test6))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test7))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test8))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test8))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test10))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test11))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test12))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test13))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test14))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test15))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test16))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test17))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test18))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test19))
(format t "~{~a ~%~}~%~%" (solve-sudoku-puzzle test20))


