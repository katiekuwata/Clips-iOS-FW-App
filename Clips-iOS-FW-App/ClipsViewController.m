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
	printf("I an CLIPS");
	
    //Clips_iOS_FW* obj = [[[Clips_iOS_FW alloc] init] autorelease];
	//float result = [obj calcBMIByHeight:10 weight:20];

    TestFWCalc *o = [[TestFWCalc alloc] init];
    [o hello];
    NSLog(@"\n It is %@.", [o helloString]);
    [o release];
	
	
	// - - - - - CLIPS' functions. - - - - - 
    // 
    // Clean up the CLIPS environment. 
    InitializeEnvironment(); 
    Clear();
	
	
	// Define the location of the rules file inside the app's "bundle" directory: 
    NSString *filePath = [[NSBundle mainBundle] 
						  pathForResource:@"test" ofType:@"clp"]; 
	
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
        /*============================================================*/ 
        /* Disable garbage collection. It's only necessary to disable 
		 */ 
        /* garbage collection when calls are made into CLIPS from an 
		 */ 
        /* embedding program. It's not necessary to do this when the 
		 */ 
        /* the calls to user code are made by CLIPS (such as for        */ 
        /* user-defined functions) or in the case of this example,        */ 
        /* there are no calls to functions which can trigger garbage 
		 */ 
        /* collection (such as Send or FunctionCall.        */ 
        /*============================================================*/ 
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
        /*==========================================================*/ 
        /* Enable garbage collection. Each call to IncrementGCLocks */ 
        /* should have a corresponding call to DecrementGCLocks.        */ 
        /*==========================================================*/ 
        DecrementGCLocks(); 
        // 
    } 
    else { 
        // 
        // In case the app could not open the file containing the 
	rules: 
        NSLog(@"Could not find file %s", filePath); 
    } 
    // - - - - - 
	
}
@end
