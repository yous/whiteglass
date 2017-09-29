---
layout: post
title: "ES6: Arrow Functions"
---

<!-- {% highlight js %}
{% endhighlight %} -->


{% highlight js %}
var fn = data => data;
{% endhighlight %}

{% highlight js %}
var fn = function(data) {
    return data;
};
{% endhighlight %}

{% highlight js %}
let getNumber = () => 42;

console.log(typeof getNumber); // function
console.log(getNumber()); // 42
{% endhighlight %}

{% highlight js %}
var getPrice = (quantity, tax) => (quantity * 5) * (1 + tax);

console.log(getPrice(2, .095)); // 10.95
{% endhighlight %}

{% highlight js %}
var getPrice = (quantity, tax) => {
    let price = (quantity * 5)
    price *= (1 + tax);
    return price;
}

console.log(getPrice(2, .095)); // 10.95
{% endhighlight %}


{% highlight js %}
var getNumber = data => ({ data: "check", number: 42 });

// effectively equivalent to:

var getNumber = function(data) {
    return {
        data: "check",
        number: 42
    };
};
{% endhighlight %}