package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.Buyer;
import team.rngu.shop.service.BuyerService;

@WebServlet("/PersonChangePwdServlet")
public class PersonChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PersonChangePwdServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		
		if( !pwd1.equals(pwd2) ){
			request.getRequestDispatcher("PersonPasswordPage.jsp").forward(request, response);
			return;
		}
		BuyerService service = new BuyerService();
		Buyer buyer = new Buyer();
		buyer.setId(Integer.parseInt(id));
		buyer.setPassword(pwd);
		if( service.queryPassword(buyer) ){
			buyer.setPassword(pwd1);
			if( service.changePassword(buyer) ){
				request.getRequestDispatcher("PersonInformationPage.jsp").forward(request, response);
			}
		}
		
	}

}
