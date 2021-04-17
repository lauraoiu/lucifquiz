package laptt.serlvet;

import laptt.account.AccountDTO;
import laptt.quiz.QuizDAO;
import laptt.subject.SubjectDAO;
import org.apache.log4j.Logger;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "ViewHistoryServlet", urlPatterns = {"/ViewHistoryServlet"})
public class ViewHistoryServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(ViewHistoryServlet.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String url = request.getContextPath();

        try {
            AccountDTO accountDTO = null;

            HttpSession httpSession = request.getSession(false);
            if (httpSession != null) {
                accountDTO = (AccountDTO)httpSession.getAttribute("AUTH_USER");
            }

            if (accountDTO != null) {
                if (accountDTO.getRole().equals("student")) {
                    String idSubject = request.getParameter("txtIdSubject");
                    if (idSubject == null || idSubject.isEmpty()) {
                        idSubject = "A79036DB-B33E-4478-A3A6-2083FD8B6992";
                    }

                    QuizDAO quizDAO = new QuizDAO();
                    quizDAO.setQuizDTOList(accountDTO.getEmail(), idSubject);
                    request.setAttribute("HISTORY_QUIZ_LIST", quizDAO.getQuizDTOList());

                    SubjectDAO subjectDAO = new SubjectDAO();
                    subjectDAO.setSubjectDTOList();
                    request.setAttribute("SUBJECT_LIST", subjectDAO.getSubjectDTOList());

                    ServletContext servletContext = request.getServletContext();
                    url = servletContext.getInitParameter("student-history-jsp");
                }
            }
        } catch (SQLException | NamingException throwables) {
            logger.error(throwables);
        } finally {
            if (url.equals(request.getContextPath())) {
                response.sendRedirect(url);
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
                requestDispatcher.forward(request, response);
            }

            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
