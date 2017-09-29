---
layout: post
title: "ES6: Variable Declarations: let, const, and Block Scoping"
---


{% highlight js %}
var price = 10; // 전역선언

function showPrice() {
    var price = 12; // var를 사용한 로컬선언
    console.log(price); // 12
}

showPrice();
console.log(price); // 10
{% endhighlight %}


{% highlight js %}
// IIFE
var price = 10; // 전역선언

(function () {
    var price = 12; // var를 사용한 로컬선언
    console.log(price); // 12
})();

console.log(price); // 10
{% endhighlight %}

