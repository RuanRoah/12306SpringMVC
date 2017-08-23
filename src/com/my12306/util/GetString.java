package com.my12306.util;

import java.util.Random;

public class GetString {
	private static final char[] CHARS = { '2', '3', '4', '5', '6', '7', '8',
        '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M',
        'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	
	
	private static Random random = new Random();
	/*private static Random random_1 = new Random();
	private static Random random_2 = new Random();
	*/
	
    public static String getRandomString()
    {
        StringBuffer buffer = new StringBuffer();
        for(int i = 0; i < 6; i++)
        {
            buffer.append(CHARS[random.nextInt(CHARS.length)]);
        }
        return buffer.toString();
    }
    
}
