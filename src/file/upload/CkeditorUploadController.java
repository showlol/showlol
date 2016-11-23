package file.upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
public class CkeditorUploadController {
	private static final String DEFAULT_SUB_FOLDER_FORMAT_AUTO = "yyyyMMddHHmmss";	// �씠誘몄� �씠由�
	private static final int UPLOAD_FILE_SIZE = 2*1024*1024;	// �씠誘몄� �궗�씠利� 踰붿쐞	
	
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
		// �씠誘몄� �븘�땺寃쎌슦 由ы꽩
		if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {
			// IE6 upload jpg �씪�븣 headimageContentType ==> image/pjpeg竊�
			// IE9 �샊�� �떎瑜� 釉뚮씪�슦�� upload jpg ==> image/jpeg
			expandedName = ".jpg";
		} else if (uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")) {
			// IE6 png �씪�븣 headimageContentType ==>"image/x-png"
			expandedName = ".png";
		} else if (uploadContentType.equals("image/gif")) {
			expandedName = ".gif";
		} else if (uploadContentType.equals("image/bmp")) {
			expandedName = ".bmp";
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'',"
					+ "'�씠誘몄� �뙆�씪�씠 �븘�떃�땲�떎竊� .jpg/.gif/.bmp/.png�뙆�씪竊�');");
			out.println("</script>");
			return null;
		}
		// �뙆�씪 �겕湲� �젣�븳 2M
		if (upload.getSize() > UPLOAD_FILE_SIZE) {
			out.println("<script type=\"text/javascript\">");    
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",''," 
					+ "'�뙆�씪�겕湲곌� 2M 蹂대떎 �겱�땲�떎.');");   
			out.println("</script>");
			return null;
		}
		// ============================================================================
		String uploadPath = request.getSession().getServletContext().getRealPath("upload/img");
		File file = new File(uploadPath);
		if (!file.exists()) { // �뤃�뜑 �뾾�쓣 寃쎌슦, �뤃�뜑 �깮�꽦
			file.mkdirs();
		}
		DateFormat df = new SimpleDateFormat(DEFAULT_SUB_FOLDER_FORMAT_AUTO);
		fileName = df.format(new Date()) + expandedName;	// �뙆�씪紐�
		File toFile = new File(uploadPath, fileName);

		upload.transferTo(toFile);
		System.out.println(uploadPath+ "\\" + fileName);
		// ============================================================================
		out.println("<script type=\"text/javascript\">");
		out.println(
				"window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + "upload/img/" + fileName + "','')");
		out.println("</script>");
		return null;
	}
}
