package team.rngu.shop.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import team.rngu.shop.service.IndentService;

@WebServlet("/GoodsBuyServlet")
public class GoodsBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GoodsBuyServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IndentService service = new IndentService();
		StringBuffer sb = new StringBuffer();
		BufferedReader reader = request.getReader();
		PrintWriter out = response.getWriter();
		String line = null;
		
		while( (line=reader.readLine())!=null ){
			sb.append(line);
		}
		System.out.println(sb.toString());
		JSONObject ret = service.buyGoods(sb.toString());
		out.println(ret);
	}

}
