
(define-public (give-commission (sender principal))
  (ok (as-contract
   (try! (stx-transfer? u60 sender 'ST3PF13W7Z0RRM42A8VZRVFQ75SV1K26RXEP8YGKJ)) ))
)