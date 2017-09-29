---
layout: post
title: "ES6: Block Scoping with let and const"
---


{% highlight js %}
let nbr = 42;
{
    let nbr = 1000;
}

console.log(nbr);
{% endhighlight %}


{% highlight js %}
const value = 42;

console.log(value); // 42

value = 1000; // TypeError
{% endhighlight %}


{% highlight js %}
const item; // SyntaxError: Missing initializer in const declaration
{% endhighlight %}


{% highlight js %}
console.log(nbr); // undefined
var nbr = 42;
{% endhighlight %}

{% highlight js %}
console.log(nbr); // Reference Error: nbr is not defined
let nbr = 42;
{% endhighlight %}
