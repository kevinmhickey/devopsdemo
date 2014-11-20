package com.thoughtworks.fmdemo;

import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

public class AppTest {

    @Test
    public void shouldPassBecauseThatIsGoodToo() {
        assertThat(true, is(true));

    }

	@Test
	public void shouldFailToTestCI() {
		assertThat(false, is(true));
	}
}
