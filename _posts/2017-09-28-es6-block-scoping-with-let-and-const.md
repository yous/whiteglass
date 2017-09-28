---
layout: post
---

### Block Scoping with let and const

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

<!-- On the other hand, unlike let, const creates immutable variables. -->
반면 const는 let과 달리 불변 변수를 만듭니다.

<!-- The values of the variables created using const need to be assigned during declaration and cannot be changed later in the program. -->
const를 사용하여 생성 된 변수의 값은 선언 중에 지정해야하며 나중에 프로그램에서 변경할 수 없습니다.

{% highlight js %}
const value = 42;

console.log(value); // 42

value = 1000; // TypeError
{% endhighlight %}

주의: const 변수의 값을 변경하려고 시도하면 typeerror가 발생합니다.

<!-- Make sure that you always initialize the variable with a value declared using const; otherwise it will throw an error. -->
const를 사용하여 선언 된 값은 항상 변수를 초기화해야합니다. 그렇지 않으면 오류가 발생합니다.

{% highlight js %}
const item; // SyntaxError: Missing initializer in const declaration
{% endhighlight %}

<!-- If you know that the value of your variables is not going to change throughout your code, you should be using const; otherwise use let to declare your variables. -->
변수의 값이 코드 전체에서 변경되지 않는다는 것을 알고 있다면 const를 사용해야합니다. 그렇지 않으면 let을 사용하여 변수를 선언하십시오.

<!-- We recommend moving away from the practice of using var to declare variables as it is cleaner, more efficient, and easy to debug if you use block scoping. let and const avoid the source of misunderstanding, especially for programmers with expectations set by languages with block scope. -->
블럭 범위 지정을 사용하면 변수를 선언 할 때 변수를 사용하는 것이 더 깔끔하고 효율적이며 디버깅하기 쉽도록 변수를 선언하는 것이 좋습니다. let과 const는 오해의 근원을 피합니다. 특히 블록 범위를 가진 언어에 의해 기대되는 기대치를 가진 프로그래머에게는 더욱 그렇습니다.

<!-- let and const throw an exception if you try to access the variables declared by them outside the blocks they were declared and do away with hoisting, helping you localize the effects of your code fragments. -->
let 및 const는 선언 된 블록 외부에서 선언 된 변수에 액세스하려고 시도하면 예외를 발생시킵니다. 그리고 코드를 조각으로 나누어주는 데 도움이됩니다.

{% highlight js %}
console.log(nbr); // undefined
var nbr = 42;
{% endhighlight %}

{% highlight js %}
console.log(nbr); // Reference Error: nbr is not defined
let nbr = 42;
{% endhighlight %}

<!-- This Reference Error is technically called a Temporal Dead Zone (TDZ) error because you are accessing a variable that's been declared but not yet initialized. -->
이 참조 오류는 선언되었지만 아직 초기화되지 않은 변수에 액세스하고 있기 때문에 기술적으로 TDZ (Temporal Dead Zone) 오류라고합니다.
