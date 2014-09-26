int orgX=300;
int orgY=300;
Bacteria [] colony;
Food [] meals;
void setup()
{
  frameRate(20);
  size(600, 600);
  background(0);
  colony = new Bacteria[100];
  meals = new Food[100];
  // for loop for creating bacteria
  for (int i = 0; i< meals.length; i++)
  {
    meals[i]=new Food();
    meals[i].show();
  }
  for (int i = 0; i< colony.length; i++)
  {
    orgX+= (int)(Math.random()*550-225);
    orgY+=(int)(Math.random()*550-225);
    colony[i]=new Bacteria(orgX, orgY);
    orgX=300;
    orgY=300;
  }
}

void draw()
{
  //loop to show food
  for (int i = 0; i< meals.length; i++)
  {
    meals[i].eaten();
  }
  // loop to draw bacteria
  for (int i=0; i<colony.length; i++)
  {
    colony[i].move();
    colony[i].show();
  }
  if (mousePressed==true)
  {
    for (int i = 0; i< meals.length; i++)
    {
      meals[i]=new Food();
      meals[i].show();
    }
  }
}

class Bacteria
{
  float clrRed, clrGreen, clrBlue;
  int bactX, bactY, bactDir, bactSize, oldBactX, oldBactY, bactXDir, bactYDir;

  Bacteria(int x, int y)
  {
    bactSize=10;
    clrRed= (float)(Math.random()*255);
    clrGreen= (float)(Math.random()*255);
    clrBlue= (float)(Math.random()*255);
    bactX=x;
    bactY=y;
    oldBactX=bactX;
    oldBactY=bactY;
    bactXDir= (int)(Math.random()*2);
    bactYDir= (int)(Math.random()*2);
  }
  void show()//creates ellipses
  {
    fill(0);
    ellipse(oldBactX, oldBactY, bactSize+1, bactSize+1);
    fill(clrRed, clrGreen, clrBlue);
    ellipse(bactX, bactY, bactSize, bactSize);
  }
  void move()//moves ellipses
  { 
    //controls direction
    if (bactX> 595)
    {
      bactXDir=1;
    } else if (bactX< 5)
    {
      bactXDir=0;
    }
    if (bactY>595)
    {
      bactYDir=1;
    } else if (bactY< 5)
    {
      bactYDir=0;
    }
    //controls X movement
    if (bactXDir==0)//right
    {
      oldBactX+=bactX-oldBactX;
      bactX+= (int)(Math.random()*3);
    } else if ( bactXDir==1)//left
    {
      oldBactX+=bactX-oldBactX;
      bactX-= (int)(Math.random()*3);
    } 
    //controls Y movement
    if (bactYDir==1)//up
    {
      oldBactY+=bactY-oldBactY;
      bactY-= (int)(Math.random()*3);
    } else if (bactYDir==0)//down
    {
      oldBactY+=bactY-oldBactY;
      bactY+= (int)((Math.random()*3));
    }
  }
}
class Food
{
  boolean isShown;
  int foodX, foodY;

  Food()
  {
    foodX= (int)((Math.random()*900)-300);
    foodY= (int)((Math.random()*900)-300);
    isShown= true;
  }
  void show()
  {
    if (isShown==true)
    {
      fill(255, 255, 255);
      rect(foodX, foodY, 5, 5);
    } else
    {
      fill(0, 0, 0);
      rect(foodX, foodY, 5, 5);
    }
  }
  void eaten()
  {
    if (get(foodX+2, foodY+2) != color(255, 255, 255))
    {
      fill(0, 0, 0);
      rect(foodX, foodY, 5, 5);
    }
  }
}
