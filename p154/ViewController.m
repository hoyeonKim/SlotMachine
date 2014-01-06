//
//  ViewController.m
//  p154
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 100

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;



@end

@implementation ViewController
- (IBAction)selectRandom:(id)sender {
    int r= arc4random()%MAX_NUM;
    int m= arc4random()%MAX_NUM;
    int i= arc4random()%MAX_NUM;
    [self.picker selectRow:r inComponent:0 animated:YES];
    [self.picker selectRow:m inComponent:1 animated:YES];
    [self.picker selectRow:i inComponent:2 animated:YES];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return MAX_NUM;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 100;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    NSString *imagepath = [NSString stringWithFormat:@"c%ld.jpg",row%10+1];
    UIImage *image = [UIImage imageNamed:imagepath];
    UIImageView *imageView;
    if(nil == view){
        imageView=[[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(0, 0, 100, 100);
    }
    else{
        imageView = (UIImageView *)view;
        imageView.image = image;
    }
    return imageView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
