---
layout: post
title: "ES6: New Syntax"
---

<!-- {% highlight js %}
{% endhighlight %} -->

### Variable Declarations: let, const, and Block Scoping

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

---

### Block Scoping with let and const

{% highlight js %}
let nbr = 42;
{
    let nbr = 1000;
}

console.log(nbr);
{% endhighlight %}


{% highlight js %}
const value = 42;

console.log(value); // 42

value = 1000; // TypeError
{% endhighlight %}


{% highlight js %}
const item; // SyntaxError: Missing initializer in const declaration
{% endhighlight %}


{% highlight js %}
console.log(nbr); // undefined
var nbr = 42;
{% endhighlight %}

{% highlight js %}
console.log(nbr); // Reference Error: nbr is not defined
let nbr = 42;
{% endhighlight %}

---

### More on Temporal Dead Zones

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

{% highlight js %}
const obj = Object.freeze({});
obj.key = 42;
console.log(obj); // {}
{% endhighlight %}

---

### Variables Declarations in loops

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

---

### Variable Declarations with Function Parameters and Global Scope

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

---

### Arrow Functions

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

---

### Using Arrow Functions to Create IIFEs

{% highlight js %}
var fn = function(number) {
    return {
        getNumber: function() {
            return number;
    }
};
}(42);

console.log(fn.getNumber()); // 42
{% endhighlight %}

{% highlight js %}
var fn = ((number) => {
    return {
        getNumber: function() {
            return number;
    }
    };
})(42);

console.log(fn.getNumber()); // 42
{% endhighlight %}

---

### A Tale about this

#### Function Invocation

{% highlight js %}
function getContext() {
    console.log(this); // Global or Window
}
{% endhighlight %}

{% highlight js %}
if (this === window) {
    console.log("this refers to the Global context");
}
{% endhighlight %}

#### Method Invocation

{% highlight js %}
let myObj = {
    name: 'fancy',
    operation: function() {
        console.log(this);
    }
}

myObj.operation(); // { name: 'fancy', operation: [Function: operation]}
{% endhighlight %}


{% highlight js %}
let x = myObj.operation;
x(); // Window
{% endhighlight %}


{% highlight js %}
let x = myObj.operation;
x(); // Window

x.call(myObj); // { name: 'fancy', operation: [function]}
{% endhighlight %}

#### Constructor Invocation

{% highlight js %}
function Employee(name, department, salary) {
    this.name = name;
    this.department = department;
    this.salary = salary;

    console.log("Welcome " + this.name + "!");
}

let john = new Employee('John', 'Sales', 4000);
// Welcome John!

{% endhighlight %}

---

### this in Arrow Functions

{% highlight js %}
function Employee(firstName, department, salary) {
    this.firstName = firstName;
    this.department = department;
    this.salary = salary;
    this.getInfo = function() {
        // outer function context = Employee object
        return function () {
            // inner function context = Global object
            console.log(this.firstName + " from " +
            this.department + " earns " + this.salary);
        };
    }
}

let jim = new Employee('Jim', 'Finance', 5200);
{% endhighlight %}

{% highlight js %}
let printInfo = jim.getInfo();
printInfo(); // undefined from undefined earns undefined
{% endhighlight %}

{% highlight js %}
function Employee(firstName, department, salary) {
    this.firstName = firstName;
    this.department = department;
    this.salary = salary;
    this.getInfo = function() {
        // outer function context = Employee object
        return () => {
            // inner function context = surrounding context = Employee object
            console.log(this.firstName + " from " +
            this.department + " earns " + this.salary);
        };
    }
}

let jim = new Employee('Jim', 'Finance', 5200);

let printInfo = jim.getInfo();
printInfo(); // Jim from Finance earns 5200
{% endhighlight %}

{% highlight js %}
function Employee() {
    this.firstName = 'Mike',
    this.department = 'HR',
    this.salary = 4500,
    this.getContext = () => {
        console.log(this);
    }
}

let mark = new Employee();
mark.getContext(); // [Employee object]

let context = mark.getContext;
context(); // [Employee object] (regardless of a function invocation)

{% endhighlight %}

{% highlight js %}
var details = {
    number: 42,
    operation: function () {
        return () => console.log(this.number);
    }
};

var details2 = {
number: 84
};

details.operation().bind(details2)(); // 42
{% endhighlight %}

{% highlight js %}
var product = (x, y) => x * y;

console.log(product.call(null, 2, 3)); // 6
console.log(product.apply(null, [2, 3])); // 6

var multiply = product.bind(null, 2, 3);
console.log(multiply ()); // 6
{% endhighlight %}

{% highlight js %}
var newFn = () => {},
    object = new newFn(); // error - you can't use arrow functions with 'new'
{% endhighlight %}

{% highlight js %}
var details = () => 42;

console.log(details.hasOwnProperty("prototype")); // false
{% endhighlight %}

---

### Using Arrow Functions

{% highlight js %}
$('.btn').on('click', function() {
    var self = this;

    setTimeout({
        $(self).toggleClass('btn-active');
    }, 1000);
});
{% endhighlight %}

{% highlight js %}
$('.btn').on('click', function() {
    setTimeout(() => {
        $(this).toggleClass('btn-active');
    }, 1000);
});
{% endhighlight %}

<!-- {% highlight js %}
{% endhighlight %} -->

<!-- {% highlight js %}
{% endhighlight %} -->