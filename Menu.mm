#import <UIKit/UIKit.h>

// ربط المتغيرات مع ملف Tweak.x
extern bool godModeEnabled;
extern bool unlockAllEnabled;
extern bool speedHackEnabled;

@interface ColorRoadMenu : NSObject
+ (void)showMenu;
@end

@implementation ColorRoadMenu

+ (void)showMenu {
    // إنشاء نافذة صغيرة عائمة فوق اللعبة
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        UIView *menuView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 250, 300)];
        menuView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        menuView.layer.cornerRadius = 10;
        [window addSubview:menuView];
        
        // عنوان القائمة
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 250, 30)];
        titleLabel.text = @"Color Road Hack Menu";
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [menuView addSubview:titleLabel];
        
        // 1. زر عدم الموت
        UISwitch *godSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 60, 0, 0)];
        [godSwitch addTarget:self action:@selector(toggleGodMode:) forControlEvents:UIControlEventValueChanged];
        [menuView addSubview:godSwitch];
        
        UILabel *godLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, 150, 30)];
        godLabel.text = @"God Mode (لا تموت)";
        godLabel.textColor = [UIColor whiteColor];
        [menuView addSubview:godLabel];
        
        // 2. زر فتح كل شيء
        UISwitch *unlockSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 120, 0, 0)];
        [unlockSwitch addTarget:self action:@selector(toggleUnlock:) forControlEvents:UIControlEventValueChanged];
        [menuView addSubview:unlockSwitch];
        
        UILabel *unlockLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 120, 150, 30)];
        unlockLabel.text = @"Unlock All (فتح الكل)";
        unlockLabel.textColor = [UIColor whiteColor];
        [menuView addSubview:unlockLabel];

        // 3. زر السرعة الخارقة
        UISwitch *speedSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 180, 0, 0)];
        [speedSwitch addTarget:self action:@selector(toggleSpeed:) forControlEvents:UIControlEventValueChanged];
        [menuView addSubview:speedSwitch];
        
        UILabel *speedLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 180, 150, 30)];
        speedLabel.text = @"Speedhack (سرعة)";
        speedLabel.textColor = [UIColor whiteColor];
        [menuView addSubview:speedLabel];
    });
}

+ (void)toggleGodMode:(UISwitch *)sender { godModeEnabled = sender.isOn; }
+ (void)toggleUnlock:(UISwitch *)sender { unlockAllEnabled = sender.isOn; }
+ (void)toggleSpeed:(UISwitch *)sender { speedHackEnabled = sender.isOn; }

@end

// استدعاء القائمة تلقائياً عند تشغيل التطبيق
__attribute__((constructor))
static void loadMenu() {
    [ColorRoadMenu showMenu];
}
