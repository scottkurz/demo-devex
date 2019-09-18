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

mvn install -DboostRuntime=ol -Dboost_db_serverName=localhost -Dboost_db_portNumber=5432 -Dboost_db_password=test -Dboost_db_databaseName=test -Dboost_db_user=test

```

## Scenarios

#### Dev mode

1. Start dev mode with:
`mvn liberty:dev -DboostRuntime=ol -Dboost_db_serverName=localhost -Dboost_db_portNumber=5432 -Dboost_db_password=test -Dboost_db_databaseName=test -Dboost_db_user=test`

##### Hot deployment

1. In `pom.xml`, add the following dependency:
```
               <dependency>
                       <groupId>org.microshed.boost.boosters</groupId>
                       <artifactId>mp-openapi</artifactId>
               </dependency>
```

2. Save the file. The console shows the change is picked up, the feature is installed, and the application is updated.

3. In a browser, go to `http://localhost:9080/openapi/ui` to view the OpenAPI UI which is now available.

4. In the Java file `src/main/java/org/eclipse/microprofile/system/test/app/PersonService.java`, add the following annotations above the `getAllPeople()` method:
```
    @APIResponse(
        responseCode = "200",
        description = "All of people that have been added.",
        content = @Content(
            mediaType = "application/json",
            schema = @Schema(
                type = SchemaType.OBJECT,
                implementation = Person.class)))
    @Operation(
        summary = "Get all people.",
        description = "Returns all of the people that have been added.")
```

5. Save the file.  Notice the console shows compilation errors because imports were not added.

6. Add the following imports:
```
import org.eclipse.microprofile.openapi.annotations.Operation;
import org.eclipse.microprofile.openapi.annotations.enums.SchemaType;
import org.eclipse.microprofile.openapi.annotations.media.Content;
import org.eclipse.microprofile.openapi.annotations.media.Schema;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
```

7. Save the file. Notice the console shows compilation was successful and the application gets updated.

8. In a browser, go to `http://localhost:9080/openapi/ui`, expand `GET` `/people`, and notice the summary, description, and `200` response code which has been added.

##### Hot testing

1. Above the method `getAllPeople()`, delete the `@GET` annotation.  

2. Save the file. Notice the console shows compilation was successful.

3. In the console, press Enter to run tests.  Notice a test has an error.

4. Above the method `getAllPeople()`, restore the `@GET` annotation.

5. Save the file. Notice the console shows compilation was successful.

6. In the console, press Enter to run tests.  Notice the tests pass.

##### Hot debugging

1. Inside the method `getAllPeople()`, set a breakpoint.

2. In your IDE, attach a debugger to port `7777`.

3. In your browser, go to http://localhost:9080/myservice/people.

4. Notice your IDE pauses at the breakpoint that you set, allowing you to debug.

5. Disconnect the debugger.

#### Database support with Boost

- Boost is used to configure the application to use a DB.

#### MicroShed Testing

- The integration tests are written using MicroShed Testing with PostgreSQL in container as a shared dependency.
