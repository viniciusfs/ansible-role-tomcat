{{ tomcat_home }}/logs/catalina.out
{
	create 0600 {{ tomcat_user }} {{ tomcat_group }}
	notifempty
	copytruncate
	daily
	rotate 180
	missingok
	compress
	compresscmd /bin/gzip
	compressext .gz
	dateext
	dateformat _%Y-%m-%d-%s
	size 500M
}
{{ tomcat_home }}/logs/gc-*.log
{
	create 0600 {{ tomcat_user }} {{ tomcat_group }}
	notifempty
	copytruncate
	daily
	rotate 180
	missingok
	compress
	compresscmd /bin/gzip
	compressext .gz
	dateext
	dateformat -%Y-%m-%d
}
