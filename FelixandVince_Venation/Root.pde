class Root {

  ArrayList<Auxin> closestAuxins;

  PVector pos;

  float radius;
  float age;
  float chainLen;

  Root(PVector startPoint) {

    pos = startPoint;
    radius = 10;
    closestAuxins = new ArrayList<Auxin>();
    age = 1;
    chainLen = 1;
  }

  void grow() {

    PVector towardsAuxins = new PVector(0, 0);
    PVector averageDirection = new PVector(0, 0);
    PVector newPos = new PVector(0, 0);

    for (Auxin auxin : closestAuxins) {

      towardsAuxins = PVector.sub(auxin.pos, pos);

      averageDirection.add(towardsAuxins);
    }

    averageDirection.normalize();

    averageDirection.mult(radius*0.5);

    newPos = PVector.add(pos, averageDirection);

    rootAdditions.add(new Root(newPos));

    //    age += 0.05;

    //    radius = closestAuxins.size();
    //radius = 50/allRoots.size();
    chainLen = closestAuxins.size()/10;
  }

  void display() {
    if (allAuxins.size() > 0) {
      //      age += chainLen/(chainLen+100);
      age += 0.05;
    }
    radius = age;

    stroke(255);
    strokeWeight(radius);

    point(pos.x, pos.y);

    strokeWeight(0.1);
    for (Auxin auxin : closestAuxins) {
      line(pos.x, pos.y, auxin.pos.x, auxin.pos.y);
    }
  }
}

