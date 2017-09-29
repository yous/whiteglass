---
layout: post
title: "ES6: More on Temporal Dead Zones"
---

<!-- {% highlight js %}
{% endhighlight %} -->

{% highlight js %}
let data = true;

if (true) { // enter new scope, TDZ starts
    // Uninitialized binding for "data" is created

    console.log(data); // ReferenceError
    let data; // TDZ ends, "data" is initialized with "undefined"
}

console.log(data); // true
{% endhighlight %}


{% highlight js %}
if (true) {
    console.log(typeof anUndeclaredVariable); // 'undefined'
    console.log(typeof random); // ReferenceError (TDZ)
    let random;
}
{% endhighlight %}


{% highlight js %}
if (typeof globalVariable === 'undefined') {
    var globalVariable = { ··· };
}
{% endhighlight %}

{% highlight js %}
const obj = {};
obj.key = 42;
console.log(obj.key); // 42
obj = {}; // TypeError
{% endhighlight %}
