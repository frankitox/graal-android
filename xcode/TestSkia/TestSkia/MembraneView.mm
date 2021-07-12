//
//  MembraneView.m
//  TestSkia
//
//  Created by Adrian Smith on 6/13/21.
//

#import "MembraneView.h"
#include "mobiletest-uber.h"

@implementation MembraneView

- (BOOL) canBecomeFirstResponder{
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch* t = [touches anyObject];
    if (t){
        CGPoint pt = [t locationInView:self];
        clj_touch_ended(self.thread, pt.x, pt.y);
//        if (focus && ![self isFirstResponder]){
//            [self becomeFirstResponder];
//        }else if (!focus && [self isFirstResponder]){
//            [self resignFirstResponder];
//        }
    }
}

- (void)deleteBackward{
    clj_delete_backward(self.thread);
}

- (void)insertText:(NSString *)text{
    clj_insert_text(self.thread, (void*)[text UTF8String]);
}

- (BOOL) hasText{
    return NO;
}
@end