package team.rngu.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.Buyer;
import team.rngu.shop.service.BuyerService;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check = request.getParameter("che");
		System.out.println(check);
		if( check==null ){ //未同意协议
			request.getRequestDispatcher("BuyerRegisterPage.jsp").forward(request, response);
			return;
		}
		String state = request.getParameter("state");
		Buyer buyer = new Buyer();
		BuyerService service = new BuyerService();
		if( state.equals("email") ){
			String email = request.getParameter("email");
			String pwd1 = request.getParameter("pwd1");
			String pwd2 = request.getParameter("pwd2");
			
			buyer.setEmail(email);
			if( !pwd1.equals(pwd2) ){//密码不相同
				request.getRequestDispatcher("BuyerRegisterPage.jsp").forward(request, response);
				return;
			}
			buyer.setPassword(pwd1);
		}else{
			String phone = request.getParameter("phone");
			String name = request.getParameter("");
			String pwd1 = request.getParameter("pwd1");
			String pwd2 = request.getParameter("pwd2");
			
			buyer.setPhone(phone);
			buyer.setName(name);
			if( !pwd1.equals(pwd2) ){
				request.getRequestDispatcher("BuyerRegisterPage.jsp").forward(request, response);
				return;
			}
			buyer.setPassword(pwd1);
		}
		if( service.register(buyer) ){
			
			request.getRequestDispatcher("BuyerLoginPage.jsp").forward(request, response);
			//这种方式要提示 ： 放入容器中一个错误信息，加载到HTML的隐藏域中， js获取HTML数据，alert出错误信息。
		}
		
	}

}
