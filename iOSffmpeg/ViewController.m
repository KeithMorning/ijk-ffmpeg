//
//  ViewController.m
//  iOSffmpeg
//
//  Created by KeithXi on 2021/4/29ls.
//

#import "ViewController.h"
#import "ffmpeg.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [nsda]
    
//    ffmain(<#int argc#>, <#char **argv#>)
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self download];
    });
    
}

///ffmpeg -protocol_whitelist "file,http,https,rtp,udp,tcp,tls" -f concat -safe 0 -i 1.ffconcat  -vcodec copy -acodec copy tmp.ts
- (void)download{
    
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"ffconcat"];
    NSString *downloadPath = [NSString stringWithFormat:@"%@/%@", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject], @"1.mp4"];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:downloadPath]){
        [[NSFileManager defaultManager] removeItemAtPath:downloadPath error:nil];
    }
    
    int numberOfArgs = 14;
    char** arguments = calloc(numberOfArgs, sizeof(char*));
    
    arguments[0] = "ffmpeg";
    arguments[1] = "-protocol_whitelist";
    arguments[2] = "file,http,https,rtp,udp,tcp,tls";
    arguments[3] = "-f";
    arguments[4] = "concat";
    arguments[5] = "-safe";
    arguments[6] = "0";
    arguments[7] = "-i";
    arguments[8] = (char *)[moviePath UTF8String];
    arguments[9] = "-vcodec";
    arguments[10] = "copy";
    arguments[11] = "-acodec";
    arguments[12] = "copy";
    arguments[13] = (char *)[downloadPath UTF8String];
    
    int result = ffmain(14, arguments);
    NSLog(@"----------- %d", result);
}


@end
