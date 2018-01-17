package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.Buyer;
import team.rngu.shop.dao.BuyerDao;
import team.rngu.shop.util.MD5Util;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateUserServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Buyer buyer = new Buyer();
		String bid = request.getParameter("b-id");
		int id = Integer.parseInt(bid);
		buyer.setId(id);
		buyer.setName(request.getParameter("b-name"));
		buyer.setPhone(request.getParameter("b-phone"));
		buyer.setEmail(request.getParameter("b-email"));
		buyer.setPassword(MD5Util.getMD5(request.getParameter("b-password")));
		
		BuyerDao buyerDao = new BuyerDao();
		buyerDao.update(buyer);
		response.sendRedirect("BackUserListServlet?page=1");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
