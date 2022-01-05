

If the parent directories aren't already in the project, 'mkdir -p' will create them for you. 

`mkdir -p /root/devonfw/QueryDslTutorial/src/main/java/org/acme/spring/data/jpa/repo/fruit`{{execute T1}}

Switch to the editor and click 'Copy to Editor'. 

'FruitFragmentimpl.java' will be created automatically inside the newly created folder.

<pre class="file" data-filename="devonfw/QueryDslTutorial/src/main/java/org/acme/spring/data/jpa/repo/fruit/FruitFragmentimpl.java">
package org.acme.spring.data.jpa.repo.fruit;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import org.acme.spring.data.jpa.model.Fruit;
import org.acme.spring.data.jpa.model.Origin;
import org.acme.spring.data.jpa.model.QFruit;
import org.acme.spring.data.jpa.model.QOrigin;

import com.querydsl.jpa.impl.JPAQuery;

public class FruitFragmentImpl implements FruitFragment {

  @Inject
  EntityManager em;

  @Override
  public List&lt;Fruit&gt; findAllQueryDslName(String name) {

    QFruit fruit = QFruit.fruit;
    JPAQuery&lt;Fruit&gt; query = new JPAQuery&lt;Fruit&gt;(this.em);
    query.from(fruit);
    if (name != null &amp;&amp; !name.isEmpty()) {
      query.where(fruit.name.eq(name));
    }
    return query.orderBy(fruit.name.desc()).fetch();
  }

  @Override
  public List&lt;Fruit&gt; findByColor(String color) {

    System.out.println(&#34;Fragment&#34;);
    QFruit fruit = QFruit.fruit;
    JPAQuery&lt;Fruit&gt; query = new JPAQuery&lt;Fruit&gt;(this.em);
    query.from(fruit);
    if (color != null &amp;&amp; !color.isEmpty()) {
      query.where(fruit.color.eq(color));
    }
    return query.orderBy(fruit.color.desc()).fetch();
  }

  @Override
  public List&lt;Fruit&gt; findAllQueryDslOrigin(String country) {

    QOrigin origin = QOrigin.origin;
    JPAQuery&lt;Origin&gt; query = new JPAQuery&lt;Origin&gt;(this.em);
    query.from(origin);
    if (country != null &amp;&amp; !country.isEmpty()) {
      query.where(origin.countryName.eq(country));
    }
    return new ArrayList&lt;&gt;(query.fetchOne().getFruits());
  }

  @Override
  public List&lt;Fruit&gt; findAllQueryDslMaxPriceDesc(Float price) {

    QFruit fruit = QFruit.fruit;
    JPAQuery&lt;Fruit&gt; query = new JPAQuery&lt;Fruit&gt;(this.em);
    query.from(fruit);

    if (price != null &amp;&amp; price != 0) {
      query.where(fruit.price.loe(price));
    }
    return query.orderBy(fruit.price.desc()).fetch();
  }

  @Override
  public List&lt;Fruit&gt; findAllQueryDslMinPriceAsc(Float price) {

    QFruit fruit = QFruit.fruit;
    JPAQuery&lt;Fruit&gt; query = new JPAQuery&lt;Fruit&gt;(this.em);
    query.from(fruit);

    if (price != null &amp;&amp; price != 0) {
      query.where(fruit.price.goe(price));
    }
    return query.orderBy(fruit.price.asc()).fetch();
  }

  @Override
  public List&lt;Fruit&gt; findAllQueryDslColorCountry(String country, String color) {

    QOrigin origin = QOrigin.origin;
    QFruit fruit = QFruit.fruit;
    JPAQuery&lt;Fruit&gt; query = new JPAQuery&lt;&gt;(this.em);
    // JPAQuery&lt;Origin&gt; query = new JPAQuery&lt;&gt;(this.em);
    // query.from(origin);
    query.from(fruit);

    if (color != null &amp;&amp; !color.isEmpty()) {
      // query.leftJoin(origin.fruits, fruit).on(fruit.origin.eq(origin)).where(origin.countryName.eq(country));
      query.where(fruit.color.eq(color).and(fruit.origin.countryName.eq(country)));
    }
    return new ArrayList&lt;&gt;(query.fetch());// One().getFruits());
  }

  @Override
  public List&lt;Fruit&gt; findAllQueryDslPriceRange(Float min, Float max) {

    QFruit fruit = QFruit.fruit;
    JPAQuery&lt;Fruit&gt; query = new JPAQuery&lt;Fruit&gt;(this.em);
    query.from(fruit);

    if (min != null &amp;&amp; min != 0 &amp;&amp; max != null &amp;&amp; max != 0) {
      // query.where(fruit.price.goe(min).and(fruit.price.loe(max)));
      query.where(fruit.price.between(min, max));
    }
    return query.orderBy(fruit.price.desc()).fetch();
  }

}

</pre>

