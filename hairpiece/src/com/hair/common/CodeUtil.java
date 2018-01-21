package com.hair.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.hair.model.Image;
import com.hair.model.Pagination;

public class CodeUtil {
	  
	   public static String  getFixCode(int  max){
		    if(max  <= 9 ){
		    	return "-0" + max;
		    }else{
		    	return  "-" + max ;
		    }
	   }
	   
		public static void initPagination(Pagination pagination ) {
			if ((pagination.getTotal() % pagination.getPageSize()) == 0) {
				pagination.setPageIndex(pagination.getTotal() / pagination.getPageSize());
			} else {
				pagination.setPageIndex(pagination.getTotal() / pagination.getPageSize() + 1);
			}

		}
		
		public static  File getExcelDemoFile(String fileDir) throws Exception{
			String classDir = null;
			String fileBaseDir = null;
			File file = null;
			classDir = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
			fileBaseDir = classDir.substring(0, classDir.lastIndexOf("classes"));
			
			file = new File(fileBaseDir+fileDir);
			if(!file.exists()){
				throw new Exception("文件不存在");
			}
			return file;
		}
		
	    public static void SaveFileFromInputStream(MultipartFile pic ) throws IOException
	    {      
	    	String osName =  System.getProperty("os.name");
        	String path =  System.getProperty("user.dir")  ;
        	if(osName.toUpperCase().startsWith("MAC")) {
//        		int  splitIndex = System.getProperty("user.dir").lastIndexOf(System.getProperty("file.separator"));
//        		path = System.getProperty("user.dir").substring(0, splitIndex);
        		path="/Users/wangyoujun/Desktop/smd/WebContent/image";
        	}else{
        		path="D:\\image";
        	}
        	InputStream stream = pic.getInputStream();
	        FileOutputStream fs=new FileOutputStream( path + "/"+ pic.getOriginalFilename());
	        byte[] buffer =new byte[1024*1024];
	        int bytesum = 0;
	        int byteread = 0; 
	        while ((byteread=stream.read(buffer))!=-1)
	        {
	           bytesum+=byteread;
	           fs.write(buffer,0,byteread);
	           fs.flush();
	        } 
	        fs.close();
	        stream.close();      
	    }

		public static void SaveFileFromInputStream(MultipartFile file,
				Image image) throws IOException {
			String osName =  System.getProperty("os.name");
        	String path =  System.getProperty("user.dir")  ;
        	if(osName.toUpperCase().startsWith("MAC")) {
//        		int  splitIndex = System.getProperty("user.dir").lastIndexOf(System.getProperty("file.separator"));
//        		path = System.getProperty("user.dir").substring(0, splitIndex);
        		path="/Users/wangyoujun/Desktop/smd/WebContent/image";
        	}else{
        		path="C:\\soft\\images";
        	}
        	InputStream stream = file.getInputStream();
        	image.setIpath(path);
	        FileOutputStream fs=new FileOutputStream( path + "/"+ image.getIname());
	        byte[] buffer =new byte[1024*1024];
	        int bytesum = 0;
	        int byteread = 0; 
	        while ((byteread=stream.read(buffer))!=-1)
	        {
	           bytesum+=byteread;
	           fs.write(buffer,0,byteread);
	           fs.flush();
	        } 
	        fs.close();
	        stream.close();  
		}  
		
		public static String utfStr(String str) {
			try {
				if(StringUtils.isNotEmpty(str)) {
					str = new String (str.getBytes("ISO-8859-1"),"utf-8");
				  }
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return str ;
		}
}
