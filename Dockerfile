# DHEERAJ KRISHNA NAGULA
# G01448319 
# Akhilesh Dhavileswarapu
# G01472450
FROM tomcat:latest


RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY StudentSurvey.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
