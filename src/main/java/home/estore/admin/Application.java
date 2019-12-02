package home.estore.admin;


import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


/**
 * @SpringBootApplication is a convenience annotation that adds 
 * all of the following:
 * 
 * @ComponentScan tells Spring to look for other components, configurations, 
 * and services in the hello package, allowing it to find the controllers.
 * @author lsotiriadis
 *
 */
@SpringBootApplication
@EnableJpaRepositories(basePackages ={"home.estore"})
@ComponentScan(basePackages ={"home.estore"})
@EntityScan(basePackages="home.estore")
public class Application extends SpringBootServletInitializer{

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
    @Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//    	Properties properties = new Properties();
//        properties.setProperty("spring.resources.static-locations",
//                          "classpath:/books/");
//        application.properties(properties);
		return application.sources(Application.class);
	}
}
