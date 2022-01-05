[step]
--

changeFile("src/main/java/org/acme/spring/data/jpa/repo/fruit/FruitResource", {"content":"return this.fruitRepository.findAllQueryDslName(name);", "placeholder": "return null;"})
--
Now you can run the application in development mode.
[step]
--
executeCommand("mvn compile quarkus:dev", "mvn compile quarkus:dev")
--

Render port 8080: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
