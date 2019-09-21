;(DEFINE (ISATOM ARG)(AND (EQ? (LIST? ARG) #f) (EQ? (PAIR? ARG) #f)))
;(DEFINE (ISPAIR ARG)(AND (EQ? (LIST? ARG) #f) (EQ? (PAIR? ARG) #t) (ISATOM (CDR ARG))))

; Check if argument is atom
(DEFINE (ISATOM ARG)(COND ((EQ? (LIST? ARG) #f) (
                                                 COND ((EQ? (PAIR? ARG) #f) #t)
                                                      (#t #f)))
                           (#t #f)))

; Check if argument is pair
(DEFINE (ISPAIR ARG)(COND ((EQ? (LIST? ARG) #f) (
                                                 COND ((EQ? (PAIR? ARG) #t)(
                                                                             COND ((ISATOM (CDR ARG)) #t)
                                                                                  (#t #f)))
                                                      (#t #f)))
                          (#t #f)))

; Check if argument is falsy value
(DEFINE (FALSE ARG)(COND ((ISATOM ARG) #t)
                         ((ISPAIR ARG) #t)
                         (#t #f)))

; XOR function
(DEFINE (XOR A B)(COND ((EQ? (FALSE A) #t) (
                                              COND ((EQ? (FALSE B) #f) #t)
                                                   (#t #f)))
                       ((EQ? (FALSE B) #t) (
                                              COND ((EQ? (FALSE A) #f) #t)
                                                   (#t #f)))
                       (#t #f)))

(XOR '1 '1)
(XOR '1 '())
(XOR '1 '(2))
(XOR '1 '(2 . 3))
(XOR '1 '(2 3 4 . 5))
(XOR '() '())
(XOR '() '(1))
(XOR '() '(1 . 2))
(XOR '() '(1 2 . 3))
(XOR '(1) '(1))
(XOR '(1) '(1 . 2))
(XOR '(1) '(1 2 . 3))
(XOR '(1 . 2) '(1 . 2))
(XOR '(1 . 2) '(1 2 . 3))
(XOR '(1 2 . 3) '(1 2 . 3))