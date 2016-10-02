//
//  SelectSoundTableViewController.m
//  Clock
//
//  Created by willard on 2016/10/2.
//  Copyright © 2016年 willard. All rights reserved.
//

#import "SelectSoundTableViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SelectSoundTableViewController () {
    AVAudioPlayer *audioPlayer;
}

@property (nonatomic) NSMutableArray *musics;
@end

@implementation SelectSoundTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _musics = [NSMutableArray arrayWithArray:@[@"super_mario_bros",
                                               @"love_me_like_you_do",
                                               @"super_ringtone",
                                               @"ppap",
                                               @"frozen"]];

}

- (void)playMusicAtIndex:(NSUInteger)index {
    if (audioPlayer.isPlaying) {
        [audioPlayer pause];
    }

    NSString *path = [[NSBundle mainBundle] pathForResource:_musics[index] ofType:@"mp3"];
    NSURL *file = [NSURL fileURLWithPath:path];    
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:nil];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _musics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reuseIdentifier = @"SelectSoundTableViewCell";
    UITableViewCell *cell;
    
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier] ;
    }
    
    // cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSString *title = _musics[indexPath.row];
    NSMutableArray *texts = [NSMutableArray arrayWithArray:
                             [title componentsSeparatedByString:@"_"]];
    for (int i = 0 ; i < texts.count; i++ ) {
        texts[i] = [texts[i] capitalizedString];
    }
    
    
    cell.textLabel.text = [texts componentsJoinedByString:@" "];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self playMusicAtIndex:indexPath.row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
