package com.hair.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

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
		
	    public static void SaveFileFromInputStream(InputStream stream,String path,String filename) throws IOException
	    {      
	        FileOutputStream fs=new FileOutputStream( path + "/"+ filename);
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
}
