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
import com.groupeisi.schoolejb.dao.IInscription;
import com.groupeisi.schoolejb.dao.IInscriptionImpl;
import com.groupeisi.schoolejb.dao.IStudent;
import com.groupeisi.schoolejb.dao.IStudentImpl;
import com.groupeisi.schoolejb.dao.IYear;
import com.groupeisi.schoolejb.dao.IYearImpl;
import com.groupeisi.schoolejb.entities.Courses;
import com.groupeisi.schoolejb.entities.Inscription;
import com.groupeisi.schoolejb.entities.Student;
import com.groupeisi.schoolejb.entities.Year;

/**
 * Servlet implementation class InscriptionServlet
 */
@WebServlet("/inscription")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	private IInscription iinscriptionimpl;
	@EJB
	private ICourses icoursesimpl;
	@EJB
	private IStudent istudentimpl;
	@EJB
	private IYear iyearimpl;
	
    public InscriptionServlet() {
        super();
    }

	
	public void init(ServletConfig config) throws ServletException {
		
		this.iinscriptionimpl = new IInscriptionImpl();
		this.icoursesimpl = new ICoursesImpl();
		this.istudentimpl = new IStudentImpl();
		this.iyearimpl = new IYearImpl();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Courses c = new Courses();
		Year y = new Year();
		Student s = new Student();
		Inscription i = new Inscription();
		List<Inscription> inscriptions = iinscriptionimpl.list(i);
		request.setAttribute("inscriptions",inscriptions);
		List<Courses> courses = icoursesimpl.list(c);
		request.setAttribute("courses",courses);
		List<Student> students = istudentimpl.list(s);
		request.setAttribute("students",students);
		List<Year> years = iyearimpl.list(y);
		request.setAttribute("years",years);
		request.getRequestDispatcher("WEB-INF/views/inscription/inscription.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Inscription inscription = new Inscription();
		if(request.getParameter("id") != null) {
			Inscription i = new Inscription();
			iinscriptionimpl.delete(Integer.parseInt(request.getParameter("id")),i);
		}else {
			Courses c = new Courses();
			Year y = new Year();
			Student s = new Student();
			inscription.setDetails(request.getParameter("details"));
			inscription.setCourses(icoursesimpl.get(Integer.parseInt(request.getParameter("courses")),c));
			inscription.setYears(iyearimpl.get(Integer.parseInt(request.getParameter("years")),y));
			inscription.setStudents(istudentimpl.get(Integer.parseInt(request.getParameter("students")),s));
			iinscriptionimpl.add(inscription);
		}
		 
		doGet(request, response);
	}

}
