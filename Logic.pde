int CountNeighbours(int x, int y)
{
  int count = 0;
  if(x != 0 && y != 0)
  {
    count += Life[x - 1][y - 1];
  }
  if(y != 0)
  {
    count += Life[x][y - 1];
  }
  if(x + 1 != Stulp && y != 0)
  {
    count += Life[x + 1][y - 1];
  }
  if(x != 0)
  {
    count += Life[x - 1][y];
  }
  if(x + 1 != Stulp)
  {
    count += Life[x + 1][y];
  }
  if(x != 0 && y + 1 != Eil)
  {
    count += Life[x - 1][y + 1];
  }
  if(y + 1 != Eil)
  {
    count += Life[x][y + 1];
  }
  if(x + 1 != Stulp && y + 1 != Eil)
  {
    count += Life[x + 1][y + 1];
  }
  
  return count;
}

void UpdateLife() // Updates The grid
{
    int[][] Copy = CopyArray();
    
    for(int x = 0; x < Stulp;x++)
    {
      for(int y = 0; y < Eil;y++)
      {
        int count = CountNeighbours(x,y);
        if(Life[x][y] == 1)
        {    
          if(count < 2 || count > 3) Copy[x][y] = 0;
        }
        else
        {
          if(count == 3) Copy[x][y] = 1;
        }
      }
    }   
    Life = Copy;
}

int x_temp = -1;
int y_temp = -1;

void EditGrid()
{ 
  if(mousePressed == true)
  {
    int x = mouseX/Dydis,
        y = mouseY/Dydis;
        
    if(x != x_temp || y != y_temp)
    {
      if(Life[x][y] == 1) // Alive -> Dead
      { 
        Life[x][y] = 0;
      }
      else // Dead -> Alive
      {
        Life[x][y] = 1;
      }
      
      x_temp = x;
      y_temp = y;
    }
  }
  else 
  {
    x_temp = -1;
    y_temp = -1;
  }
}

int[][] CopyArray()
{
  int[][] Copy = new int[Stulp][Eil];
  
  for(int x = 0; x < Stulp;x++)
  {
    for(int y = 0; y < Eil;y++)
    {
      Copy[x][y] = Life[x][y];
    }
  }  
  
  return Copy;
}
