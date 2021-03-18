  node{
    env.PATH = "/usr/share/maven/bin/:$PATH"   //installed path in linux machine
    stage('git-clone') {
        sh 'https://github.com/Zabiulla9/JavaSpring-project.git'
    }
        
    stage('mvn') {
        sh ''' cd /var/lib/jenkins/workspace/java-proj/JavaSpring-project/Spring-webpage/      
        mvn clean package '''      //chdir where pom.xml is saved
    }
    
    stage("build docker image"){
      sh '''cd /var/lib/jenkins/workspace/java-proj/Spring-webpage/
      sudo docker build -t java_app . 
      sudo docker tag java_app itszabiulla/java_app'''
    }
    
    stage('docker') {
        withCredentials([string(credentialsId: 'dockerpass', variable: 'dockerpass')]) {     // Save docker credentials as secret text and pass as argument       
          sh "sudo docker login -u itszabiulla -p ${dockerpass}"
        }    
        sh ' sudo docker push itszabiulla/java_app'
    }
}
