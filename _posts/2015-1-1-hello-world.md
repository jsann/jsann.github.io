---
layout: post
title: Hello World
---
<h2>{{ page.title }}</h2>
<p>Hello World</p>
{% highlight javascript %}
window.onload = function(){
  console.log("hello world");
}
{% endhighlight %}
<p>{{ page.date | date_to_string }}</p>
