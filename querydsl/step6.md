

Switch to the editor and open the file 'devonfw/QueryDslTutorial/src/main/java/org/acme/spring/data/jpa/repo/fruit/FruitRepository'.

`devonfw/QueryDslTutorial/src/main/java/org/acme/spring/data/jpa/repo/fruit/FruitRepository`{{open}}




Replace the content in the file as it is shown in the following segment of code.


Click on 'Copy to Editor' to change it automatically.

<pre class="file" data-filename="devonfw/QueryDslTutorial/src/main/java/org/acme/spring/data/jpa/repo/fruit/FruitRepository" data-target="insert" data-marker="public interface FruitRepository extends CrudRepository&lt;Fruit, Long&gt; {">
public interface FruitRepository extends CrudRepository&lt;Fruit, Long&gt;, FruitFragment {</pre>

