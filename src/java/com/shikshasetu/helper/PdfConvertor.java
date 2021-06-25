package com.shikshasetu.helper;

import java.io.File;
import java.io.FileOutputStream;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.InputStream;

public class PdfConvertor {

    public InputStream convertPdf(InputStream[] a ,String path) {
        InputStream is=null;
//        String FILE_NAME = "E:\\java\\h.pdf";
        Document document = new Document();
        try {
            PdfWriter Par = PdfWriter.getInstance(document, new FileOutputStream(new File(path)));
            document.open();
            Paragraph p = new Paragraph();
            p.add("Text 1");
            p.setAlignment(Element.ALIGN_CENTER);
            document.add(p);
            Paragraph p2 = new Paragraph();
            p2.add("Text 2"); //no alignment
            document.add(p2);
            Font f = new Font();
            f.setStyle(Font.BOLD);
            f.setSize(8);
            document.add(new Paragraph("This is my paragraph 3", f));
            Image image1 = Image.getInstance("D:\\entertainment\\h.jpg");
            // Fixed Positioning
            image1.setAbsolutePosition(0, 0);
            // Scale to new height and new width of image
            image1.scaleAbsolute(600, 800);
            document.add(Image.getInstance(image1));
            document.close();
            //par.close();
            System.out.println("Done");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return is;
    }
}
