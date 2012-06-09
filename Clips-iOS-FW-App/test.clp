(deftemplate person "Definition of a Person object" 
    (slot user_firstname) 
    (slot user_cohort) 
    (multislot results) ; I'm trying to pass results back to iOS  through this slot. Dumb? 
) 
; 
;;; ====================================================== 
; 
;;; - - - [Cohort Module] - - - 
; 
(defrule cohort-module-1910 "1910 cohort" 
  (person (user_cohort 1910)) 
  (person (user_firstname ?user_firstname)) 
  (person (results ?results)) 
  => 
  (printout t "Hello, " ?user_firstname ", how are you today?" crlf) 
  (printout t "Tell us about your family's life during World War I." crlf) 
  (assert (results "Tell us about your family's life during World War I.")) 
  ; Do I use these "assert" commands to pass the results of the rules'firings BACK to iOS? 
  ; How do I read these values from iOS? Using DATA_OBJECT? 
) 
