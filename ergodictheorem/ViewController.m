//
//  ViewController.m
//  ergodictheorem
//
//  Created by GM on 2018/3/21.
//  Copyright © 2018年 GM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)ergodicNSDIC{
    NSDictionary * dict = @{@"1":@"11",@"2":@"22",@"3":@"44"};
    NSArray * keysArr = [dict allKeys];
    for (int i =0 ; i< keysArr.count ; i++){
        NSString * key = keysArr[i];
        NSString * value  = [dict objectForKey:key];
        NSLog(@"key==%@:value==%@\n",key,value);
    }
    
    for (NSString * key in dict){
        NSString * value =[dict objectForKey:key];
        NSLog(@"value===%@",value);
    }
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        if ([obj isEqualToString:@"_I"]) {
            
            *stop = YES;
            
        }
        
    }];
}
- (void)ergodicARR{
    NSArray *iosArray = @[@"L",@"O",@"V",@"E"];
    for (int i = 0 ;i<iosArray.count ; i++){
        NSLog(@"arr[%d]==%@",i,iosArray[i]);
    }
    
 /*   其中nextObject是关键方法，它返回枚举里的下一个对象。
    每次调用改方法其，其内部结构都会更新，使得下一次调用方法时能返回下一个对象。
    等到枚举中全部的对象都已经返回之后，在调用就会返回nil，表示达到了枚举的末端。*/
   /* 优点：代码更易读，不需要定义额外的数组；
    
    缺点：1、无法直接获取遍历操作的下标，需要另外声明变量记录；
    
    2、需要自行创建NSEnumerator对象，稍显麻烦。*/
    NSEnumerator  * enumerator = [iosArray objectEnumerator ];//正向遍历
  //  NSEnumerator  * enumeratorReverse = [iosArray reverseObjectEnumerator];//反向遍历
    id object;
    while ((object = [enumerator nextObject])!=nil) {
        
        NSLog(@" object = %@",object);
    }
   /* 总结优缺点：
    
    优点：语法简洁，使用方便，效率高；
    
    缺点：1、无法方便获取当前遍历的下标；
    
    2、无法在遍历过程中修改被遍历的collection，否则会导致崩溃。
    
*/
    for(NSString * obj in iosArray){
        NSLog(@"%@", obj);
    }
    [iosArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"obj==%@\nidx==%lu\nstop==%d",obj ,(unsigned long)idx,*stop);
        
        if ([obj isEqualToString:@"_I"]) {
            
            *stop = YES;
            
        }
    }];

}
@end
