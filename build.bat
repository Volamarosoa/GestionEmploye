cd Framework 
javac -d . *java
jar cf fw.jar .
mv fw.jar ..
cd ..
mv fw.jar Test-Framework/WEB-INF/lib
ls Test-Framework/WEB-INF/lib
jar tf Test-Framework/WEB-INF/lib/fw.jar
cd Test-Framework/WEB-INF/classes
javac -d . *java
cd ../../..
cd Test-Framework
jar cf Gestion_emp.war .
cp Gestion_emp.war C:/'Program Files'/'Apache Software Foundation'/'Tomcat 9.0'/webapps