---
layout: post
---

<!-- ### Block Scoping with let and const -->

<!-- Quite simply, block scoping means that a new scope is created between a pair of { }. -->
간단히 말해, 블록 범위 지정은 {} 쌍 사이에 새로운 범위가 만들어 짐을 의미합니다.

<!-- The variables declared using the keywords let and const only exist within the innermost block that surrounds them. -->
let 및 const 키워드를 사용하여 선언 된 변수는 변수를 감싸는 가장 안쪽의 블록 내에 만 존재합니다.

{% highlight js %}
let nbr = 42;
{
    let nbr = 1000;
}

console.log(nbr);
{% endhighlight %}

<!-- We now know that var is bound to function scope, whereas let and const are block scopes, which means if you've got a set of curly brackets (a block of code), you have a block scope. -->
우리는 var로 정의된 변수들이 함수 범위안에 묶여 있음을 알고있습니다. 그리고 let과 const는 블록범위내에 존재합니다. 즉, 중괄호 (코드 블록)가 있으면 블록 범위가 있습니다.

On the other hand, unlike let, const creates immutable variables.

The values of the variables created using const need to be assigned during declaration and cannot be changed later in the program.

{% highlight js %}
const value = 42;

console.log(value); // 42

value = 1000; // TypeError
{% endhighlight %}


NOTE: trying to change the value of a const variable will throw a typeerror.

Make sure that you always initialize the variable with a value declared using const; otherwise it will throw an error.

{% highlight js %}
const item; // SyntaxError: Missing initializer in const declaration
{% endhighlight %}

If you know that the value of your variables is not going to change throughout your code, you should be using const; otherwise use let to declare your variables.

We recommend moving away from the practice of using var to declare variables as it is cleaner, more efficient, and easy to debug if you use block scoping. let and const avoid the source of misunderstanding, especially for programmers with expectations set by languages with block scope.

let and const throw an exception if you try to access the variables declared by them outside the blocks they were declared and do away with hoisting, helping you localize the effects of your code fragments.

{% highlight js %}
console.log(nbr); // undefined
var nbr = 42;
{% endhighlight %}

{% highlight js %}
console.log(nbr); // Reference Error: nbr is not defined
let nbr = 42;
{% endhighlight %}

This Reference Error is technically called a Temporal Dead Zone (TDZ) error because you are accessing a variable that's been declared but not yet initialized.
