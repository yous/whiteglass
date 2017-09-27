---
layout: post
---

<!-- ### Variable Declarations: let, const, and Block Scoping -->

<!-- In the past, all variables in JavaScript were declared using the keyword var. -->
과거에는 JavaScript의 모든 변수가 var 키워드를 사용하여 선언되었습니다.

<!-- These variables were function scoped, meaning their scope was within the function enclosing them, and this could sometimes be confusing to developers coming from other languages. -->

이 변수는 함수 범위내에 있으며 그 범위가 함수를 감싸는 함수 내에 있음을 의미하며 다른 언어로 개발해온 개발자들에게 혼동을 줄 수 있습니다.

{% highlight js %}
var price = 10; // Global Declaration

function showPrice() {
    var price = 12; // Local Declaration using var
    console.log(price); // 12
}

showPrice();
console.log(price); // 10
{% endhighlight %}


<!-- Following is an example of function level scopes with IIFE: -->
다음은 IIFE를 사용하는 함수 범위의 예입니다.
{% highlight js %}
var price = 10; // Global Declaration

(function () {
    var price = 12; // Local Declaration using var
    console.log(price); // 12
})();

console.log(price); // 10
{% endhighlight %}

### Block Scoping with let and const

