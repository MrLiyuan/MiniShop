package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.Goods;
import team.rngu.shop.entity.Page;
import team.rngu.shop.service.GoodsService;

@WebServlet("/GoodsListServlet")
public class GoodsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GoodsListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search-context");
		String pstr = request.getParameter("page");
		int pnum = Integer.parseInt(pstr);
		GoodsService service = new GoodsService();
		Page<Goods> page = service.showGoodsList(search,pnum);
		
		request.setAttribute("goodslist", page);
		
		request.getRequestDispatcher("GoodsListPage.jsp").forward(request, response);
	}

}
