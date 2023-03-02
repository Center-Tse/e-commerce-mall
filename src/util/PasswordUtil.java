package util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class PasswordUtil {
    
    public static String encryptPassword(String password){
        return md5Encrypt(md5Encrypt(password).substring(8,24));
    }
    private static String md5Encrypt(String str){
        String result = null;
        try {

            MessageDigest md = MessageDigest.getInstance("MD5");

            md.update(str.getBytes());


            result =  new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args){
        System.out.println(encryptPassword("123456"));
    }
}
