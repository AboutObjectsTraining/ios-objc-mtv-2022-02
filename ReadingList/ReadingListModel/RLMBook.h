#import <Foundation/Foundation.h>
#import <ReadingListModel/ReadingListModel.h>

extern const struct RLMBookKeys {
    NSString * __unsafe_unretained title;
    NSString * __unsafe_unretained year;
    NSString * __unsafe_unretained author;
} RLMBookKeys;


@class RLMAuthor;

@interface RLMBook : RLMModelObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, retain) RLMAuthor *author;

@end
