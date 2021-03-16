node{
    env.PATH = "/usr/share/maven/bin/:$PATH"
    stage('git-clone') {
        sh 'git clone https://github.com/Harshaettigi/Spring-webpage.git'
    }
        
    stage('mvn') {
        sh 'mvn clean package'
    }
    
    stage("build docker image"){
      sh 'cd /var/lib/jenkins/workspace/java-proj/Spring-webpage/'
      sh "sudo docker build -t javaApp . "
      sh "sudo docker tag myimg itszabiulla/javaApp"
    }
    
    stage('docker') {
        withCredentials([string(credentialsId: 'dockerpass', variable: 'dockerpass')]) {
          sh "sudo docker login -u itszabiulla -p ${dockerpass}"
        }    
        sh ' sudo docker push itszabiulla/javaApp'
    }
}
