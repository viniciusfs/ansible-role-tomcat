# Systemd unit file for tomcat
#
# {{ ansible_managed }}
#

[Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target

[Service]
Type=forking

ExecStart={{ tomcat_home }}/bin/startup.sh
ExecStop={{ tomcat_home }}/bin/shutdown.sh

User={{ tomcat_user }}
Group={{ tomcat_group }}

[Install]
WantedBy=multi-user.target

