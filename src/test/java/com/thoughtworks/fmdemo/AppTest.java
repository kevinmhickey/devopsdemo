package com.thoughtworks.fmdemo;

import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

public class AppTest {

    @Test
    public void shouldFailBecauseItDoesNothing() {
        assertThat(true, is(false));

    }
}