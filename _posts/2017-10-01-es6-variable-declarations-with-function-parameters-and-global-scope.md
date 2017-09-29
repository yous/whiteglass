---
layout: post
title: "ES6: Variable Declarations with Function Parameters and Global Scope"
---

<!-- {% highlight js %}
{% endhighlight %} -->


{% highlight js %}
function fn(param) {
    let param; // SyntaxError: Identifier 'param' has already been declared
}
{% endhighlight %}


{% highlight js %}
function fn(param) {
    {
        let param;
    }
}
{% endhighlight %}


{% highlight js %}
let notGlobal = "hello";
var isGlobal = "what up";

{ console.log(notGlobal); } // hello
{ console.log(isGlobal); } // what up

global.isGlobal //'what up'
global.notGlobal // undefined
{% endhighlight %}


<!-- {% highlight js %}
{% endhighlight %} -->