package team.rngu.shop.servlet;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.rngu.shop.bean.Indent;
import team.rngu.shop.dao.IndentDao;

@WebServlet("/UpdateIndentServlet")
public class UpdateIndentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateIndentServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iid = request.getParameter("i-id");
		int id = Integer.parseInt(iid);
		String bname = request.getParameter("ib-name");
		String gname = request.getParameter("ig-name");
		String inum = request.getParameter("i-num");
		int num = Integer.parseInt(inum);
		String iprice = request.getParameter("i-price");
		double price = Double.parseDouble(iprice);
		
		Indent indent = new Indent();
		indent.setId(id);
		indent.setGoodsNum(num);
		indent.setTotalPrice(price);
		
		IndentDao indentDao = new IndentDao();
		indentDao.updateIndent(indent, bname, gname);
		response.sendRedirect("BackIndentListServlet?type=0&page=1");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
