Features include the ability to:

* configure and save any number of application profiles
* each application profile can specify:
  * title
  * file path to main Javascript file
  * command line options for the Node.js runtime
  * command line options for the application
  * environment variables
  * current working directory
* application profiles are grouped by:
  * _"exec"_
    > Applications share a single process.<br>
    > Only one can execute at a time.
  * _"fork"_
    > Each application is given its own process.<br>
    > Each executes in a foreground service.<br>
    > An associated notification kills the process.
* backup and restore:
  * export all application profiles to JSON
  * import new application profiles from JSON

Embedded runtime environment:

* Node.js 12.19.0
* OpenSSL 1.1.1g
