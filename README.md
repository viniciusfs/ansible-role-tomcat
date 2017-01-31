# Tomcat

Role para instalação e configuração básica do Apache Tomcat no ambiente MUXI.

## Descrição das variáveis

Nome | Descrição | Tipo | Padrão | Obrigatória
---- | --------- | ---- | ------ | -----------
tomcat_user | Usuário para execução do Tomcat | String | tomcat | Sim
tomcat_group | Grupo de usuário para execução do Tomcat | String | tomcat | Sim
tomcat_java_version | Versão Java OpenJDK a ser instalada | Number | 1.8.0 | Sim
tomcat_version_major | Número da versão Tomcat a ser instalada | Number | 7 | Sim
tomcat_version | Numeração completa do release a ser instalado | Number | 7.0.73 | Sim
tomcat_mirror | URL do mirror a ser usado para download do pacote Tomcat | URL | http://ftp.unicamp.br/pub/apache/tomcat | Sim
tomcat_download_url | URL completa para download do pacote Tomcat | URL | `{{ tomcat_mirror }}`/tomcat-`{{ tomcat_version_major }}`/v`{{ tomcat_version }}`/bin/apache-tomcat-`{{ tomcat_version }}`.tar.gz | Sim
tomcat_download_destination | Caminho para download do pacote Tomcat | Path | /tmp/apache-tomcat-`{{ tomcat_version }}`.tar.gz
tomcat_installation_dir | Caminho para instalação do Tomcat | Path | /opt/muxi | Sim
tomcat_home | Caminho para criação de link simbólico | Path | /opt/tomcat | Sim
tomcat_manager_user | Usuário para acesso ao Tomcat Manager | String | admin | Sim
tomcat_manager_password | Senha para acesso ao Tomcat Manager com usuário `{{ tomcat_manager_user }}` | String | tomcat | Sim
tomcat_manager_script | URL para download do tomcat-manager.py | URL | https://github.com/kotfu/tomcat-manager/blob/python2.x/tomcat-manager.py | Sim 
tomcat_catalina_home | Caminho para configuração da variável de ambiente `CATALINA_HOME` | Path | `{{ tomcat_home }}` | Sim
tomcat_catalina_base | Caminho para configuração da variável de ambiente `CATALINA_BASE` | Path | `{{ tomcat_home }}` | Sim
tomcat_catalina_pid | Caminho para do *pid file* do Tomcat | Path | `{{ tomcat_home }}`/temp/tomcat.pid | Sim
tomcat_java_xms | Quantidade de memória para opção -Xms da JVM | Number | 512 | Sim
tomcat_java_xmx | Quantidade de memória para opção -Xmx da JVM | Number | 1024 | Sim
tomcat_catalina_opts | Opções a serem adicionadas a variável de ambiente `CATALINA_OPTS` | String | -Xms`{{ tomcat_java_xms }}`M -Xmx`{{ tomcat_java_xmx}}`M -server -XX:+UseParallelGC | Sim
tomcat_java_home | Caminho para configuração da variável de ambiente `JAVA_HOME` | Path | /usr/lib/jvm/jre | Sim
tomcat_java_opts | Opções a serem adicionadas a variável de ambiente `JAVA_OPTS` | String | -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom | Sim

## Playbook de exemplo

```yaml
---
- hosts: tomcat1
  vars:
    tomcat_version_major: 7
    tomcat_version: 7.0.73
    tomcat_mirror: http://mirror.nbtelecom.com.br/apache/tomcat

  roles:
  - tomcat
```
