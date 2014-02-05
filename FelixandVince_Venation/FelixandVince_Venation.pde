
// Venation and Growth sketch
// Felix and Vince 2014
// based off the paper by runions et al.
// http://algorithmicbotany.org/papers/venation.sig2005.pdf

// declare arraylist of Auxins

ArrayList<Auxin> allAuxins;

// declare arraylist of Root Particles

ArrayList<Root> allRoots;

ArrayList<Root> rootAdditions;

ArrayList<Integer> deadAuxinIds;

int closestId = -1;

float distance;
float currentClosest;

void setup() {
  size(1280, 800);
  background(40);

  // initialise random arraylist of auxins

  allAuxins = new ArrayList<Auxin>();

  //  //set all positions of auxins
  //  for (int i = 0; i < 2000; i++) {
  //    allAuxins.add(new Auxin(new PVector(random(width), random(height))));
  //  }

  //set all positions of auxins
  for (int i = 0; i < 150; i++) {
    for (int j = 0; j < 70; j++) {
      allAuxins.add(new Auxin(new PVector(i*width/150, j*height/70)));
    }
  }


  // initialise first Root particle

  allRoots = new ArrayList<Root>();

  rootAdditions = new ArrayList<Root>();

  deadAuxinIds = new ArrayList<Integer>();

  allRoots.add(new Root(new PVector(width/2, height/2)));
}

void draw() {
  background(40);

  // attributes the roots with all of their closest auxins


  for (int a = 0; a < allAuxins.size(); a++) {

    currentClosest = width+height;
    closestId = -1;

    for (int r = 0; r < allRoots.size(); r++) {

      distance = PVector.dist(allAuxins.get(a).pos, allRoots.get(r).pos);

      if (distance < currentClosest) {
        currentClosest = distance;
        closestId = r;
      }

      if (distance < 10) {
        deadAuxinIds.add(a);
        //println("auxin removed");
      }
    }

    // add closest auxin to root particles closest list

    allRoots.get(closestId).closestAuxins.add(allAuxins.get(a));

    allAuxins.get(a).display();
  }

  // grow roots with respect to their closest Auxins

  for (Root root : allRoots) {

    // if the root particle has at least one auxin to grow towards

    if (root.closestAuxins.size() > 0) {

      root.grow();
    }

    root.display();

    // clear roots auxin list for next iteration

    root.closestAuxins.clear();
  }

  // add the new root particles to the list

  for (Root root : rootAdditions) {
    allRoots.add(root);
  }
  rootAdditions.clear();

  // delete used up auxins

  for (int i = 0; i < deadAuxinIds.size(); i++) {
    allAuxins.remove(deadAuxinIds.get(i)-i);
  }

  deadAuxinIds.clear();
}

