
# superheroR

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<div class="figure" style="text-align: center">

<img src="https://images.unsplash.com/photo-1588497859490-85d1c17db96d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="Photo by &lt;a href=&quot;https://unsplash.com/@waldemarbrandt67w?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText&quot;&gt;Waldemar Brandt&lt;/a&gt; on &lt;a href=&quot;https://unsplash.com/s/photos/comics?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText&quot;&gt;Unsplash&lt;/a&gt;" width="90%" />

<p class="caption">

Photo by
<a href="https://unsplash.com/@waldemarbrandt67w?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Waldemar
Brandt</a> on
<a href="https://unsplash.com/s/photos/comics?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a>

</p>

</div>

<br>

A R wrapper that can be used to pull data from the [SuperHero
API](https://superheroapi.com) by specific superhero. Entering the
desired superhero you can information regarding a superheros powerstats,
appearances, connections, and much more. A Facebook profile is required
to obtain a token.

# Setting access token

``` r
Sys.setenv(SUPERHERO_TOKEN = "xxxxxxxxxxxxxxx")
```
