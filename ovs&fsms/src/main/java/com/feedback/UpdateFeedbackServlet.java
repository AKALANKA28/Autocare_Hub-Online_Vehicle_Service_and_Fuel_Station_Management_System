package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.db.DBConnect;


@WebServlet("/updateFeedback")
public class UpdateFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String feedbackType = req.getParameter("feedbackType");
            Feedback feedback;

            if ("Customer".equals(feedbackType)) {
                feedback = new CustomerFeedback();
                ((CustomerFeedback) feedback).setRating(Integer.parseInt(req.getParameter("rating")));
                ((CustomerFeedback) feedback).setServiceType(req.getParameter("serviceType"));
            } else {
                feedback = new EmployeeFeedback();
                ((EmployeeFeedback) feedback).setCategory(req.getParameter("feedbackCategory"));
                ((EmployeeFeedback) feedback).setDepartment(req.getParameter("department"));
            }
            
            feedback.setId(Integer.parseInt(req.getParameter("feedbackId")));
            feedback.setUserID(Integer.parseInt(req.getParameter("userID")));
            feedback.setTimestamp(req.getParameter("timestamp"));
            feedback.setMessage(req.getParameter("message"));

            FeedbackDao dao = new FeedbackDao(DBConnect.getConnection());
            HttpSession session = req.getSession();

            if (dao.updateFeedback(feedback)) {
                session.setAttribute("succMsg", "Feedback Updated Successfully.");
                resp.sendRedirect("feedback/feedback.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server.");
                resp.sendRedirect("feedback/feedback.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

