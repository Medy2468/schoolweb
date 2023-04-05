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

import com.groupeisi.schoolejb.dao.IStudent;
import com.groupeisi.schoolejb.dao.IStudentImpl;
import com.groupeisi.schoolejb.entities.Student;
import com.groupeisi.schoolejb.entities.Year;

/**
 * Servlet implementation class StudentServlet
 */

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	@EJB
	private IStudent istudentimpl;
   
    public StudentServlet() {
        super();
    }

	
	public void init(ServletConfig config) throws ServletException {
		
		this.istudentimpl = new IStudentImpl();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student s = new Student();
		List<Student> students = istudentimpl.list(s);
		request.setAttribute("students",students);
		request.getRequestDispatcher("WEB-INF/views/student/student.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student student = new Student();
		if(request.getParameter("id") != null) {
			Student s = new Student();
			istudentimpl.delete(Integer.parseInt(request.getParameter("id")),s);
		}else {
			student.setFirstname(request.getParameter("firstname"));
			student.setLastname(request.getParameter("lastname"));
			student.setBirthdate(request.getParameter("birthdate"));
			student.setPhone(request.getParameter("phone"));
			istudentimpl.add(student);
		}
		doGet(request, response);
	}

}
