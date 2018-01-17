package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.Seller;
import team.rngu.shop.dao.SellerDao;
import team.rngu.shop.util.MD5Util;

@WebServlet("/AddSellerServlet")
public class AddSellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddSellerServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Seller seller = new Seller();
		String name = request.getParameter("s-name");
		String phone = request.getParameter("s-phone");
		String pwd1 = request.getParameter("s-pwd1");
		String pwd2 = request.getParameter("s-pwd2");
		if( !pwd1.equals(pwd2) ){
			response.sendRedirect("BackAddSeller.jsp");
			return;
		}
		seller.setName(name);
		seller.setPhone(phone);
		seller.setPassword(MD5Util.getMD5(pwd1));
		
		SellerDao sellerDao = new SellerDao();
		if( sellerDao.addSeller(seller) ){
			response.sendRedirect("BackAddSeller.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
