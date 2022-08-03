;;Q1
(define-read-only (get-non-repeating (numbers (list 10 uint)))
   (fold xor (append numbers u2) u2)  ;;appended u2 in list also so xoring with u2 will have no impact on output
)


;;Q2
(define-read-only (get-type (num uint))
    (let ((types (list "even" "odd")) )
    (unwrap-panic (element-at types (mod num u2)))
    )
)