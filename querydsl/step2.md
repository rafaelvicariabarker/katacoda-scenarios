

Switch to the editor and open the file 'devonfw/workspaces/main/pom.xml'.

`devonfw/workspaces/main/pom.xml`{{open}}




Replace the content in the file as it is shown in the following segment of code.


Click on 'Copy to Editor' to change it automatically.

<pre class="file" data-filename="devonfw/workspaces/main/pom.xml" data-target="insert" data-marker="&lt;QueryDslDependencies&gt;">
        &lt;dependency&gt;
                &lt;groupId&gt;com.querydsl&lt;/groupId&gt;
                &lt;artifactId&gt;querydsl-apt&lt;/artifactId&gt;
                &lt;version&gt;4.1.3&lt;/version&gt;
                &lt;scope&gt;provided&lt;/scope&gt;
        &lt;/dependency&gt;
        &lt;dependency&gt;
                &lt;groupId&gt;com.querydsl&lt;/groupId&gt;
                &lt;artifactId&gt;querydsl-jpa&lt;/artifactId&gt;
                &lt;version&gt;4.1.3&lt;/version&gt;
        &lt;/dependency&gt;
</pre>
