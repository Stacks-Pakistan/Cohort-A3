
(impl-trait .customTraitQ3.myCustomTrait)

(define-non-fungible-token privateAsset principal)
(define-map nft-data {owner: principal } {url: (optional (string-ascii 2100)), detail: (optional (string-ascii 2100))})


(define-public (mint (recipient principal) (data {url: (optional (string-ascii 2100)), detail: (optional (string-ascii 2100))})) 
   (begin 
   (try! 
      (nft-mint? privateAsset recipient recipient)  
   )
   (print tx-sender)
   (map-insert nft-data {owner: recipient} data)
   (ok true)
   )

)

(define-public (burn (recipient principal)) 
   (begin 
   (try! 
      (nft-burn? privateAsset recipient recipient)
   )

   (map-delete nft-data {owner: recipient})
   (ok true)
   )

)

(define-read-only (get-token-uri (recipient principal))
    (ok (unwrap! (map-get? nft-data {owner: recipient}) (err "No Data")))
)

(define-read-only (get-owner (recipient principal))
   (if (is-eq (nft-get-owner? privateAsset recipient) none)
    (err none)
    (ok (nft-get-owner? privateAsset recipient))
   )
)

(define-public (transfer (sender principal) (recipient principal))
(begin
   (asserts! (is-eq (unwrap! (nft-get-owner? privateAsset sender) (err u0)) sender) (err u99))
   (try! (nft-transfer? privateAsset sender sender recipient))
   (try! (as-contract (contract-call? .q4 give-commission sender)))
   (ok true)
)
)

(define-public (minti)
(ok tx-sender))