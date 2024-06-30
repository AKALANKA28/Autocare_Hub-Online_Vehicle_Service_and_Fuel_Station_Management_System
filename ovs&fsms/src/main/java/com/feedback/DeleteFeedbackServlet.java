package com.feedback;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.db.DBConnect;

@WebServlet("/deleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int feedbackID = Integer.parseInt(req.getParameter("id"));

            FeedbackDao dao = new FeedbackDao(DBConnect.getConnection());
            HttpSession session = req.getSession();

            if (dao.deleteFeedback(feedbackID)) {
                session.setAttribute("succMsg", "Feedback Deleted Successfully.");
                resp.sendRedirect("manager/view_cus_feedback.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server.");
                resp.sendRedirect("manager/view_cus_feedback.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


