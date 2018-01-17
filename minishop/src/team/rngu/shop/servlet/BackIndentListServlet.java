package team.rngu.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.service.IndentService;

@WebServlet("/BackIndentListServlet")
public class BackIndentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BackIndentListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String pnum = request.getParameter("page");
		IndentService service = new IndentService();
		List<HashMap<String, Object>> list = service.getIndentList(type, pnum);
		
		request.setAttribute("backindentlist",list);
		request.getRequestDispatcher("BackIndentListPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
