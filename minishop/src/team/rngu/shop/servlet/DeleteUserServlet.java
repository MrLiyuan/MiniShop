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
import team.rngu.shop.service.BuyerService;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUserServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();
		String line = null;
		BuyerService service = new BuyerService();
		BufferedReader reader = request.getReader();
		PrintWriter out = response.getWriter();
		
		while( (line=reader.readLine())!=null ){
			sb.append(line);
		}
		JSONObject ret = service.delBuyer(sb.toString());
		out.println(ret);
	}

}
