#!/usr/bin/env bash

# 需要配置如下参数
# 项目路径，在Execute Shell中配置项目路径，pwd就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径
killTomcat(){
  pid=`ps -ef|grep jenkins-study| grep java|awk '{print $2}'`
  echo "tomcat Id list : $pid"
  if [ "$pid" = "" ]
  then
    echo "no tomcat pid alive"
  else
    kill -9 $pid
  fi
}

cd $PROJ_PATH/jenkins-study
mvn clean install

# 停止tomcat
killTomcat

# 删除原有工程
rm -f $TOMCAT_APP_PATH/webapps/jenkins-study-*.jar

# 如果目录不存在则创建
mkdir -p /usr/local/tomcat/webapps

# 复制新的工程
cp $PROJ_PATH/jenkins-study/target/jenkins-study-1.0-SNAPSHOT.jar $TOMCAT_APP_PATH/webapps/

cd $TOMCAT_APP_PATH/webapps/

java -jar jenkins-study-1.0-SNAPSHOT.jar
