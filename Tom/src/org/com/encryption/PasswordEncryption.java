package org.com.encryption;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryption {
	private String pass;
    private String key = "";
    
    public PasswordEncryption(String msg) throws IOException{
        try {        	
        	////usr/local/apache-tomcat-8.5.39/webapps/ROOT
        	File file = new File("/passKey/key.txt");
        	FileReader filereader = new FileReader(file);
            int singleCh = 0;
            while((singleCh = filereader.read()) != -1){
                key += (char)singleCh;
            }
            filereader.close();
            
        	pass = encryption(msg , key);
        	
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
    public static String encryption(String pass, String key) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        pass = key + pass;
        md.update(pass.getBytes());
        return bytesToHex(md.digest());
    }

    private static String bytesToHex(byte[] bytes){
        StringBuilder builder = new StringBuilder();
        for (byte b: bytes){
            builder.append(String.format("%02x",b));
        }
        return  builder.toString();
    }
    public String getPass() {
        return pass;
    }
}
