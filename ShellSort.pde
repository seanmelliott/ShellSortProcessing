// Shell Sort, visualised //<>//
// Sean M Elliott, September 2019

float[] values;

int gap;
int curr;
int j;
int back;
boolean backstep;
float temp;

void setup() {
  int newPos;
  size(400, 300); // Screen size

  values = new float[width/10]; 
  // The rectangles are 10 wide, 
  // so divide screen width by 10 
  // for total number of values.

  gap = values.length/2;
  curr = gap;
  j = curr;
  backstep = false;
  // Initialise the gap length;

  // Start by making values range with same difference between each.
  for (int i=0; i < values.length; i++) {
    values[i] = (height/(float(values.length)))*(i+1); // Cast length from int to float.
  }

  // Now shuffle the values.
  for (int i = 0; i < values.length; i++) {
    newPos = int(random(values.length));
    swap(values, i, newPos);
  }
}


void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

// Insertion sort step.
// Check value on left. Move if smaller.

void sortStep() {

  delay(40); // Adjust for timing
  println("curr", curr, "j", j, "gap", gap, "Length", values.length);

  if ( gap > 0) 
  { 
    if ( j >= gap && values[j-gap] > values[j])
    {
      backstep = true;
      swap(values, j, j-gap); 
      j -= gap;
      return;
    } else {    
      backstep = false;
      curr += 1;
      if (curr == values.length) {
        gap /= 2;
        curr = gap;
      }
      j = curr;
      return;
    }
  } 


  println("Finished sorting");
  noLoop();
}




void draw() {
  background(255); // Background colour.

  // One step of the sorting algorithm.
  sortStep(); 

  // Choose colour and draw rectangle.
  // If the value is being moved, make it red.
  // Otherwise, gray.
  stroke(255); // White outline

  if (backstep == false) {
    for (int i = 0; i < values.length; i++) {
      if (i == curr || i == curr-gap) {
        if (gap == 0)
          fill(100);
        else
          fill(255, 0, 0); // Red rectangle
      } else {
        fill(100); // Gray rectangle
      }
      rect((i*10), height-values[i], 10, values[i]);
    }
  } else {
    for (int i = 0; i < values.length; i++) {
      if (i == j || i == j+gap) {
        fill(255, 0, 0); // Red rectangle
      } else {
        fill(100); // Gray rectangle
      }
      rect((i*10), height-values[i], 10, values[i]);
    }
  }
}
