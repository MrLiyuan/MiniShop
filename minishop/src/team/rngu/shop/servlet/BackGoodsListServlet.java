package team.rngu.shop.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.service.GoodsService;

@WebServlet("/BackGoodsListServlet")
public class BackGoodsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BackGoodsListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pnum = request.getParameter("page");
		GoodsService service = new GoodsService();
		HashMap<String, Object> map = (HashMap<String, Object>) service.getGoodsList(pnum);
		
		request.setAttribute("backgoodsmap",map);
		request.getRequestDispatcher("BackGoodsListPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

}
