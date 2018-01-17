package team.rngu.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.GoodsClass;
import team.rngu.shop.service.GoodsService;

@WebServlet("/BackClassServlet")
public class BackClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BackClassServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GoodsService service = new GoodsService();
		List<GoodsClass> list = service.getGoodsClassList();
		
		request.setAttribute("classlist", list);
		request.getRequestDispatcher("BackGoodsClassListPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
