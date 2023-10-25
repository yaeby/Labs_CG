/*
Adrian Copta | FAF-223
Exercise 1.4
*/

void limit(float max) {
  if (mag() > max) {
    normalize();
    mult(max);
  }
}
