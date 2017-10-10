---
layout: post
title: "ES6: Destructuring"
---

<!-- {% highlight js %}
{% endhighlight %} -->

### Destructuring of Objects and Arrays

{% highlight js %}
var letters = ['a', 'b', 'c'],
    x = letters[0],
    y = letters[1],
    z = letters[2];

console.log( x, y, z ); // a b c

{% endhighlight %}


{% highlight js %}
var numbers = {a: 1, b: 2, c: 3},
    a = numbers.a,
    b = numbers.b,
    c = numbers.c;

console.log( a, b, c ); // 1 2 3
{% endhighlight %}

{% highlight js %}
var [ x, y, z ] = ['a', 'b', 'c'];
var { a: a, b: b, c: c } = {a: 1, b: 2, c: 3};

console.log( x, y, z ); // a b c
console.log( a, b, c ); // 1 2 3
{% endhighlight %}

---
### Object Destructuring Syntax

{% highlight js %}
var { a: a, b: b, c: c } = {a: 1, b: 2, c: 3};
{% endhighlight %}

{% highlight js %}
var { a, b, c } = {a: 1, b: 2, c: 3};

console.log( a, b, c ); // 1 2 3
{% endhighlight %}

{% highlight js %}
var { a: foo, b: bar, c: baz } = {a: 1, b: 2, c: 3};

console.log( foo, bar, baz ); // 1 2 3
console.log( a, b, c ); // ReferenceError
{% endhighlight %}

{% highlight js %}
var foo = 42, bar = 100;

var obj = { a: foo, b: bar };
var { a: FOO, b: BAR } = obj;

console.log( FOO, BAR ); // 42 100
{% endhighlight %}

{% highlight js %}
var { x: foo, x: bar } = { x: 42 };

console.log( foo ); // 42
console.log( bar ); // 42
{% endhighlight %}

{% highlight js %}
var { x, y }; // syntax error!
let { x, y }; // syntax error!
const { x, y }; // syntax error!
{% endhighlight %}

---
### Assignment Using Destructuring

{% highlight js %}
var a, b, c, x, y, z;

[x, y ,z] = getChars();
( { a, b, c } = getNumbers() );

console.log( x, y, z ); // a b c
console.log( a, b, c ); // 1 2 3
{% endhighlight %}

{% highlight js %}
let item = {
        name: "Apples",
        quantity: 5
    },
    name = "Oranges",
    quantity = 3;

// assigning different values using destructuring
({ name, quantity } = item);

console.log(name); // "Apples"
console.log(quantity); // 5
{% endhighlight %}

---
### Default Values

{% highlight js %}
var item = {
    name: "Apples",
    quantity: 5
};

var { name, quantity, value } = item;

console.log(name); // "Apples"
console.log(quantity); // 5
console.log(value); // undefined
{% endhighlight %}

{% highlight js %}
var item = {
    name: "Apples",
    quantity: 5
};

var { name = "Oranges", quantity = 3, value = 25 } = item;

console.log(name); // "Apples"
console.log(quantity); // 5
console.log(value); // 25
{% endhighlight %}

{% highlight js %}
var { a, b, c: c = 3, d: FOO = 42 } = {a: 1, b: 2};

console.log( a, b, c, FOO ); // 1 2 3 42
{% endhighlight %}

{% highlight js %}
var a = 1, b = 2, c = 3;
var obj = { a: { b: 42 }, c: { b: c } };

( { b: a = { b: b } } = obj );
( { c: b = { b: c } } = obj );
( { a: c = { b: a } } = obj );

console.log( a.b, b.b, c.b );
{% endhighlight %}

---
### Nested Destructuring

{% highlight js %}
let items = {
    count : 2,
    name: "fruits",
    apple: {
        quantity: 5,
        value: 25
    },
    orange: {
        quantity: 3,
        value: 5
    }
};

let { apple: { quantity }} = items;

console.log(quantity); // 5
{% endhighlight %}

{% highlight js %}
let { apple: {} } = items;
console.log(apple); // ReferenceError: apple is not defined
{% endhighlight %}

{% highlight js %}
let { apple = {} } = items;

console.log(apple); // {quantity: 5, value: 25}
{% endhighlight %}

{% highlight js %}
let fruits = [ "apple", [ "blueberry", "raspberry" ], "orange" ];

let [ fruit1, [ fruit2 ], fruit4 ] = fruits;

console.log(fruit1); // "apple"
console.log(fruit2); // "blueberry"
console.log(fruit4); // "orange"
{% endhighlight %}

{% highlight js %}
let student = {
    name: "Tony",
    courses: {
        english: {
            id: 1,
            score: 7
        },
        math: {
            id: 2,
            score: 9
        }
    },
    scoreRange: [0, 10]
};

let {
    courses: { english },
    scoreRange: [ minScore ]
} = student;

console.log(english.id); // 1
console.log(english.score); // 7
console.log(minScore); // 0
{% endhighlight %}

---
### Destructuring Using the rest Syntax

{% highlight js %}
var num1, num2, rest;
var x, y, z;

[num1, num2, ...rest] = [1, 2, 3, 4, 5];
[x, y, z] = [1, 2, 3, 4, 5];

console.log(num1); // 1
console.log(num2); // 2
console.log(rest); // [3, 4, 5]
console.log(x, y, z) // 1 2 3
{% endhighlight %}

{% highlight js %}
var [a, b,] = [1, 2, 3];
console.log(a, b) // 1 2

var [num1, ...num2,] = [1, 2, 3];
// SyntaxError: rest element may not have a trailing comma
{% endhighlight %}

---
### Destructured Parameters

{% highlight js %}
function sum( [ num1, num2 = 0 ] ) {
    console.log( num1 + num2 );
}

sum( [ 1, 2 ] ); // 3
sum( [ 1 ] ); // 1
sum( [ ] ); // NaN
{% endhighlight %}

{% highlight js %}
function createObj(name, value, options) {
    let obj = {};
    obj.x = options.a;
    obj.y = options.b;
    obj.z = options.c;
    obj[name] = value;

    return obj;
}

let options = {a: 1, b: 2, c: 3};
let testObj = createObj('test', 4, options);

console.log(testObj)// {x:1, y:2, z:3, test:4}
{% endhighlight %}

{% highlight js %}
function createObj(name, value, {x:a, y:b, z:c}) {
    // code to return object
}
{% endhighlight %}

{% highlight js %}
function printNums( { num1, num2 } ) {
    console.log( num1, num2 );
}

printNums( { num2: 1, num1: 2 } ); // 2 1
printNums( { num2: 42 } ); // undefined 42
{% endhighlight %}

{% highlight js %}
function foo({ num1 = 42 } = {}, { num2 } = { num2: 42 }) {
    console.log( num1, num2 );
}

foo(); // 42 42
foo( {}, {} ); // 42 undefined
{% endhighlight %}