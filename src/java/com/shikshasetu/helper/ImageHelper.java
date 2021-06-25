package com.shikshasetu.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author SantDeveloper
 */
public class ImageHelper {

    static Boolean r = null;

    public static Boolean imageDelete(String path) {
       try{
            File f = new File(path);
        r = f.delete();
       }catch(Exception e)
       {
           e.printStackTrace();
       }
        return r;
    }

    public static Boolean imageSave(InputStream is, String path) {
        try {
            byte[] b = new byte[is.available()];
            is.read(b);
            FileOutputStream fos= new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            r=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }

}
