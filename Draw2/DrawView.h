//
//  DrawView.h
//
//  Created by Hybrid Interaction on 21.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface DrawView : UIView {

	int tangible;
	float mX;
	float mY;
	float angle;
	IBOutlet UILabel *tempLabel;
	
	IBOutlet UILabel *tangibleLabel;
	


}

@property (readwrite, assign) float mX;
@property (readwrite, assign) float mY;
@property (readwrite, assign) float angle;
@property (readwrite, assign) int tangible;



@end
