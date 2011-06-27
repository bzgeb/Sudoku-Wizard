(load "satisfiable.lisp")
(load "satisfiable-test-cases.lisp")

;##############
;# Unit Tests #
;##############

;(if (satisfiable '(and A B))
;    (format t "PASSED")
;    (format t "FAILED"))

;(if (satisfiable '(or A (not A)))
;    (format t "PASSED")
;    (format t "FAILED"))

;(defparameter *my-hash* (make-hash-table))
;(setf (gethash 'A *my-hash*) "F")
;(setf (gethash 'F *my-hash*) "T")
;(setf (gethash 'B *my-hash*) "F")
;(setf (gethash 'D *my-hash*) "F")
;
;(format t "( ~{~a ~}) ~%" (collect-literals '(a b a c d)))
;(format t "( ~{~a ~}) ~%" (collect-literals '(a (or b c)  (or b d))))
;(format t "( ~{~a ~}) ~%" (collect-literals '(and a (or a a) (or b c) d e (or (not e) f) (or g (not e) h))))
;(format t "( ~{~a ~}) ~%" (collect-clauses '(and a (or a a) (or b c) d e (or (not e) f) (or g a h))))
;(format t "~a ~%" (find-unit-clause (collect-clauses '(and (or (not a) a) (not b) (or b c) (or (not e) f) (or g a h))) *my-hash*))
;(format t "( ~{~a ~}) ~%" (find-unit-clause (collect-clauses '(and (not b) (or b c) (or (not e) f) (or g a h))) *my-hash*))
;
;(format t "~a ~%" (check-if-sentence-is-false '( A B (C D) (E F)) *my-hash* )) ;should return true
;(format t "~a ~%" (check-if-sentence-is-false '( A (C D) (E F)) *my-hash* )) ;should return false
;(format t "~a ~%" (check-if-sentence-is-false '( (B B) (C D) (E F)) *my-hash* )) ;should return true
;(format t "~a ~%" (check-if-sentence-is-false '( ((not A) D) (C D) (E F)) *my-hash* )) ;should return true
;(format t "~a ~%" (check-if-sentence-is-false '( (A D) (C D) (E F)) *my-hash* )) ;should return false
;(format t "~a ~%" (check-if-sentence-is-false '( (not A)  (C D) (E F)) *my-hash* )) ;should return true
;(format t "~a ~%" (check-if-sentence-is-true '( A (not D) ) *my-hash* )) ;should return true
;
;(format t "~a ~%" (find-pure-symbol '( A (C (not D)) (E F) ((not A) (not C)) A ) *my-hash* )) 

;(format t "~a ~%~%" (satisfiable '(and A (or A B C) D G)))
;(format t "~a ~%~%" (satisfiable '(and (or A (not A)))))
;(format t "~a ~%~%" (satisfiable '(and A (or A B) (or E D))))
;(format t "~a ~%~%" (satisfiable '(and A (or A B) (or E D F) (or F (not A)))))
;(format t "~a ~%~%" (satisfiable '(and (not A) (or A B C) (or (not E) D F) (or F (not A)) (or B (not A)) )))
;(format t "~a ~%~%" (satisfiable '(and (not A) (or A B C) (or (not B) (not C)) (or (not A) B (not C)))))
;(format t "~a ~%~%" (satisfiable '(and (not A) (or A B C) (or (not B) (not C)) (or (not A) B (not C)))))
;(format t "~a ~%~%" (satisfiable '(and (not A) (or A B C) (or (not B) (not C)) (or (not A) B (not C)))))
;(format t "~a ~%~%" (satisfiable '(and (not A) (or A B C) (or (not B) (not C)) (or (not A) B (not C)))))
;(format t "~a ~%~%" (satisfiable '(and (not A) (or A B C) (or (not B) (not C)) (or (not A) B (not C)) (or G H) (or (not G) H) (or F E (not A)) (or E Z) (or Y X) (or Z X) (or T Q W) (or (not Q) T) (or B U H) )))
;
;(format t "~a ~%~%" (satisfiable '(and A (not A) )))
;(format t "~a ~%~%" (satisfiable '(and (or A (not A)) (not A) (or C X Z) A )))
;(format t "~a ~%~%" (satisfiable '(and (or B C) (not C) (or Z) (not B) )))
;(format t "~a ~%~%" (satisfiable '(and (or B C (not D)) (or (not B) (not C)) (or Z D) (or D B) (not B) (not D) )))
;(format t "~a ~%~%" (satisfiable '(and (or B C D) (or Z T D) (or H J L) (or (not B) (not C) (not H)) (not D) (or (not Z) H) (or (not B) D) (or B D) )))
;
;(format t "~a ~%~%" (satisfiable '(and A B C D (or (not A) (not D)) (or C (not D)) )))
;(format t "~a ~%~%" (satisfiable '(and (or A B) (or (not A) C) (or D (not E)) (or F (not G)) (or (not F) A) (or G F) (or (not D) (not A)) (or (not C) E) )))
;(format t "~a ~%~%" (satisfiable '(and (not B) (not D) (or B C D) C (or (not C) D) )))
;(format t "~a ~%~%" (satisfiable '(and (or A C X) (or C D X) (or H J Z) (or B H I) (or T U Y) (not C) (not A) (not X) )))
;(format t "~a ~%~%" (satisfiable '(and (or P O) (or P J) (or P Z) (or P O J) (not P) (or (not J) (not O)) )))

(format t "Each test will return a model if satisfiable, otherwise NIL~%~%")

(format t "Test01: ~a ~%~%" (satisfiable test01))
(format t "Test02: ~a ~%~%" (satisfiable test02))
(format t "Test03: ~a ~%~%" (satisfiable test03))
(format t "Test04: ~a ~%~%" (satisfiable test04))
(format t "Test05: ~a ~%~%" (satisfiable test05))
(format t "Test06: ~a ~%~%" (satisfiable test06))
(format t "Test07: ~a ~%~%" (satisfiable test07))
(format t "Test08: ~a ~%~%" (satisfiable test08))
(format t "Test09: ~a ~%~%" (satisfiable test09))
(format t "Test10: ~a ~%~%" (satisfiable test10))
(format t "Test11: ~a ~%~%" (satisfiable test11))
(format t "Test12: ~a ~%~%" (satisfiable test12))
(format t "Test13: ~a ~%~%" (satisfiable test13))
(format t "Test14: ~a ~%~%" (satisfiable test14))
(format t "Test15: ~a ~%~%" (satisfiable test15))
(format t "Test16: ~a ~%~%" (satisfiable test16))
(format t "Test17: ~a ~%~%" (satisfiable test17))
(format t "Test18: ~a ~%~%" (satisfiable test18))
(format t "Test19: ~a ~%~%" (satisfiable test19))
(format t "Test20: ~a ~%~%" (satisfiable test20))
(format t "Test21: ~a ~%~%" (satisfiable test21))
(format t "Test22: ~a ~%~%" (satisfiable test22))
(format t "Test23: ~a ~%~%" (satisfiable test23))
(format t "Test24: ~a ~%~%" (satisfiable test24))
(format t "Test25: ~a ~%~%" (satisfiable test25))
(format t "Test26: ~a ~%~%" (satisfiable test26))
(format t "Test27: ~a ~%~%" (satisfiable test27))
(format t "Test28: ~a ~%~%" (satisfiable test28))
(format t "Test29: ~a ~%~%" (satisfiable test29))
(format t "Test30: ~a ~%~%" (satisfiable test30))
