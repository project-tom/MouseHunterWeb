package org.com.encryption;

import java.io.IOException;

public class PassGenerator {

	public static void main(String[] args) throws IOException {
		PasswordEncryption passwordEncryption = new PasswordEncryption("hahahahb");
		System.out.println(passwordEncryption.getPass());
	}

}
