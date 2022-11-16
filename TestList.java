import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertArrayEquals;

public class TestList {
  @Test
  public void testFilter() {
    StringChecker sc = s1 -> s1.contains("Anh");

    List<String> input = new ArrayList<>();
    input.add("Hi");
    input.add("Anh Pham 1");
    input.add("Anh Pham 2");

    List<String> expected = new ArrayList<>();
    expected.add("Anh Pham 1");
    expected.add("Anh Pham 2");

    assertArrayEquals(expected.toArray(), ListExamples.filter(input, sc).toArray());
  }

  // Takes two sorted list of strings (so "a" appears before "b" and so on),
  // and return a new list that has all the strings in both list in sorted order.
  @Test(timeout = 500)
  public void testMerge() {
    List<String> input1 = new ArrayList<>();

    input1.add("Anh Pham 1");
    input1.add("Anh Pham 3");

    List<String> input2 = new ArrayList<>();
    input2.add("Anh Pham 2");
    input2.add("Hi");

    List<String> expected = new ArrayList<>();
    expected.add("Anh Pham 1");
    expected.add("Anh Pham 2");
    expected.add("Anh Pham 3");
    expected.add("Hi");

    assertArrayEquals(expected.toArray(), ListExamples.merge(input1, input2).toArray());
  }

}