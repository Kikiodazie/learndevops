node {
	    // reference to maven
	    // ** NOTE: This 'maven-3.5.2' Maven tool must be configured in the Jenkins Global Configuration.
	    def mvnHome = tool 'maven-3.5.2'


	    // holds reference to docker image
	    def dockerImage
	    // ip address of the docker private repository(nexus)

	    def dockerImageTag = "learndevops${env.BUILD_NUMBER}"

	    stage('Clone Repo') { // for display purposes
	      // Get some code from a GitHub repository
	      git 'https://github.com/Kikiodazie/learndevops.git'
	      // Get the Maven tool.
	      // ** NOTE: This 'maven-3.5.2' Maven tool must be configured
	      // **       in the global configuration.
	      mvnHome = tool 'maven-3.5.2'
	    }

	    stage('Build Project') {
	      // build project via maven
	      sh "'${mvnHome}/bin/mvn' clean install"
	    }

	    stage('Build Docker Image') {
	      // build docker image
	      dockerImage = docker.build("learndevops:${env.BUILD_NUMBER}")
	    }

	    stage('Deploy Docker Image'){

	      // deploy docker image to nexus

	      echo "Docker Image Tag Name: ${dockerImageTag}"

		  sh "docker stop learndevops"

		  sh "docker rm learndevops"

		  sh "docker run --name learndevops -d -p 2222:2222 learndevops:${env.BUILD_NUMBER}"

		  // docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
	      //    dockerImage.push("${env.BUILD_NUMBER}")
	      //      dockerImage.push("latest")
	      //  }

	    }
}