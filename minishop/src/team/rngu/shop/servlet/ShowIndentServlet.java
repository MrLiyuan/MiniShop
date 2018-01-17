package team.rngu.shop.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.dao.IndentDao;

@WebServlet("/ShowIndentServlet")
public class ShowIndentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ShowIndentServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iid = request.getParameter("id");
		int id = Integer.parseInt(iid);
		
		IndentDao indentDao = new IndentDao();
		Map<String, Object> map = indentDao.getIndentById(id);
		request.setAttribute("showindent", map);
		request.getRequestDispatcher("BackChangeIndent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
