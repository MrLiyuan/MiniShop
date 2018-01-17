package team.rngu.shop.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import net.sf.json.JSONObject;
import team.rngu.shop.util.StrUtil;

@WebServlet("/AddGoodsServlet")
public class AddGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddGoodsServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String savePath = "D:"+File.separator+"work"+File.separator+"minishop"+File.separator+"WebContent"+File.separator+"img";
		Collection<Part> parts = request.getParts();
		
		String name = request.getParameter("sub_name");
		String intro = request.getParameter("sub-intro");
		String price = request.getParameter("sub-price");
		String surplus = request.getParameter("sub-surplus");
		String address = request.getParameter("sub-address");
		
		if( parts.size()==1 ){
			Part part = request.getPart("file1");
			String filename = StrUtil.getTimeStr();
			part.write(savePath+File.separator+filename);
			//
		}
		
		/*
		StringBuilder sb = new StringBuilder();
		int i = 0;
		
		for( Part part : parts ){
			String filename = StrUtil.getTimeStr();
			part.write(savePath+File.separator+filename);
			if( i++ != 0 ) sb.append(",");
			sb.append(filename);
		}
		System.out.println(sb.toString());
		//写入数据库 
		 */
	}

}
