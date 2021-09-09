/* Cell.java skeleton 
   Student Name: (PUT YOUR NAME HERE)
   UIN: (PUT YOUR UIN HERE)
   (ACKNOWLEDGE ANY HELP RECEIVED HERE)
   On my honor, as an Aggie, I have neither given nor received any unauthorized
   aid on any portion of the academic work included in this assignment.
*/

import java.lang.Iterable;
import java.util.Iterator;
import java.util.NoSuchElementException;

// Cell class: 15 points
// give correct class header - given in the problem statement
public final class Cell<E> { // modify this header
  // private fields
  private E elem;
  private Cell<E> next;

  // (5 points) constructor
  public Cell (E elem, Cell<E> next) {  } 

  // (5 points) iterator() returns a CellIterator object for this object
  public CellIterator<E> iterator() {  }

  // (5 points) getter and setter methods for the private fields
  public E getVal() {  } 
  public void setVal(E v) {  } 
  public Cell<E> getNext() {  } 
  public void setNext(Cell<E> node) { } 

  //*** CellIterator as an inner class: 20 points
  // (2 points) correct class header - given in the problem statement
  class CellIterator<E> { // modify this header
    private Cell<E> p;  // also given

    // (3 points) constructor
    public CellIterator (Cell<E> n) {  }

    // (15 points) methods to implement the Iterator interface
    // (5 points) hasNext()
    public boolean hasNext() {  } 

    // (10 points) next()
    public E next() {  }    

  } // end of CellIterator
} // end of Cell

