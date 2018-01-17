package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.Goods;
import team.rngu.shop.service.GoodsService;

@WebServlet("/GoodsIntrouductionPageServlet")
public class GoodsIntrouductionPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GoodsIntrouductionPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String par = request.getParameter("id");
		int id = Integer.parseInt(par);
		Goods goods = new Goods();
		
		GoodsService service = new GoodsService();
		goods = service.showGoods(id);
		request.setAttribute("goods", goods);
		request.getRequestDispatcher("GoodsintroductionPage.jsp").forward(request, response);
//		response.sendRedirect("./GoodsintroductionPage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
