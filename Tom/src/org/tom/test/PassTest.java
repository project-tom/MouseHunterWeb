package org.tom.test;

import java.io.IOException;

import org.com.encryption.PasswordEncryption;
import org.junit.Test;

public class PassTest {
	@Test
	public void passTest() throws IOException {
		String pass = "1234";
		PasswordEncryption passwordEncryption = new PasswordEncryption(pass);
		System.out.println(passwordEncryption.getPass());
	}
}
