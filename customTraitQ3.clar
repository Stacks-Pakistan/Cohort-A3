(define-trait myCustomTrait
    (
        ;; instantiate an asset
        (mint (principal {url: (optional (string-ascii 2100)), detail: (optional (string-ascii 2100))}) (response bool uint))

        ;;removes ownership
        (burn (principal) (response bool uint))

        ;; URI for metadata associated with the token 
        (get-token-uri (principal) (response {url: (optional (string-ascii 2100)), detail: (optional (string-ascii 2100))} (string-ascii 20)))

        ;;returns owner
        (get-owner (principal) (response (optional principal) (optional principal)))
 
        ;; Transfer from the sender to a new principal
        (transfer (principal principal) (response bool uint))
    )
)