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

@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PersonServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_id = request.getParameter("id");
		int id = Integer.parseInt(b_id);
		BuyerService service = new BuyerService();
		HttpSession session = request.getSession();
		Buyer buyer = service.searchBuyerInfo(id);
		
		session.setAttribute("buyer", buyer);
		request.getRequestDispatcher("PersonInformationPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

}
