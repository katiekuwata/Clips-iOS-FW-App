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
* 2012-06-13 15:32:20.747 Clips-iOS-FW-App[118:707] File to load /var/mobile/Applications/839242F5-BAD5-4039-8D5D-117DD4C3A3E9/Clips-iOS-FW-App.app/monkey-do.clp
* ==> f-1     (monkey see)
* f-0     (initial-fact)
* f-1     (monkey see)
* For a total of 2 facts.
* ==> Activation 0      MONKEY-DO: f-1
* ==> f-2     (monkey do)
* 2012-06-13 15:32:20.759 Clips-iOS-FW-App[118:707] Number of rules that fired: 1
* f-0     (initial-fact)
* f-1     (monkey see)
* f-2     (monkey do)
* For a total of 3 facts.
* 2012-06-13 15:32:20.765 Clips-iOS-FW-App[118:707] File to load /var/mobile/Applications/839242F5-BAD5-4039-8D5D-117DD4C3A3E9/Clips-iOS-FW-App.app/monkey-do-what.clp
* ==> Activation 0      MONKEY-DO-WHAT: f-2
* ==> f-3     (monkey you)
* 2012-06-13 15:32:20.771 Clips-iOS-FW-App[118:707] Number of rules that fired: 1
* f-0     (initial-fact)
* f-1     (monkey see)
* f-2     (monkey do)
* f-3     (monkey you)
* For a total of 4 facts.
* 2012-06-13 15:32:29.175 Clips-iOS-FW-App[118:707] Number of facts: 4
* <== f-0     (initial-fact)
* <== f-1     (monkey see)
* <== f-2     (monkey do)
* <== f-3     (monkey you)
* ==> f-4     (monkey see)
* ==> Activation 0      MONKEY-DO: f-4
* ==> f-5     (monkey do)
* ==> Activation 0      MONKEY-DO-WHAT: f-5
* ==> f-6     (monkey you)
* f-4     (monkey see)
* f-5     (monkey do)
* f-6     (monkey you)
* For a total of 3 facts.

ClipsMM sample program output
-----------------------------
* CLIPS (Quicksilver Beta 5/31/08)
* CLIPS> (clear)
* CLIPS> (watch facts)
* CLIPS> (watch activations)
* CLIPS> (assert (monkey see))
* ==> f-1     (monkey see)
* &lt;Fact-1&gt;
* CLIPS> (defrule MONKEY-DO (monkey see) => (assert (monkey do)))
* ==> Activation 0      MONKEY-DO: f-1
* CLIPS> (run)
* ==> f-2     (monkey do)
* CLIPS> (facts)
* f-0     (initial-fact)
* f-1     (monkey see)
* f-2     (monkey do)
* For a total of 3 facts.
* CLIPS>  (defrule MONKEY-DO-WHAT (monkey do) =>
* (assert (monkey you)
* )
* )
* ==> Activation 0      MONKEY-DO-WHAT: f-2
* CLIPS> (run)
* ==> f-3     (monkey you)
* CLIPS> (facts)
* f-0     (initial-fact)
* f-1     (monkey see)
* f-2     (monkey do)
* f-3     (monkey you)
* For a total of 4 facts.
* CLIPS> (retract *)
* <== f-0     (initial-fact)
* <== f-1     (monkey see)
* <== f-2     (monkey do)
* <== f-3     (monkey you)
* CLIPS> (facts)
* CLIPS> (assert (monkey see))
* ==> f-4     (monkey see)
* ==> Activation 0      MONKEY-DO: f-4
* &lt;Fact-4&gt;
* CLIPS> (run)
* ==> f-5     (monkey do)
* ==> Activation 0      MONKEY-DO-WHAT: f-5
* ==> f-6     (monkey you)
* CLIPS>

