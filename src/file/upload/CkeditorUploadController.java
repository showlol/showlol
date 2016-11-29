package file.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
public class CkeditorUploadController {
	private static final String DEFAULT_SUB_FOLDER_FORMAT_AUTO = "yyyyMMddHHmmss";	// 占쎌뵠沃섎챷占� 占쎌뵠�뵳占�
	private static final int UPLOAD_FILE_SIZE = 2*1024*1024;	// 占쎌뵠沃섎챷占� 占쎄텢占쎌뵠筌앾옙 甕곕뗄�맄	
	
	@RequestMapping("/upload")
	public String uplodaImg(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("upload") MultipartFile upload) throws IllegalStateException, IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String callback = request.getParameter("CKEditorFuncNum");

		String fileName = upload.getOriginalFilename();
		fileName = fileName.substring(0, fileName.lastIndexOf("."));
		String uploadContentType = upload.getContentType();

		String expandedName = "";
		// 占쎌뵠沃섎챷占� 占쎈툡占쎈빜野껋럩�뒭 �뵳�뗪쉘
		if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {
			// IE6 upload jpg 占쎌뵬占쎈르 headimageContentType ==> image/pjpeg塋딉옙
			// IE9 占쎌깏占쏙옙 占쎈뼄�몴占� �뇡�슢�뵬占쎌뒭占쏙옙 upload jpg ==> image/jpeg
			expandedName = ".jpg";
		} else if (uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")) {
			// IE6 png 占쎌뵬占쎈르 headimageContentType ==>"image/x-png"
			expandedName = ".png";
		} else if (uploadContentType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (uploadContentType.equals("image/bmp")) {
			expandedName = ".bmp";
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'',"
					+ "'占쎌뵠沃섎챷占� 占쎈솁占쎌뵬占쎌뵠 占쎈툡占쎈뻸占쎈빍占쎈뼄塋딉옙 .jpg/.gif/.bmp/.png占쎈솁占쎌뵬塋딉옙');");
			out.println("</script>");
			return null;
		}
		// 占쎈솁占쎌뵬 占쎄쾿疫뀐옙 占쎌젫占쎈립 2M
		if (upload.getSize() > UPLOAD_FILE_SIZE) {
			out.println("<script type=\"text/javascript\">");    
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," 
					+ "'占쎈솁占쎌뵬占쎄쾿疫꿸퀗占� 2M 癰귣��뼄 占쎄껑占쎈빍占쎈뼄.');");   
			out.println("</script>");
			return null;
		}
		// ============================================================================
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/img");
		File file = new File(uploadPath);
		if (!file.exists()) { // 占쎈쨨占쎈쐭 占쎈씨占쎌뱽 野껋럩�뒭, 占쎈쨨占쎈쐭 占쎄문占쎄쉐
			file.mkdirs();
		}
		DateFormat df = new SimpleDateFormat(DEFAULT_SUB_FOLDER_FORMAT_AUTO);
		fileName = df.format(new Date()) + expandedName;	// 占쎈솁占쎌뵬筌륅옙
		File toFile = new File(uploadPath, fileName);

		upload.transferTo(toFile);
		System.out.println(uploadPath+ "\\" + fileName);
		// ============================================================================
		out.println("<script type=\"text/javascript\">");
		out.println(
				"window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + "/upload/img/" + fileName + "','')");
		out.println("</script>");
		return null;
	}
}


