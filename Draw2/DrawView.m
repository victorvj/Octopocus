//
//  DrawView.m
//
//  Created by Hybrid Interaction on 21.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.


#import "DrawView.h"
#import "Dot.h"

@implementation DrawView

@synthesize mX;
@synthesize mY;
@synthesize tangible;
@synthesize angle;





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{


	if(event.allTouches.count ==2){
		
		// X und Y Koordinaten von zwei Beruehrungspunkten
		//NSLog(@"Zwei Berührumgspunkte");
		NSArray *touches = [event.allTouches allObjects];
		CGPoint pointOne = [[touches objectAtIndex:0]locationInView:self];
		CGPoint pointTwo = [[touches objectAtIndex:1]locationInView:self];
		float x1 = pointOne.x;
		float y1 = pointOne.y;
		//NSLog(@"X1: %f", x1);
		//NSLog(@"Y1: %f", y1);
		float x2 = pointTwo.x;
		float y2 = pointTwo.y;
		//NSLog(@"X2: %f", x2);
		//NSLog(@"Y2: %f", y2);
		
		// Distanz der zwei Punkte wird berechnet
		float distance = sqrt(pow(x1 -x2, 2.0f)+pow(y1 -y2, 2.0f));
		// im Label distanceLabel angezeigt
		//NSString *string = [NSString stringWithFormat:(@"%.2f"), distance];
		//distanceLabel.text = string;
		// und auf der Konsole ausgegeben	
		//NSLog(@"Die Distanz zwischen den beiden Punkten betraegt:%f", distance);
		
		// Der Mittelpunkt der zwei Punkte wird berechnet
		float x3=(x2-x1)/2+x1;
		float y3=(y2-y1)/2+y1;
		//  auf der Konsole ausgegeben	
		//NSLog(@"Mittelpunkt der zwei Punkte: X: %f", x3);
		//NSLog(@"Mittelpunkt der zwei Punkte: Y: %f", y3);
		// und gespeichert
		self.mX = x3;
		self.mY = y3;
		
//		
//		
//		int dx = x1 - x2;
//		
//		int dy = y1 - y2;
//		int adx = abs(dx);
//		int ady = abs(dy);
//		if (dy == 0 && dx == 0)
//		{
//			//return 0;
//			NSLog(@"winkel ist 0");
//		}
//		else if (dy == 0 && dx > 0)
//		{
//			//return 0;  
//			NSLog(@"winkel ist 0");
//		}
//		else if (dy == 0 && dx < 0)
//		{
//			//return 180;
//			NSLog(@"winkel ist 180");
//		}
//		else if (dy > 0 && dx == 0)
//		{
//			//return 270;
//			NSLog(@"winkel ist 90");
//		}
//		else if (dy < 0 && dx == 0)
//		{
//			//return 90;
//			NSLog(@"winkel ist 270");
//		}
//		else{
//			double rwinkel = atan2((double)ady, (double)adx);   
//			double dWinkel = 0;
//			
//			if (dx>0 && dy>0)  // 1. Quartal Winkkel von 270° - 359°
//			{
//				dWinkel = (rwinkel* 180 / M_PI);
//			}
//			else if (dx<0 && dy>0)  // 2. Quartal Winkkel von 180° - 269°
//			{
//				dWinkel = 180 - (rwinkel* 180 / M_PI);
//			}
//			else if (dx>0 && dy<0)  // 4. Quartal Winkkel von 90° - 179°
//			{
//				dWinkel =360 - (rwinkel* 180 / M_PI);
//			}
//			else if (dx<0 && dy<0)  // 3. Quartal Winkkel von 0° - 89°
//			{
//				dWinkel =  360 - (180 - (rwinkel* 180 / M_PI));
//			}
//			
//			int iWinkel = (int)dWinkel;
//			
//			if (iWinkel == 360) 
//			{
//				iWinkel = 0;
//			}
//			NSLog(@"winkel ist %i", iWinkel);
//		}
//		
		
		[self setNeedsDisplay];
		
	}
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	

	

	
	if (event.allTouches.count ==2) {
		NSArray *touches = [event.allTouches allObjects];
		CGPoint pointOne = [[touches objectAtIndex:0] locationInView:self];
		CGPoint pointTwo = [[touches objectAtIndex:1] locationInView:self];
		
		float x1 = pointOne.x;
		float y1 = pointOne.y;

		float x2 = pointTwo.x;
		float y2 = pointTwo.y;

		
		float distance = sqrt(pow(x1 -x2, 2.0f)+pow(y1 -y2, 2.0f));
		//NSLog(@"Distanz:%f", distance);
		

		
		if(distance>150.00 && distance < 172.00) {
			tangibleLabel.text = (@"1");
			self.tangible =1;
		}
		else if(distance>230.00 && distance < 260.00){
			tangibleLabel.text = (@"2");
			self.tangible =2;
		}
		else if(distance>111.00 && distance < 150.00){
			tangibleLabel.text = (@"3");
			self.tangible =3;
		}
		else if(distance>80.00 && distance < 110.00){
			tangibleLabel.text = (@"4");
			self.tangible =4;
		}
		else {
			tangibleLabel.text = (@"");
		}
		
		
		// Der Mittelpunkt der zwei Punkte wird berechnet
		float x3=(x2-x1)/2+x1;
		float y3=(y2-y1)/2+y1;
		//  auf der Konsole ausgegeben	
		//NSLog(@"Mittelpunkt der zwei Punkte: X: %f", x3);
		//NSLog(@"Mittelpunkt der zwei Punkte: Y: %f", y3);
		// und gespeichert
		self.mX = x3;
		self.mY = y3;
		//gezeichnet
		
		
		int dx = x1 - x2;
		int dy = y1 - y2;
		int adx = abs(dx);
		int ady = abs(dy);
		double rwinkel = atan2((double)ady, (double)adx);   
		double dWinkel = 0;
		int tWinkel = 0;
		

		if (dy == 0 && dx == 0)
		{
			 tWinkel = 0;
			NSLog(@"winkel ist 0");
		}
		else if (dy == 0 && dx > 0)
		{
			tWinkel = 0;  
			NSLog(@"winkel ist 0");
		}
		else if (dy == 0 && dx < 0)
		{
			tWinkel = 180;
			NSLog(@"winkel ist 180");
		}
		else if (dy > 0 && dx == 0)
		{
			tWinkel = 270;
			NSLog(@"winkel ist 90");
		}
		else if (dy < 0 && dx == 0)
		{
			tWinkel = 90;
			NSLog(@"winkel ist 270");
		}
		else{

			
			if (dx>0 && dy>0)  // 1. Quartal Winkkel von 270° - 359°
			{
				dWinkel = (rwinkel* 180 / M_PI);
			}
			else if (dx<0 && dy>0)  // 2. Quartal Winkkel von 180° - 269°
			{
				dWinkel = 180 - (rwinkel* 180 / M_PI);
			}
			else if (dx>0 && dy<0)  // 4. Quartal Winkkel von 90° - 179°
			{
				dWinkel =360 - (rwinkel* 180 / M_PI);
			}
			else if (dx<0 && dy<0)  // 3. Quartal Winkkel von 0° - 89°
			{
				dWinkel =  360 - (180 - (rwinkel* 180 / M_PI));
			}
			
			tWinkel = (int)dWinkel;
			self.angle = (float)dWinkel;
			
			if (tWinkel == 360) 
			{
				tWinkel = 0;
			}
		}
		
			NSLog(@"winkel ist %f", self.angle);
		int temp = (int)tWinkel/40;
		
		NSString *string = [NSString stringWithFormat:(@"Temperatur: %i"), temp];
		
		
		tempLabel.text = string;
		
		
		[self setNeedsDisplay];
		}
}

-(void)drawRect:(CGRect)rect{



	if(self.mX != 0.0){
	CGContextRef context = UIGraphicsGetCurrentContext();
	//CGContextSetRGBFillColor(context, 100, 149, 237, 1);
		
	//wieder in Bogenmaß umrechnen
	float endAngle = (M_PI*self.angle)/180;
	NSLog(@"endAngle %f", endAngle);
		
	if (self.tangible ==1) {
		float xArg = self.mX - 200.0;
		float yArg = self.mY - 200.0;
		CGContextSetRGBFillColor(context, 100, 149, 237, 1);
		CGContextFillEllipseInRect(context, CGRectMake(xArg, yArg, 400, 400));
		
		/* Kreisumfang berechnen */
		float umfang = (M_PI * 400);

		UIBezierPath* path = [[UIBezierPath alloc] init];
		CGPoint centerPoint = CGPointMake(mX, mY);
		[path moveToPoint:centerPoint];
			
		[path addArcWithCenter:centerPoint radius:(umfang / (2*M_PI)) startAngle:0.0 endAngle:endAngle clockwise:YES];
		[path closePath];
		
		[[UIColor redColor] setFill];
		[path fill];
	}
	else if (self.tangible ==2) {
		float xArg = self.mX - 250.0;
		float yArg = self.mY - 250.0;
		CGContextSetRGBFillColor(context, 255, 255, 000, 1);
		CGContextFillEllipseInRect(context, CGRectMake(xArg, yArg, 500, 500));
		
		/* Kreisumfang berechnen */
		float umfang = (M_PI * 500);
		
		UIBezierPath* path = [[UIBezierPath alloc] init];
		CGPoint centerPoint = CGPointMake(mX, mY);
		[path moveToPoint:centerPoint];
		
		[path addArcWithCenter:centerPoint radius:(umfang / (2*M_PI)) startAngle:0.0 endAngle:endAngle clockwise:YES];
		[path closePath];
		
		[[UIColor redColor] setFill];
		[path fill];
	}
	else if (self.tangible ==3) {
		float xArg = self.mX - 150.0;
		float yArg = self.mY - 150.0;
		CGContextSetRGBFillColor(context, 255, 100, 000, 1);
		CGContextFillEllipseInRect(context, CGRectMake(xArg, yArg, 300, 300));
		
		/* Kreisumfang berechnen */
		float umfang = (M_PI * 300);
		UIBezierPath* path = [[UIBezierPath alloc] init];
		CGPoint centerPoint = CGPointMake(mX, mY);
		[path moveToPoint:centerPoint];
		
		[path addArcWithCenter:centerPoint radius:(umfang / (2*M_PI)) startAngle:0.0 endAngle:endAngle clockwise:YES];
		[path closePath];
		
		[[UIColor redColor] setFill];
		[path fill];
	}
	else if (self.tangible ==4) {
		float xArg = self.mX - 100.0;
		float yArg = self.mY - 100.0;
		CGContextSetRGBFillColor(context, 84, 255, 159, 1);
		CGContextFillEllipseInRect(context, CGRectMake(xArg, yArg, 200, 200));
		
		/* Kreisumfang berechnen */
		float umfang = (M_PI * 200);
		UIBezierPath* path = [[UIBezierPath alloc] init];
		CGPoint centerPoint = CGPointMake(mX, mY);
		[path moveToPoint:centerPoint];
		

		[path addArcWithCenter:centerPoint radius:(umfang / (2*M_PI)) startAngle:0.0 endAngle:endAngle clockwise:YES];
		[path closePath];
		
		[[UIColor redColor] setFill];
		[path fill];
	}
	
		

//		CGMutablePathRef path = CGPathCreateMutable();
//		CGPathMoveToPoint(path, NULL, mX, mY);
//		CGPathAddLineToPoint(path, NULL, 50.0f, 50.0f);
//		CGPathCloseSubpath(path);
//		CGContextSetRGBFillColor(context, 100, 149, 237, 1);
//		CGContextAddPath(context, path);
//		CGContextStrokePath(context);



	}

}

@end
