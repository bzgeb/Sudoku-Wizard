;
; #######################
; # Satisfiability.lisp #
; #######################
; prints a hash entry
(defun print-hash-entry (key value)
    (format t "The value associated with the key ~S is ~S~%" key value))


(defun flatten (lst)
    (cond ((atom lst) lst)
          ((listp (car lst)) (append (flatten (car lst)) (flatten (cdr lst))))
          (t (append (list (car lst)) (flatten (cdr lst))))))

;
; returns true is element is a list of my-list.  Also works if element is a list.
(defun list-member(element my-list)
    (cond
        ((null my-list) nil)
        ((equal element (car my-list)) t)
        (t (list-member element (cdr my-list))))
)


; returns a list of all the symbols in a sentence.
(defun collect-literals (sentence &optional (literals '()))
    (cond ((null sentence) literals)
          ;
          ; ignore and, or
          ((equal 'or (car sentence)) (collect-literals (cdr sentence) literals))
          ((equal 'and (car sentence)) (collect-literals (cdr sentence) literals))

          ;
          ; check if the negated symbol is already a member.
          ((equal 'not (car sentence)) 
            (if (list-member (list 'not (cadr sentence)) literals)
                (collect-literals (cddr sentence) literals)
                (collect-literals (cddr sentence) (append literals (list (list 'not (cadr sentence)))))))
             
          ;
          ; if car is a literal..
          ((atom (car sentence))
            ;
            ; and car is a member of literals..
            (if (list-member (car sentence) literals)
                ;
                ; ignore it and move on,
                (collect-literals (cdr sentence) literals)
                ;
                ; otherwise append it to literals and move on.
                (collect-literals (cdr sentence) (append literals (list (car sentence))))
            )
          )

          ;
          ; if car is a list..
          ((listp (car sentence))
            (collect-literals (cdr sentence) (collect-literals (car sentence) literals)))
    )
)

(defun collect-literals2 (sentence)
    (delete 'and (delete 'or(delete 'not (remove-duplicates (flatten sentence) :test #'equal)))))

(defun collect-clauses-helper (sentence)
    (cond
        ((null sentence) '())
        ((equal 'or (car sentence)) (collect-clauses-helper (cdr sentence)))
        ((equal 'and (car sentence)) (collect-clauses-helper (cdr sentence)))
        ((listp (car sentence)) (cons (collect-clauses-helper (car sentence)) (collect-clauses-helper (cdr sentence))))
        (t (cons (car sentence) (collect-clauses-helper (cdr sentence))))
    )
)

;
; returns a sentence without all the "ands" and "ors". This makes it easier to traverse and process a sentence.
(defun collect-clauses (sentence)
    (if (equal (car sentence) 'or)
        (let ((sentence (list sentence)))
            (collect-clauses-helper sentence))
        (collect-clauses-helper sentence))
)


;
; Reference: http://stackoverflow.com/questions/3967320/lisp-function-to-remove-nils
(defun remove-nil-recursively (x)
  (if (listp x)
      (mapcar #'remove-nil-recursively
                  (remove nil x))
          x)
)


;
; returns a list with element removed. Also works if element is a list.
(defun remove2 (element my-list)
    (cond
        ((null my-list) nil)
        ((equal element (car my-list)) (remove2 element (cdr my-list)))
        (t (cons (car my-list) (remove2 element (cdr my-list))))
    )
)


;
; returns a hash table with "element"=>"value" added to it.
(defun extend (element value hash)
    ;(format t "~a : ~{~a ~%~}~%~%" element value)
    (if (listp element)
        (setf (gethash (cadr element) hash) value)

        (setf (gethash element hash) value))
    hash
)


(defun un-extend (element hash)
    (if (listp element)
        (remhash (cadr element) hash)

        (remhash element hash))
        hash
)


;
; returns a sentence in which any positive occurences of element is removed.
; ie. "(not element)" won't be removed, but "element" will.
(defun remove-all-positive-occurences (element my-list)
    (cond
        ((null my-list) '())
        ((listp (car my-list)) (cons (remove-all-positive-occurences element (car my-list)) 
            (remove-all-positive-occurences element (cdr my-list))))

        ((equal 'not (car my-list)) (append (list 'not (cadr my-list)) 
            (remove-all-positive-occurences element (cddr my-list))))

        ((equal element (car my-list)) (remove-all-positive-occurences element (cdr my-list)))

        (t (cons (car my-list) (remove-all-positive-occurences element (cdr my-list))))
    )
)


;
; returns a sentence in which any negative occurences of element is removed.
; ie. "(not element)" will be removed, but "element" won't.
(defun remove-all-negative-occurences (element my-list)
    (cond
        ((null my-list) '())
        ((listp (car my-list)) (cons (remove-all-negative-occurences element (car my-list)) 
            (remove-all-negative-occurences element (cdr my-list))))

        ((equal 'not (car my-list))
            (if (equal element (cadr my-list))
                (remove-all-negative-occurences element (cddr my-list))
                (append (list 'not (cadr my-list)) (remove-all-negative-occurences element (cddr my-list)))
            )
        )

        (t (cons (car my-list) (remove-all-negative-occurences element (cdr my-list))))
    )
)

;
; helper function for find-unit-clause. 
(defun find-unit-clause-helper(clauses model)
    (if (null clauses) '()

    (let ( (clause (car clauses)) ) 
        (cond
            ; if clause is an atom: success! you found a unit clause.
            ((atom clause) clause) 

            ((listp clause)
                (cond 
                    ; if clause is a list of length 1: success! a unit clause.
                    ((= 1 (length clause)) (car clause))
                    ; if clause is length 2 but the car is NOT: success!
                    ((and (equal 'not (car clause)) (= 2 (length clause))) clause)
                    ; otherwise recur
                    (t (find-unit-clause-helper (cdr clauses) model))
            ))
    )))
)



;
; This function returns T if the clause is true or NIL if it's either false or Undecidable.
(defun check-if-clause-is-true (clause model)

    (cond
        ((null clause) nil)

        ;
        ; if an element of a clause is a list, it's a negated symbol, so check it for F.
        ((listp (car clause))
            (if (equal (gethash (cadr (car clause)) model) "F") t
                (check-if-clause-is-true (cdr clause) model)))

        ((equal 'not (car clause))
            (if (equal (gethash (cadr clause) model) "F") t
                (check-if-clause-is-true (cddr clause) model)))

        ; otherwise check it for T.  If T, your clause is true.
        (t (if (equal (gethash (car clause) model) "T") t 
                (check-if-clause-is-true (cdr clause) model)))
    )
)


;
; This function returns T if the clause is false or NIL if it's either True or Undecidable.
(defun check-if-clause-is-false (clause model)

    (cond
        ((null clause) t)

        ; if an element of a clause is a list, it's a negated symbol, so check it for T
        ((listp (car clause))
            (if (equal (gethash (cadr (car clause)) model) "T") (check-if-clause-is-false (cdr clause) model)
                nil))

        ; if the car of the clause is not, it's a negated symbol.
        ((equal 'not (car clause))
            (if (equal (gethash (cadr clause) model) "T") (check-if-clause-is-false (cddr clause) model)
                nil))

        ; otherwise check it for F.
        ((atom (car clause))
            (if (equal (gethash (car clause) model) "F") (check-if-clause-is-false (cdr clause) model)
                nil))
   )
)

;
; returns true if some element of a sentence is false.
(defun check-if-sentence-is-false(clauses model)

    (let ((clause (car clauses)))
    ;(print clause)

    (if (atom clause) (setf clause (list clause)))

    (cond
        ((null clauses) nil)

        ; when the clause is a list, run check-if-clause-is-false on it.
        ((listp clause)
            ; if the clause is false, the sentence is false. hurray!
            (if (check-if-clause-is-false clause model) t
                ; otherwise, keep going.
                (check-if-sentence-is-false (cdr clauses) model)))
    ))
)

;
; returns true if every element of a sentence is true.
(defun check-if-sentence-is-true(clauses model)

    (let ((clause (car clauses)))

    (if (atom clause) (setf clause (list clause)))

    (cond
        ((null clauses) t)

        ((listp clause)
            (if (check-if-clause-is-true clause model) (check-if-sentence-is-true (cdr clauses) model)
                nil))
    ))
)

;
; returns a list with every positive clause removed.
(defun remove-true-clauses(clauses model &optional(untrue-clauses '()))

    (let ((clause (car clauses)))
    (if (atom clause) (setf clause (list clause)))

    (cond
        ; if the model is empty then return
        ((= 0 (hash-table-count model)) clauses)

        ((null clauses) untrue-clauses)

        ((listp clause)
            (if (check-if-clause-is-true clause model)
                (remove-true-clauses (cdr clauses) model untrue-clauses)
                (remove-true-clauses (cdr clauses) model (append untrue-clauses (list clause)))))
    ))
)


;
; helper function for find-pure-symbol.
(defun find-pure-symbol-helper(symbols)
    (let ((my-symbol (car symbols)))

    (cond
        ((null symbols) nil)

        ; if my-symbol is a list, it's a negated symbol.
        ((listp my-symbol) 
            ; if the postive symbol is a member, move on
            (if (list-member (cadr my-symbol) symbols) (find-pure-symbol-helper (cdr (remove2 (cadr my-symbol) symbols)))
                ;otherwise return the pure symbol.
                my-symbol))

        ((atom my-symbol)
            ; if the negative symbol is a member, move on
            (if (list-member (list 'not my-symbol) symbols) 
                (find-pure-symbol-helper (cdr (remove2 (list 'not my-symbol) symbols)))
                my-symbol))
    ))
)


;
; returns the first pure symbol in clauses.
(defun find-pure-symbol(clauses model)
    (if (null clauses) '()

    (let ((cleaned-clauses clauses)
          (symbols '()))

        ;
        ; clean all the assigned symbols.  This could turn some clauses into unit clauses.
        (loop for key being the hash-keys of model 
            using (hash-value value)
            do (if (equal value "F") 
                (setf cleaned-clauses (remove-all-positive-occurences key cleaned-clauses))
                (setf cleaned-clauses (remove-all-negative-occurences key cleaned-clauses))
               )
        )    

        ; clean out any clauses that are already true.
        (setf cleaned-clauses (remove-true-clauses cleaned-clauses model))

        ; get a new list of symbols based on the cleaned clauses.
        (setf symbols (collect-literals cleaned-clauses))

        (find-pure-symbol-helper symbols)
    ))
)


;
; returns the first unit clause.
(defun find-unit-clause(clauses model)
    (if (null clauses) '()

    (let ((cleaned-clauses clauses))

        ;
        ; clean all the assigned symbols.  This could turn some clauses into unit clauses.
        (loop for key being the hash-keys of model 
            using (hash-value value)
            do (if (equal value "F") 
                (setf cleaned-clauses (remove-all-positive-occurences key cleaned-clauses))
                (setf cleaned-clauses (remove-all-negative-occurences key cleaned-clauses))
               )
        )    

       ; clean out any NILs
       (setf cleaned-clauses (remove-nil-recursively cleaned-clauses))

       ; clean out any clauses that are already true
       (setf cleaned-clauses (remove-true-clauses cleaned-clauses model))

       (find-unit-clause-helper cleaned-clauses model)
    ))

)

;
; translates a hash table into a binding list
; ie. (A=>"T" B=>"F") becomes ((A T) (B NIL)).
(defun translate-hash-to-binding-list (hash)
    (let ( (binding-list '()) )
         (loop for key being the hash-keys of hash 
            using (hash-value value)
            do (if (equal value "F") 
                (setf binding-list (append binding-list (list (list key nil))))
                (setf binding-list (append binding-list (list (list key t))))
               )
        )
        binding-list
    ) 
)


;returns true if it finds element in lst.
;works in nested lists.
(defun find-element (element lst)
    (cond ((null lst) '())
          ((listp (car lst)) (or (find-element element (car lst)) (find-element element (cdr lst))))
          ((equal element (car lst)) t)
          (t (find-element element (cdr lst)))))


;
; dpll algorithm.  Checks for satisfiability and returns a model.
; For an explanation see supplied pseudocode.
(defun dpll(clauses symbols model &optional(last-symbol nil))
    (let ((pure-symbol (find-pure-symbol clauses model))
          (unit-clause (find-unit-clause clauses model)))

    (cond
        ((check-if-sentence-is-true clauses model) model)
        ((check-if-sentence-is-false clauses model) (and (un-extend last-symbol model) nil))

        (pure-symbol (if (listp pure-symbol) 
            (dpll clauses (remove2 pure-symbol symbols) (extend (cadr pure-symbol) "F" model))
            (dpll clauses (remove2 pure-symbol symbols) (extend pure-symbol "T" model))))

        (unit-clause (if (listp unit-clause)
            (dpll clauses (remove2 unit-clause symbols) (extend (cadr unit-clause) "F" model))
            (dpll clauses (remove2 unit-clause symbols) (extend unit-clause "T" model))))

        (t (let ((next-symbol (car symbols)))

           (or (dpll clauses (cdr symbols) (extend next-symbol "T" model) next-symbol)
           (dpll clauses (cdr symbols) (extend next-symbol "F" model) next-symbol))))
    ))
)


;
; checks if a sentence is satisfiable.
(defun satisfiable(sentence)
    (let ((clauses (collect-clauses sentence))
        (symbols (collect-literals2 sentence)))
        
        (let ((model (dpll clauses symbols (make-hash-table))))
            (if model (translate-hash-to-binding-list model)
            ;(format t "Not satisfiable~%")
            ))
    )
)




