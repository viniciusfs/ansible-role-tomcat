<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
  <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <role rolename="manager-jmx"/>
  <role rolename="manager-status"/>
  <user username="{{ tomcat_manager_user }}" password="{{ tomcat_manager_password }}" roles="manager-gui,manager-script,manager-jmx,manager-status"/>
</tomcat-users>
