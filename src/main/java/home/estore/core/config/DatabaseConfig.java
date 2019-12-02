package home.estore.core.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Contains database configurations.
 */
@Configuration
@EnableTransactionManagement
public class DatabaseConfig {
	// ------------------------
	// PRIVATE FIELDS
	// ------------------------

	@Autowired
	private Environment env;
	// ------------------------
	// PUBLIC METHODS
	// ------------------------

	/**
	 * DataSource definition for database connection. Settings are read from the
	 * application.properties file (using the env object).
	 */
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl(
				"jdbc:h2:file:./estoredb;AUTOCOMMIT=OFF;mv_store=false;INIT=CREATE SCHEMA IF NOT EXISTS ESTORE;USER=sa;PASSWORD=sa;");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		
		return dataSource;
	}

}
