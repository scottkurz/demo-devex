# OpenLiberty Developer Experience Demo

[![Build Status](https://travis-ci.org/OpenLiberty/demo-devex.svg?branch=master)](https://travis-ci.org/OpenLiberty/demo-devex)
[![License](https://img.shields.io/badge/License-ASL%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

## Demo highlights

1. Liberty "dev mode"
1. MicroShed Boost
1. MicroShed Testing

## How to run:

```
# One time setup
./setup.sh

mvn install
```

## Scenarios

#### Hot deployment with dev mode

1. In `pom.xml`, add the following dependency:
```
        <dependency>
            <groupId>boost.boosters</groupId>
            <artifactId>mpOpenAPI</artifactId>
        </dependency>
```

2. Save the file. The console shows the change is picked up, the feature is installed, and the application is updated.

3. In a browser, go to `http://localhost:9080/openapi` to view the new endpoint.

4. In the Java file `src/main/java/org/eclipse/microprofile/system/test/app/PersonService.java`, add the following annotation above the `getPerson(@PathParam("personId") long id)` method:
```
    @Operation(
        summary = "Get person from ID.",
        description = "Returns the person with the given ID.")
```

5. Save the file.  Notice the console shows a compilation error because the import was not added.

6. Add the following import:
```
import org.eclipse.microprofile.openapi.annotations.Operation;
```

7. Save the file. Notice the console shows compilation was successful and the application gets updated.

8. In a browser, go to `http://localhost:9080/openapi` and notice the summary and description from step 4 appears under the `/people/{personId}` endpoint.

9. Above the method `getAllPeople()`, delete the `@GET` annotation.  Save the file.

10. In the console, press Enter to run tests.  Notice a test has an error.

11. Above the method `getAllPeople()`, restore the `@GET` annotation.  Save the file.

12. In the console, press Enter to run tests.  Notice the tests pass.

13. Inside the method `getAllPeople()`, set a breakpoint.

14. In your IDE, attach a debugger to port `7777`.

15. In your browser, go to `http://localhost:9080/myservice/people`.

16. Notice your IDE pauses at the breakpoint that you set, allowing you to debug.

#### JPA support with Boost

1. ...

#### MicroShed Testing

1. Write tests with MicoShed Testing ...
