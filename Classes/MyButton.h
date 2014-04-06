//
//  MyButton.h
//  Tap it
//
//  Created by Tony Albor on 12/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyButton : UIButton
{
    UIImageView *image;
    bool hidden;
    bool selected;
}

-(void)hide;
-(void)show;

@end
