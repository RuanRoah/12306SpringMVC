package com.my12306.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public final class GetCalImg
{
    private GetCalImg(){}
    
 
    private static Random random = new Random();
   
    

    private static Color getRandomColor()
    {
        return new Color(random.nextInt(255),random.nextInt(255),
                random.nextInt(255));
    }
    
    
    private static Color getReverseColor(Color c)
    {
        return new Color(255 - c.getRed(), 255 - c.getGreen(),
                255 - c.getBlue());
    }
   
    static String res="";
    
    public static String res(){
    	return res;
    }
 
    
    public static void outputCaptcha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        response.setContentType("image/jpeg");

        GetString gets=new GetString();
        res=gets.getRandomString();
        request.getSession(true).setAttribute("randomString",res);
        
        int width = 100;
        int height = 30;

        Color color = getRandomColor();
        Color reverse = getReverseColor(color);

        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics2D g = bi.createGraphics();
        g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        g.setColor(color);
        g.fillRect(0, 0, width, height);
        g.setColor(reverse);
        g.drawString(res, 18, 20);
        for (int i = 0, n = random.nextInt(100); i < n; i++) 
        {
            g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
        }

        
        ServletOutputStream out = response.getOutputStream();
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        encoder.encode(bi);
        out.flush();
    }
}