## Few thoughts I have during working on this project

1. Spring Boot (or Spring in general?) automatically creates necessary tables. Hence, there is no need for schema.sql
2. Mysql namespace is case-sensitive. Table 'Player' is different with 'player'
3. `spring-boot-starter-actuator` is awesome. It adds several production-grade services to our application with little effor. 
For example, accessing http://localhost:8080/health returns some status of our app
4. To return REST response, you should put `@ResponseBody` to your controller method. Otherwise, Thymeleaf will return error
5. JPA uses several annotations for foreign key relationships. One thing should be noted though, for example if I have variable
`team` which refers to other table, Java EE will automatically create column name `team_id` not `team`
6. Don't forget to use @ResponseBody if you annotate @Controller on your class. If it is @RestController, then Spring will
automatically does it for you