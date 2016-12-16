package com.belalangtempur.springboot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Euro2016AppApplication {

	private static Logger log = LoggerFactory.getLogger(Euro2016AppApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(Euro2016AppApplication.class, args);
	}

	// Todo: add HTTPS support (see project readinglist)
	// Todo: add HTTP->HTTPS redirection

}
