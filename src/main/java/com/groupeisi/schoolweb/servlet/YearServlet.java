package com.groupeisi.schoolweb.servlet;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.groupeisi.schoolejb.dao.IYear;
import com.groupeisi.schoolejb.dao.IYearImpl;
import com.groupeisi.schoolejb.entities.Year;

/**
 * Servlet implementation class YearServlet
 */

@WebServlet( "/year")
public class YearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@EJB
	private IYear iyearimpl;
    
    public YearServlet() {
        super();
    }

	
	public void init(ServletConfig config) throws ServletException {
		
		this.iyearimpl = new IYearImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Year y = new Year();
		List<Year> years = iyearimpl.list(y);
		request.setAttribute("years",years);
		request.getRequestDispatcher("WEB-INF/views/year/year.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Year year = new Year();
		if(request.getParameter("id") != null) {
			Year y = new Year();
			iyearimpl.delete(Integer.parseInt(request.getParameter("id")),y);
		}else {
			year.setName(request.getParameter("name"));
			iyearimpl.add(year);
		}
		doGet(request, response);
	}

}
