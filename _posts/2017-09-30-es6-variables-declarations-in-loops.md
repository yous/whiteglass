---
layout: post
title: "ES6: Variables Declarations in loops"
---

<!-- {% highlight js %}
{% endhighlight %} -->

{% highlight js %}
let arr = [];

for (var i=0; i < 3; i++) {
    arr.push(function () { return i });
}

let value = arr[0]();

console.log(value); // 3
{% endhighlight %}


{% highlight js %}
for (const i=0; i<3; i++) {
    console.log(i);
}

// TypeError: Assignment to constant variable (due to i++)
{% endhighlight %}


<!-- {% highlight js %}
{% endhighlight %} -->
