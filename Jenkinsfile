pipeline {
    agent any
    options {

    }
    stages {
        stage('Example') {
            agent any
            options {
                timeout(time: 1, unit: 'SECONDS')
            }
            steps {
                echo 'Hello World'
                echo 'Step 2'
                echo 'Finish stage Example'
            }
        }
        stage('Do something') {
            agent any
            steps {
                echo 'Do something'
                echo 'Finish'
            }
        }
    }
}