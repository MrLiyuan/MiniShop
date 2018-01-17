package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team.rngu.shop.bean.Buyer;
import team.rngu.shop.bean.Seller;
import team.rngu.shop.service.BuyerService;
import team.rngu.shop.service.SellerService;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String state = request.getParameter("state");
		HttpSession session = request.getSession();
		if( state.equals("0") ){ //0 管理员登录， 1 用户登录
			String account = request.getParameter("name");
			String adminpwd = request.getParameter("pwd");
			Seller seller = new Seller();
			seller.setName(account);
			seller.setPhone(account);
			seller.setPassword(adminpwd);
			SellerService service = new SellerService();
			if( service.login(seller) ){
				session.setAttribute("admininfo", seller);
				response.sendRedirect("BackHomeInfoServlet");
//				request.getRequestDispatcher("AdminIndexPage.jsp").forward(request, response);
			}else{
				request.setAttribute("adminlogininfo", "密码不匹配");
				request.getRequestDispatcher("AdminLoginPage.jsp").forward(request, response);
			}
			
		}else{
			String username = request.getParameter("username");
			String password = request.getParameter("userpwd");
			String sel = request.getParameter("remember");
			Buyer buyer = new Buyer();
			buyer.setName(username);
			buyer.setPhone(username);
			buyer.setEmail(username);
			buyer.setPassword(password);
			BuyerService service = new BuyerService();
			
			if( service.login(buyer) ){
				session.setAttribute("userinfo", buyer);
//				request.setAttribute("userinfo", buyer);
				if( sel!=null ){
					Cookie cookie1 = new Cookie("username", username);
					Cookie cookie2 = new Cookie("userpwd",password);
					response.addCookie(cookie1);
					response.addCookie(cookie2);
				}
				response.sendRedirect("HomeInfoServlet");
//				request.getRequestDispatcher("HomePage.jsp").forward(request, response);
			}else{
				request.setAttribute("userlogininfo", "密码不匹配");
				request.getRequestDispatcher("BuyerLoginPage.jsp").forward(request, response);
			}
		}
	}

}
