package team.rngu.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.GoodsClass;
import team.rngu.shop.service.BuyerService;

@WebServlet("/HomeInfoServlet")
public class HomeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeInfoServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BuyerService service = new BuyerService();
		List<GoodsClass> list = service.getHomeInfo();
		request.setAttribute("homelist", list);
		request.getRequestDispatcher("HomePage.jsp").forward(request, response);
	}

}
