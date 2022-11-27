import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertSame;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class TestListMerge {
    // Takes two sorted list of strings (so "a" appears before "b" and so on),
    // and return a new list that has all the strings in both list in sorted order.
    @Test(timeout = 100)
    public void testMergeNoResult() {
        List<String> input1 = new ArrayList<>();
        List<String> input2 = new ArrayList<>();
        List<String> expected = new ArrayList<>();

        assertArrayEquals(expected.toArray(), ListExamples.merge(input1, input2).toArray());
    }

    @Test(timeout = 100)
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

    // TODO: TEST SAME TYPE
    // @Test(timeout = 100)
    // public void testMergeSame() {
    // List<String> input1 = new ArrayList<>();
    // input1.add("Anh Pham 1");
    // input1.add("Anh Pham 3");

    // List<String> input2 = new ArrayList<>();
    // input2.add("Anh Pham 2");
    // input2.add("Hi");

    // List<String> expected = new ArrayList<>();
    // expected.add("Anh Pham 1");
    // expected.add("Anh Pham 2");
    // expected.add("Anh Pham 3");
    // expected.add("Hi");

    // List<String> actual = ListExamples.merge(input1, input2);
    // assertSame(ListExamples.merge(input1, input2), actual);
    // }
}