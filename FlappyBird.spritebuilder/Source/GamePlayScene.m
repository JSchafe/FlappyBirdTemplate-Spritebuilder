#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    timeSinceObstacle = 0.0f;
    [self addObstacle];
}

-(void)update:(CCTime)delta
{
    // put update code here
    //increment the time since last obtacle
    timeSinceObstacle += delta; //delta is about 1/60 sec
    
    //check if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        //add new obstacle
        [self addObstacle];
        
        //reset timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}
@end
