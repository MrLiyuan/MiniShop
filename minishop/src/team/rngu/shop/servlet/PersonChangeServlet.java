package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team.rngu.shop.bean.Buyer;
import team.rngu.shop.service.BuyerService;

@WebServlet("/PersonChangeServlet")
public class PersonChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PersonChangeServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Buyer buyer = new Buyer();
		HttpSession session = request.getSession();
		String bid = request.getParameter("buyerid");
		int id = Integer.parseInt(bid);
		buyer.setId(id);
		buyer.setName(request.getParameter("buyername"));
		String sexstr = request.getParameter("radio10");
		System.out.println(sexstr);
		int sex = 2;
		if( sexstr.equals("male") ){
			sex = 1;
		}else if( sexstr.equals("female") ){
			sex = 0;
		}else{
			sex = 2;
		}
		buyer.setSex(sex);
		buyer.setPhone(request.getParameter("buyerphone"));
		buyer.setEmail(request.getParameter("buyeremail"));
		
		BuyerService service = new BuyerService();
		if( service.changeInfo(buyer) ){
			session.setAttribute("buyer", buyer);
			response.sendRedirect("PersonInformationPage.jsp");
		}else{
			response.sendRedirect("PersonInformationPage.jsp");
		}
	}

}
