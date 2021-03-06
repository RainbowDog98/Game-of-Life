int Dydis = 20;
int Stulp = 0;
int Eil = 0;
int[][] Life;

void setup()
{
  size(900,800);
  //fullScreen();
  background(0);
  Stulp = width/Dydis;
  Eil = height/Dydis;
  Life = CreateGrid(Stulp,Eil); // Random generated grid
  //Life = CreateEmptyGrid(Stulp,Eil); // Empty grid
}

boolean keypressed = true; // Will make the game enter "edit" mode automaticly

void draw()
{
  if(keyPressed && key == 'e') // edit mode
  { 
    keypressed = true;
  }
  
  if(keypressed)
  {
    frameRate(60);
    DrawGrid();
    EditGrid();
    if(keyPressed && key == 'r')  keypressed = false; 
  }
  else
  {
    frameRate(20); //<>//
    UpdateLife();
    DrawGrid();
    keypressed = false;
  }
}
