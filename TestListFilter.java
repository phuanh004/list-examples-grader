import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertSame;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class TestListFilter {
    // Returns a new list that has all the elements of the input list for which
    // the StringChecker returns true, and not the elements that return false, in
    // the same order they appeared in the input list;

    @Test(timeout = 100)
    public void testFilterNoResult() {
        StringChecker sc = s1 -> s1.contains("0");

        List<String> input = new ArrayList<>();
        input.add("Hi");
        input.add("Anh Pham 1");
        input.add("Anh Pham 2");

        List<String> expected = new ArrayList<>();

        assertArrayEquals(expected.toArray(), ListExamples.filter(input, sc).toArray());
    }

    @Test(timeout = 100)
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

    // TODO: Test same type
    // @Test(timeout = 100)
    // public void testFilterSame() {
    // StringChecker sc = s1 -> s1.contains("Anh");

    // List<String> input = new ArrayList<>();
    // input.add("Hi");
    // input.add("Anh Pham 1");
    // input.add("Anh Pham 2");

    // List<String> expected = new ArrayList<>();
    // expected.add("Anh Pham 1");
    // expected.add("Anh Pham 2");

    // List<String> actual = ListExamples.filter(input, sc);

    // for (int i = 0; i < expected.size(); i++) {
    // assertSame(expected.get(i), actual.get(i));
    // }

    // assertSame(actual, ListExamples.filter(expected, sc));
    // }
}
