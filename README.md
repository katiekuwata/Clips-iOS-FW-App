Clips-iOS-FW-App
================

This project is a sample application to demonstrate using Clips-iOS-FW universal framework project. 

Steps created this project
--------------------------
* Clone [Clips-iOS-FW](http://kkuwata@github.sonypictures.com/kkuwata/Clips-iOS-FW.git)  
git clone http://kkuwata@github.sonypictures.com/kkuwata/Clips-iOS-FW.git Clips-iOS-FW

* Ensure the you have the access the Clips-iOS-FW.framework from this project. If you use different project name when you clone the above project, you may have to adjust the framework location.

How to verify
-------------
* After you start the program, click "Do Clips" button.

* You should be able to see the output in the xcode debug window.

TODO
----
* Implement tty terminal.

Sample program output
---------------------
* Running CLIPS...
* (clear)
* (watch facts)
* (watch activations)
* (assert (monkey see))  
==> f-1     (monkey see)
* (facts)  
f-0     (initial-fact)  
f-1     (monkey see)  
For a total of 2 facts.  
* (defrule MONKEY-DO (monkey see) => (assert (monkey do)))  
==> Activation 0      MONKEY-DO: f-1  
* (run)  
==> f-2     (monkey do)
* (facts)  
f-0     (initial-fact)  
f-1     (monkey see)  
f-2     (monkey do)  
For a total of 3 facts.
* (defrule MONKEY-DO-WHAT (monkey do) => (assert (monkey you)))  
==> Activation 0      MONKEY-DO-WHAT: f-2
* (run)  
==> f-3     (monkey you)
* (facts)  
f-0     (initial-fact)  
f-1     (monkey see)  
f-2     (monkey do)  
f-3     (monkey you)  
For a total of 4 facts.
* (retract *)  
<== f-0     (initial-fact)  
<== f-1     (monkey see)  
<== f-2     (monkey do)  
<== f-3     (monkey you)  
* (facts)
* (assert (monkey see))  
==> f-4     (monkey see)  
==> Activation 0      MONKEY-DO: f-4
* (run)  
==> f-5     (monkey do)  
==> Activation 0      MONKEY-DO-WHAT: f-5  
==> f-6     (monkey you)  
* (facts)  
f-4     (monkey see)  
f-5     (monkey do)  
f-6     (monkey you)  
For a total of 3 facts.  

ClipsMM sample program output
-----------------------------
* CLIPS (Quicksilver Beta 5/31/08)
* CLIPS> (clear)
* CLIPS> (watch facts)
* CLIPS> (watch activations)
* CLIPS> (assert (monkey see))  
==> f-1     (monkey see)  
&lt;Fact-1&gt;  
* CLIPS> (defrule MONKEY-DO (monkey see) => (assert (monkey do)))  
==> Activation 0      MONKEY-DO: f-1
* CLIPS> (run)  
==> f-2     (monkey do)
* CLIPS> (facts)  
f-0     (initial-fact)  
f-1     (monkey see)  
f-2     (monkey do)  
For a total of 3 facts.  
* CLIPS>  (defrule MONKEY-DO-WHAT (monkey do) =>  
(assert (monkey you)  
)  
)  
==> Activation 0      MONKEY-DO-WHAT: f-2  
* CLIPS> (run)
==> f-3     (monkey you)  
* CLIPS> (facts)
f-0     (initial-fact)  
f-1     (monkey see)  
f-2     (monkey do)  
f-3     (monkey you)  
For a total of 4 facts.  
* CLIPS> (retract *)  
<== f-0     (initial-fact)  
<== f-1     (monkey see)  
<== f-2     (monkey do)  
<== f-3     (monkey you)  
* CLIPS> (facts)  
* CLIPS> (assert (monkey see))  
==> f-4     (monkey see)  
==> Activation 0      MONKEY-DO: f-4  
&lt;Fact-4&gt;  
* CLIPS> (run)  
==> f-5     (monkey do)  
==> Activation 0      MONKEY-DO-WHAT: f-5  
==> f-6     (monkey you)  
* CLIPS>
