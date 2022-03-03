// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

const UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .bottom = 8,
    .left = 12,
    .right = 12
};

@interface CLNCoolViewCell ()
@property (getter=isHighlighted, nonatomic) BOOL highlighted;
@property (class, readonly, nonatomic) NSDictionary *textAttributes;
@end

@implementation CLNCoolViewCell

// FIXME: When we override one designated initalizer, we should override all.

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (void)configureLayer {
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.borderWidth = 3;
    self.layer.cornerRadius = 9;
    self.layer.masksToBounds = YES;
}

+ (NSDictionary *)textAttributes {
    return @{
        NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
        NSForegroundColorAttributeName : UIColor.whiteColor
    };
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = self.isHighlighted ? 0.5 : 1.0;
}

- (void)setText:(NSString *)text {
    _text = [text copy];
    [self sizeToFit];
}

// MARK: - Animation

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1 size:CGSizeMake(120, 240)];
}

- (void)configureBounceAnimationWithSize:(CGSize)size {
    [UIView modifyAnimationsWithRepeatCount:5 autoreverses:YES animations:^{
        CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
        self.transform = CGAffineTransformRotate(translation, M_PI_2);
    }];
}

- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    [UIView animateWithDuration:duration
                     animations:^{ [self configureBounceAnimationWithSize:size]; }
                     completion:^(BOOL finished) { self.transform = CGAffineTransformIdentity; }];
}

// MARK: - Drawing and resizing

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}

- (void)drawRect:(CGRect)rect {
    CGPoint origin = { CLNTextInsets.left, CLNTextInsets.top };
    [self.text drawAtPoint:origin withAttributes:self.class.textAttributes];
}

// MARK: - UIResponder methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
    // The above line translates into the following: [self setHighlighted:YES];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    touch.view.frame = CGRectOffset(touch.view.frame, deltaX, deltaY);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
}

@end
