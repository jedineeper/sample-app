node {
   // Mark the code checkout 'stage'....
   stage 'Checkout'

   // Get some code from a GitHub repository
   checkout scm

   // Mark the code build 'stage'....
   stage 'Build'

   // Run the maven build
   sh 'make build'

   // test al lthe things
   stage 'Test'

   sh 'make test'
}
