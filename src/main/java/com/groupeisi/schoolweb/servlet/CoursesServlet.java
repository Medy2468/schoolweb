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

import com.groupeisi.schoolejb.dao.ICourses;
import com.groupeisi.schoolejb.dao.ICoursesImpl;
import com.groupeisi.schoolejb.entities.Courses;

/**
 * Servlet implementation class CoursesServlet
 */

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@EJB
	private ICourses icoursesimpl;
    
    public CoursesServlet() {
        super();
    }

	
	public void init(ServletConfig config) throws ServletException {
		
		this.icoursesimpl = new ICoursesImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Courses c = new Courses();
		List<Courses> courses = icoursesimpl.list(c);
		request.setAttribute("courses",courses);
		request.getRequestDispatcher("WEB-INF/views/courses/courses.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Courses courses = new Courses();
		if(request.getParameter("id") != null) {
			Courses c = new Courses();
			icoursesimpl.delete(Integer.parseInt(request.getParameter("id")),c);
		}else {
			courses.setName(request.getParameter("name"));
			courses.setProgram(request.getParameter("program"));
			icoursesimpl.add(courses);
		}
		doGet(request, response);
	}

}
