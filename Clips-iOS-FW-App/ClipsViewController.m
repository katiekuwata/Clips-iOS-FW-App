//
//  ClipsViewController.m
//  Clips-iOS-FW-App
//
//  Created by Katie Kuwata on 6/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ClipsViewController.h"
#import <Clips-iOS-FW/Clips_iOS_FW.h>
#import <Clips-iOS-FW/clips.h> 

@interface ClipsViewController ()

@end

@implementation ClipsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)runClips:(id)sender {
	printf("Running CLIPS...\n");
	
    //Clips_iOS_FW* obj = [[[Clips_iOS_FW alloc] init] autorelease];
	//float result = [obj calcBMIByHeight:10 weight:20];

    //TestFWCalc *o = [[TestFWCalc alloc] init];
    //[o hello];
    //NSLog(@"\n It is %@.", [o helloString]);
    //[o release];
	
/*	
	// - - - - - CLIPS' functions. - - - - - 
	// Clean up the CLIPS environment. 
	InitializeEnvironment(); 
	Clear();
 
	// Define the location of the rules file inside the app's "bundle" directory: 
    NSString *filePath = [[NSBundle mainBundle] 
						  pathForResource:@"test2" ofType:@"clp"]; 
	
    // Load the content of the rules file: 
    NSData *myData = [NSData dataWithContentsOfFile:filePath]; 
    // 
    // Check to see if there was data to load from the rules file: 
    if (myData) { 
        // 
        NSLog(@"File to load %@", filePath); 
        // 
        // CLIPS seems to require that strings be passed as C type "char" as opposed to iOS' NSString. 
        const unsigned char *clipsFileChar = (const unsigned char *)[filePath cStringUsingEncoding:NSASCIIStringEncoding]; 
        // 
        //============================================================
        // Disable garbage collection. It's only necessary to disable  
        // garbage collection when calls are made into CLIPS from an   
        // embedding program. It's not necessary to do this when the   
        // the calls to user code are made by CLIPS (such as for       
        // user-defined functions) or in the case of this example,     
        // there are no calls to functions which can trigger garbage   
        // collection (such as Send or FunctionCall.                   
        //============================================================ 
        IncrementGCLocks(); 
		
        // Here we load the rules file: 
        Load(clipsFileChar); 
        // 
        // NOW we assert a fact (passed on from the iOS application) 
        // HERE is where you take the record you want to run against the rules file and pass it on to CLIPS! 
        AssertString("(person (user_firstname Mike) (user_cohort 1910)(results Here))"); 
        // 
        // Then we "run" the rules against the fact we passed above: 
        int *numberRulesFired = Run(-1); 
        // 
        // OPEN ITEM: How to receive the text of the rules fired BACK into the iOS app? 
        // 
        // This tells us the number of rules that were activated, or "fired" 
        NSLog(@"Number of rules that fired: %d", numberRulesFired); 
        // 
        // 
        //========================================================== 
        // Enable garbage collection. Each call to IncrementGCLocks  
        // should have a corresponding call to DecrementGCLocks.     
        //========================================================== 
        DecrementGCLocks(); 
        // 
    } 
    else { 
        // 
        // In case the app could not open the file containing the 
	rules: 
        NSLog(@"Could not find file %@", filePath); 
    } 
    // - - - - - 
*/
/*
	Monkey sample got from ClipsMM

	(clear)
    (watch facts)
    (watch activations)
    (assert (monkey see))
    (defrule MONKEY-DO (monkey see) => (assert (monkey do)))
    (run)
    (facts)
    (defrule MONKEY-DO-WHAT (monkey do) => (assert (monkey you)))
    (run)
    (facts)
    (retract *)
    (facts)
    (assert (monkey see))
    (run)
*/
	
    // Clean up the CLIPS environment. 
    InitializeEnvironment(); 
    Clear();
	Watch("facts");
	Watch("activations");

	//============================================================
	// Disable garbage collection. It's only necessary to disable  
	// garbage collection when calls are made into CLIPS from an   
	// embedding program. It's not necessary to do this when the   
	// the calls to user code are made by CLIPS (such as for       
	// user-defined functions) or in the case of this example,     
	// there are no calls to functions which can trigger garbage   
	// collection (such as Send or FunctionCall.                   
	//============================================================ 
	IncrementGCLocks(); 

	// Define the location of the rules file inside the app's "bundle" directory: 
    NSString *filePath1 = [[NSBundle mainBundle] 
						   pathForResource:@"monkey-do" ofType:@"clp"]; 
    NSString *filePath2 = [[NSBundle mainBundle] 
						   pathForResource:@"monkey-do-what" ofType:@"clp"]; 
	
    // Load the content of the rules file: 
    NSData *rule1 = [NSData dataWithContentsOfFile:filePath1]; 
    NSData *rule2 = [NSData dataWithContentsOfFile:filePath2]; 
 
    // Check to see if there was data to load from the rules file: 
    if (rule1) {
		NSLog(@"File to load %@", filePath1); 
		
        // CLIPS seems to require that strings be passed as C type "char" as opposed to iOS' NSString. 
        const unsigned char *clipsFileChar = (const unsigned char *)[filePath1 cStringUsingEncoding:NSASCIIStringEncoding]; 
		
        // NOW we assert a fact (passed on from the iOS application) 
        // HERE is where you take the record you want to run against the rules file and pass it on to CLIPS! 
        AssertString("(monkey see)"); 
		Facts("stdout", NULL, -1, -1, -1);
		
		// Here we load the rules file: 
		Load((char *)clipsFileChar); 
		
		// Then we "run" the rules against the fact we passed above: 
        int *numberRulesFired = Run(-1); 
        // OPEN ITEM: How to receive the text of the rules fired BACK into the iOS app? 
        // This tells us the number of rules that were activated, or "fired" 
        NSLog(@"Number of rules that fired: %d", numberRulesFired); 
		
		Facts("stdout", NULL, -1, -1, -1);
	} else { 
		// In case the app could not open the file containing the 
		NSLog(@"Could not find file %@", filePath1); 
	} 
		
    // Check to see if there was data to load from the rules file: 
    if (rule2) {
		NSLog(@"File to load %@", filePath2); 
		
        // CLIPS seems to require that strings be passed as C type "char" as opposed to iOS' NSString. 
        const unsigned char *clipsFileChar = (const unsigned char *)[filePath2 cStringUsingEncoding:NSASCIIStringEncoding]; 

		// Here we load the rules file: 
		Load((char *)clipsFileChar); 
		
		// Then we "run" the rules against the fact we passed above: 
        int *numberRulesFired = Run(-1); 
        // OPEN ITEM: How to receive the text of the rules fired BACK into the iOS app? 
        // This tells us the number of rules that were activated, or "fired" 
        NSLog(@"Number of rules that fired: %d", numberRulesFired); 
		Facts("stdout", NULL, -1, -1, -1);

		DATA_OBJECT returnValue;
		GetFactList(&returnValue, NULL);
        NSLog(@"Number of facts: %d", returnValue.end + 1); 
		
		Retract(NULL);
		Facts("stdout", NULL, -1, -1, -1);
		
		// NOW we assert a fact (passed on from the iOS application) 
        // HERE is where you take the record you want to run against the rules file and pass it on to CLIPS! 
        AssertString("(monkey see)"); 
		Run(-1);
		Facts("stdout", NULL, -1, -1, -1);
	} else { 
		// In case the app could not open the file containing the 
		NSLog(@"Could not find file %@", filePath2); 
	} 
	
	//========================================================== 
	// Enable garbage collection. Each call to IncrementGCLocks  
	// should have a corresponding call to DecrementGCLocks.     
	//========================================================== 
	DecrementGCLocks(); 
	
}
@end
