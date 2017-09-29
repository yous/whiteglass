---
layout: post
title: "ES6: More on Temporal Dead Zones"
---

{% highlight js %}
let data = true;

if (true) { // enter new scope, TDZ starts
    // Uninitialized binding for "data" is created

    console.log(data); // ReferenceError
    let data; // TDZ ends, "data" is initialized with "undefined"
}

console.log(data); // true
{% endhighlight %}
