

Now we can implement Querydsl-queries in the `FruitFragmentImpl`. The class requires a JPA `EntityManager` to interact with the persistent entities, which is passed to the `JPAQuery` constructor when instantiating a query.

In order to define the `Fruit`-entity as the source of the query, we need to create its Q-type first by accessing its static `fruit` field. Then, we can call `query.from(fruit)`.

To retrieve a fruit with a given name, we can use a `where`-clause with the `eq` (equals) operator to get fruits with the name equal to the one passed to the function parameter. Additionally, we can sort the results by name in descending alphabetical order by calling `query.orderBy(fruit.name.desc())` before fetching the result.

&lt;pre&gt;
public class FruitFragmentImpl implements FruitFragment {

  @Inject
  EntityManager em;

  @Override
  public List&lt;Fruit&gt; findAllQueryDslName(String name) {

    JPAQuery&lt;Fruit&gt; query = new JPAQuery&lt;Fruit&gt;(this.em);
    QFruit fruit = QFruit.fruit;
    query.from(fruit);
    if (name != null &amp;&amp; !name.isEmpty()) {
      query.where(fruit.name.eq(name));
    }
    return query.orderBy(fruit.name.desc()).fetch();
  }
&lt;/pre&gt;

We can also get fruits in a given price range by calling `fruit.price.between(min, max)` in the `where`-clause.

&lt;pre&gt;
  @Override
  public List&lt;Fruit&gt; findAllQueryDslPriceRange(Float min, Float max) {
  ...
    if (min != null &amp;&amp; min != 0 &amp;&amp; max != null &amp;&amp; max != 0) {
      query.where(fruit.price.between(min, max));
    }
    return query.orderBy(fruit.price.desc()).fetch();
  }
&lt;/pre&gt;





