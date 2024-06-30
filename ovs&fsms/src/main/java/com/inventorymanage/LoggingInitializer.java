package com.inventorymanage;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.LogManager;

public class LoggingInitializer implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        try {
            InputStream is = event.getServletContext().getResourceAsStream("logging.properties");
            LogManager.getLogManager().readConfiguration(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        // Clean up resources when your application is shutting down, if needed.
    }
}

