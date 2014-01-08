//
//  ViewController.m
//  p154
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#define MAX_NUM 100

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate>{
    UISegmentedControl *segment;
    int coin;
    NSArray *items;
    int rew, cst;

    
}
@property (weak, nonatomic) IBOutlet UILabel *cost;

@property (weak, nonatomic) IBOutlet UILabel *bet;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UILabel *reward;


@end

@implementation ViewController

-(void)seg:(UISegmentedControl *)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:
            coin=100;
            self.bet.text = [NSString stringWithFormat:@"%d원",coin];
            break;
            case 1:
            coin=200;
            self.bet.text = [NSString stringWithFormat:@"%d원",coin];
            break;
        case 2:
            coin=300;
            self.bet.text = [NSString stringWithFormat:@"%d원",coin];
            break;
            case 3:
            coin=400;
            self.bet.text = [NSString stringWithFormat:@"%d원",coin];
            break;
            case 4:
            coin=500;
            self.bet.text = [NSString stringWithFormat:@"%d원",coin];
            
        default:
            break;
    }
}
- (IBAction)selectRandom:(id)sender {
    int r= arc4random()%MAX_NUM;
    int m= arc4random()%MAX_NUM;
    int i= arc4random()%MAX_NUM;
    [self.picker selectRow:r inComponent:0 animated:YES];
    [self.picker selectRow:m inComponent:1 animated:YES];
    [self.picker selectRow:i inComponent:2 animated:YES];
    
    [self.picker selectedRowInComponent:0];
    
    
    if(r%10==m%10 && m%10==i%10 && i%10==r%10){
        self.label.text =[NSString stringWithFormat: @"잭팟!!! 당첨금액은 %d원 입니다!!",coin*100];
        rew=rew+coin*100;
        cst=cst+coin;
    }
    else if (r%10==m%10){
        self.label.text = [NSString stringWithFormat: @"당첨금액은 %d원 입니다!!",coin*10];
        rew=rew+coin*10;
        cst=cst+coin;
    }
    else if (i%10==m%10){
        self.label.text = [NSString stringWithFormat: @"당첨금액은 %d원 입니다!!",coin*10];
        rew=rew+coin*10;
        cst=cst+coin;
    }
    else if (r%10==i%10){
        self.label.text = [NSString stringWithFormat: @"당첨금액은 %d원 입니다!!",coin*10];
        rew=rew+coin*10;
        cst=cst+coin;
    }
    else{
        self.label.text = @"꽝ㅜㅜ";
        cst=cst+coin;
    }
    
    self.reward.text = [NSString stringWithFormat:@"%d원",rew];
    self.cost.text = [NSString stringWithFormat:@"%d원",cst];


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
    NSString *imagepath = [NSString stringWithFormat:@"c%ld.jpg",row%10];
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
    items = @[@"100원",@"200원",@"300원",@"400원",@"500원"];
    segment = [[UISegmentedControl alloc]initWithItems:items];
    segment.frame = CGRectMake(10, 85,300, 30);
    [self.view addSubview:segment];
    [segment addTarget:self action:@selector(seg:) forControlEvents:UIControlEventValueChanged];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
