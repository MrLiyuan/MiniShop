package team.rngu.shop.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.service.BuyerService;

@WebServlet("/BackUserListServlet")
public class BackUserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BackUserListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pnum = request.getParameter("page");
		BuyerService service = new BuyerService();
		HashMap<String, Object> map = (HashMap<String, Object>) service.getUserList(pnum);
		
		request.setAttribute("backusermap",map);
		request.getRequestDispatcher("BackUserListPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
