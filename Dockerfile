#FROM smartnimbus/was23-demo:8.5.5.9-profile

#FROM maven:3.5-jdk-8 as BUILD
 
#COPY src /usr/src/myapp/src
#COPY pom.xml /usr/src/myapp
#RUN mvn -f /usr/src/myapp/pom.xml clean package
 

#FROM smartnimbus/was8.5.5.9-profile
#COPY --from=BUILD /usr/src/myapp/target/hello-world-war-1.0.0.war /tmp/
#COPY target/hello-world-war-1.0.6.war /tmp/
#RUN wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/hello-world-war-1.0.0.war', '[ -appname hello-world-war-1.0.0 -contextroot /hello-world-war-1.0.0 -MapWebModToVH [[ hello-world-war-1.0.0.war hello-world-war-1.0.0.war,WEB-INF/web.xml default_host]]]')"

FROM smartnimbus/was23-demo:8.5.5.9-profile
#FROM smartnimbus/was8.5.5.9-profile
#ARG warfile=hello-world
#COPY target/hello-world-war-*.war /tmp/hello-world.war
EXPOSE 9043/tcp
EXPOSE 9443/tcp

#RUN wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/$warfile.war', '[ -appname $warfile -contextroot /$warfile -MapWebModToVH [[ $warfile.war $warfile.war,WEB-INF/web.xml default_host]]]')"