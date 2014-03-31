/*
  ARSafariActivity.m

  Copyright (c) 2013 Alex Ruperez
 
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


#import "ARSafariActivity.h"

@implementation ARSafariActivity

- (NSString *)activityType
{
	return NSStringFromClass([self class]);
}

- (UIImage *)activityImage
{
	NSString *activityType = [self activityType];
	NSString *filename = [NSString stringWithFormat:@"%@.bundle/%@", activityType, activityType];

	if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending)
	{
		// iOS6 icon from iconfinder.com and added by @banaslee
		filename = [filename stringByAppendingString:@"-iOS6"];
	}

	return [UIImage imageNamed:filename];
}

- (NSString *)activityTitle
{
	return NSLocalizedStringFromTableInBundle(@"Open in Safari", NSStringFromClass([self class]), [self bundle], nil);
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
	for (id activityItem in activityItems)
    {
		if ([activityItem isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:activityItem])
        {
			return YES;
		}
	}
    
	return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems)
    {
		if ([activityItem isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:activityItem])
        {
			self.url = activityItem;
		}
	}
}

- (void)performActivity
{
    bool completed = NO;
	
	if (self.url)
    {
		completed = [[UIApplication sharedApplication] openURL:self.url];
	}
    
    [self activityDidFinish:completed];
}

- (NSBundle *)bundle
{
	NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:NSStringFromClass([self class]) withExtension:@"bundle"];
	if (bundleURL)
    {
		return [NSBundle bundleWithURL:bundleURL];
	}

	return [NSBundle mainBundle];
}

@end
