package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.dao.IndentDao;

@WebServlet("/OutGoodsServlet")
public class OutGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OutGoodsServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iid = request.getParameter("id");
		int id = Integer.parseInt(iid);
		
		IndentDao indentDao = new IndentDao();
		indentDao.updateIndentState(id);
		response.sendRedirect("BackIndentListServlet?type=0&page=1");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
