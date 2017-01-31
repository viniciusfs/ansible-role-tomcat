#!/bin/bash
#
# {{ ansible_managed }}
#

DATE=$(date +%Y-%m-%d-%H-%M-%S)
HOST=$(hostname)

CATALINA_HOME={{ tomcat_home }}
export CATALINA_HOME

CATALINA_PID=${CATALINA_HOME}/work/tomcat.pid
export CATALINA_PID

CATALINA_BASE=$CATALINA_HOME
export CATALINA_BASE


# Opções comportamentais
# http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html#BehavioralOptions
CATALINA_OPTS="$CATALINA_OPTS
-server
-XX:+DisableExplicitGC
-Djava.awt.headless=true"

# Tamanho da memoria heap e new generation heap
CATALINA_OPTS="$CATALINA_OPTS
-Xms{{ tomcat_java_xms.split('.')[0] }}m
-Xmx{{ tomcat_java_xmx.split('.')[0] }}m
-XX:NewSize={{ tomcat_java_newsize.split('.')[0] }}m
-XX:MaxNewSize={{ tomcat_java_newsize.split('.')[0] }}m"

# Opções do G1GC (Garbage First Garbage Collection)
# http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html#G1Options
CATALINA_OPTS="$CATALINA_OPTS
-XX:+UseG1GC
-XX:MaxGCPauseMillis=200
-XX:InitiatingHeapOccupancyPercent=50
-XX:ParallelGCThreads=4
-XX:ConcGCThreads=4"

# Otimizações de performance
# http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html#PerformanceTuning
CATALINA_OPTS="$CATALINA_OPTS
-XX:+AggressiveOpts"

# Opções de debug
# http://www.oracle.com/technetwork/java/javase/tech/vmoptions-jsp-140102.html#DebuggingOptions
CATALINA_OPTS="$CATALINA_OPTS
-XX:+PrintGC
-XX:+PrintGCDetails
-XX:+PrintGCTimeStamps
-XX:+PrintGCDateStamps
-XX:+PrintGCTaskTimeStamps
-XX:+PrintTenuringDistribution
-XX:+PrintHeapAtGC
-XX:+TraceClassLoading
-XX:+TraceClassUnloading
-Xloggc:${CATALINA_HOME}/logs/gc-${HOST}.log
-XX:-HeapDumpOnOutOfMemoryError
-XX:HeapDumpPath=${CATALINA_HOME}/logs/heap-dump-oom-error_${HOST}_${DATE}.hprof"

# Configuracoes de JMX
CATALINA_OPTS="$CATALINA_OPTS
-Dcom.sun.management.jmxremote
-Dcom.sun.management.jmxremote.authenticate=false
-Dcom.sun.management.jmxremote.ssl=false
-Dcom.sun.management.jmxremote.port=9010
-Dcom.sun.management.jmxremote.local.only=false"

export CATALINA_OPTS

JRE_HOME=/usr/lib/jvm/jre
export JRE_HOME

JAVA_HOME=/usr/lib/jvm/jre-openjdk
export JAVA_HOME
