//
//  TestXmlViewController.m
//  TestXml
//
//  Created by  on 12/4/6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TestXmlViewController.h"

@interface TestXmlViewController ()

@end

@implementation TestXmlViewController

-(void)parseButtonPressed:(id)sender
{
    NSString *path =[[NSBundle mainBundle] pathForResource:@"test.xml" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    xmlParser.delegate = self;
    [xmlParser parse];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(10, 10, 100, 30);
    [self.view addSubview:but];
    [but setTitle:@"parse" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(parseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

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

#pragma mark - NSXMLParserDelegate

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"didStartElement elementName %@", elementName);
    for(id key in attributeDict)
    {
        NSLog(@"attribute %@", [attributeDict objectForKey:key]);
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"foundCharacters %@", string);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"didEndElement elementName %@", elementName);    
}

@end
