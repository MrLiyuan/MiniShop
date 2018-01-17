package team.rngu.shop.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.service.IndentService;

@WebServlet("/PersonIndentServlet")
public class PersonIndentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PersonIndentServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		IndentService service = new IndentService();
		List<HashMap<String, Object>> list = service.getBuyerIndent(Integer.parseInt(id));
		
		request.setAttribute("buyerindentlist", list);
		request.getRequestDispatcher("PersonIndentPage.jsp").forward(request, response);
	}

}
