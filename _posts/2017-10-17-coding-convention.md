---
layout: post
title: "Coding Convention"
---

# coding convention

# 기본적으로 eslint 적용

- 라인당 120자로 제한
- 라인 120자를 넘어갈 경우 강제 완성을 위해 Prettier를 설치해서 사용 해야 한다
  - webstorm
    - [https://medium.com/@jm90mm/adding-prettier-to-webstorm-a218eeec04d2](https://medium.com/@jm90mm/adding-prettier-to-webstorm-a218eeec04d2)
    - —write —trailing-comma=all —tab-width 4 —print-width 120 —single-quote $FilePathRelativeToProjectRoot$
  - vscode
    - Prettier설치 하면 된다
    - settings.json

          {
           "prettier.eslintIntegration": true,
           // "prettier.tabWidth": 4,
           "eslint.autoFixOnSave": true,
           "editor.snippetSuggestions": "top"
          }

- JSDoc을 이용하여 함수의 파라미터 와 리턴값 등을 꼭 정리하자
- 변수 선언 시 var를 사용하지 않고 let, const을 사용하기
- 여는 중괄호는 명령문과 같은 줄에

      // 올바른 예시:
      if (true) { 
      	console.log("winning");
      }
      
      // 잘못된 예시:
      if (true)
      { 
      	console.log("losing");
      }

- 변수, 속성 및 함수 이름에는 lower Camel Case 사용

      // 올바른 예시:
      let adminUser = db.query('SELECT * FROM users ...');
      
      // 잘못된 예시:
      let admin_user = db.query('SELECT * FROM users ...');

- 클래스 이름에는 Upper Camel Case 사용

      // 올바른 예시:
      class BankAccount() {
      }
      
      // 잘못된 예시:
      class bank_Account() {
      }

- 상수에는 대문자 사용

      // 올바른 예시:
      const SECOND = 1 * 1000;
      function File() {
      }
      
      File.fullPermissions = 0777;
      
      
      // 잘못된 예시:
      let SECOND = 1 * 1000;
      function File() {
      }
      
      File.FULL_PERMISSIONS = 0777;

- === 연산자 사용

      // 올바른 예시:
      let a = 0;
      if (a !== '') { 
      	console.log('winning');
      }
      
      // 잘못된 예시:
      let a = 0;
      if (a == '') { 
      console.log('losing');
      }

- 함수에서 일찍 반환

      // 올바른 예시:
      function isPercentage(val) { 
      	if (val < 0) { 
      		return false; 
      	}
      	if (val > 100) { 
      		return false; 
      	}
      	return true;
      }
      
      // 잘못된 예시:
      function isPercentage(val) { 
      	if (val >= 0) { 
      		if (val < 100) { 
      			return true; 
      		} else { 
      			return false; 
      		} 
      	} else { 
      		return false; 
      	}
      }

- Method Chaining을 원할 시에는 한 라인 당 하나의 메소드를 적는다.

      // 올바른 방법:
      	 
      User
       .findOne({name: 'foo'})
       .populate('bar')
       .exec(function(err, user) {
       if (err) {
       return false;
       }
       return true;
       });
       
      
      // 잘못된 방법:
      	 
      	User
      	.findOne({name: 'foo'})
      	.populate('bar')
      	.exec(function(err, user) {
      	 if (err) {
      	 return false;
      	 }
      	 return true;
      	});
      	 
      	User.findOne({name: 'foo'})
      	 .populate('bar')
      	 .exec(function(err, user) {
      	 if (err) {
      	 return false;
      	 }
      	 return true;
      	 });
      	 
      	User.findOne({name: 'foo'}).populate('bar').exec(function(err, user) {
      	 if (err) {
      	 return false;
      	 }
      	 return true;
      });

- 함수 내에 너무 많은 if, else는 가급적 금지
- 변수명 선언 시 의미 있게 선언 혹은 약식으로 선언하더라도 의미 있게 선언
- 비트 연산자는 되도록 사용하지 말자
- 예약어를 키로 사용하지 말자

      // bad
      const superman = { 
      	default: { clark: 'kent' }, 
      	private: true,
      };
      
      // good
      const superman = { 
      	defaults: { clark: 'kent' }, 
      	hidden: true,
      };

- 객체를 만들 때에는 리터럴 구문을 사용하자

      // bad
      const item = new Object();
      
      // good
      const item = {};

- 메소드에 단축 구문을 사용하자

      // bad
      const atom = { 
      	value: 1,
      
       addValue: function (value) { 
      		return atom.value + value; 
      	},
      };
      
      // good
      const atom = { 
      	value: 1,
       addValue(value) { 
      		return atom.value + value; 
      	},
      };

- 속성에 단축 구문을 사용하자

      const lukeSkywalker = 'Luke Skywalker';
      
      // bad
      const obj = { 
      	lukeSkywalker: lukeSkywalker,
      };
      
      // good
      const obj = { 
      	lukeSkywalker,
      };

- 속성의 단축 구문은 객체 선언의 시작 부분에 무리를 지어 주자

      const anakinSkywalker = 'Anakin Skywalker';
      const lukeSkywalker = 'Luke Skywalker';
      
      // bad
      const obj = { 
      	episodeOne: 1, 
      	twoJediWalkIntoACantina: 2, 
      	lukeSkywalker, 
      	episodeThree: 3, 
      	mayTheFourth: 4, 
      	anakinSkywalker,
      };
      
      // good
      const obj = { 
      	lukeSkywalker, 
      	anakinSkywalker, 
      	episodeOne: 1, 
      	twoJediWalkIntoACantina: 2, 
      	episodeThree: 3, 
      	mayTheFourth: 4,
      };

- 배열을 만들 때 리터럴 구문을 사용하자

      // bad
      const items = new Array();
      
      // good
      const items = [];

- 배열에 항목을 직접 대체 하지 말고 push를 사용하자

      const someStack = [];
      
      // bad
      someStack[someStack.length] = 'abracadabra';
      
      // good
      someStack.push('abracadabra');

- 배열을 복사하는 경우, 배열의 확장 연산자인 …을 사용하자

      // bad
      const len = items.length;
      const itemsCopy = [];
      let i;
      
      for (i = 0; i $lt; len; i++) { 
      	itemsCopy[i] = items[i];
      }
      
      
      // good
      const itemsCopy = [...items];

- 여러 속성에서 객체에 접근할 때 객체 구조화 대입을 사용하자

      // bad
      function getFullName(user) { 
      	const firstName = user.firstName; 
      	const lastName = user.lastName;
      
      	return `${firstName} ${lastName}`;
      }
      
      // good
      function getFullName(user) { 
      	const { firstName, lastName } = user; 
      	return `${firstName} ${lastName}`;
      }
      
      // best
      function getFullName({ firstName, lastName }) { 
      	return `${firstName} ${lastName}`;
      }

- 문자열에는 작은 따옴표 ''를 사용 하자

      // bad
      const name = "Capt. Janeway";
      
      // good
      const name = 'Capt. Janeway';

- 프로그램에서 문자열을 생성하는 경우, 문자열 연결이 아닌 템플릿 문자열을 사용하자

      // bad
      function sayHi(name) { 
      	return 'How are you, ' + name + '?';
      }
      
      // bad
      function sayHi(name) { 
      	return ['How are you, ', name, '?'].join();
      }
      
      // good
      function sayHi(name) { 
      	return `How are you, ${name}?`;
      }

- 함수 선언 대신에 함수 표현식을 사용하자

      // bad
      const foo = function () {
      };
      
      // good
      function foo() {
      }

- 함수의 매개변수를 조작하지 말고 기본 매개변수를 사용하자

      // really bad
      function handleThings(opts) { 
      	// 안되! 함수의 매개변수를 조작하지 않습니다. 
      	// 만약 opts가 falsy 인 경우는 바란대로 객체가 설정됩니다. 
      	// 그러나 미묘한 버그를 일으키는 원인이 될수도 있습니다. 
      	opts = opts || {}; 
      	// ...
      }
      
      // still bad
      function handleThings(opts) { 
      	if (opts === void 0) { 
      		opts = {}; 
      	} 
      	// ...
      }
      
      // good
      function handleThings(opts = {}) { 
      	// ...
      }

- 항상 기본 매개 변수는 앞쪽에 배치하자

      // bad
      function handleThings(opts = {}, name) { 
      	// ...
      }
      
      // good
      function handleThings(name, opts = {}) { 
      	// ...
      }

- 구문의 길이가 여러 행에 걸치는 경우 가독성을 향상 시키기 위해 괄호안에 써주자

      // bad
      [1, 2, 3].map(number => 'As time went by, the string containing the ' +
      	`${number} became much longer. So we needed to break it over multiple ` + 
      'lines.');
      
      // good
      [1, 2, 3].map(number => ( `As time went by, the string containing the ${number} became much ` + 
      	'longer. So we needed to break it over multiple lines.'
      ));

- Prototype의 직접 조작을 피하고 항상 class를 사용하자

      // bad
      function Queue(contents = []) { 
      	this._queue = [...contents];
      }
      
      Queue.prototype.pop = function () { 
      	const value = this._queue[0]; 
      	this._queue.splice(0, 1); 
      	return value;
      }
      
      // good
      class Queue { 
      	constructor(contents = []) { 
      		this._queue = [...contents]; 
      	} 
      	pop() { 
      		const value = this._queue[0]; 
      		this._queue.splice(0, 1); 
      		return value; 
      	}
      }

- 상속은 extends를 사용하자

      // bad
      const inherits = require('inherits');
      
      function PeekableQueue(contents) { 
      	Queue.apply(this, contents);
      }
      
      inherits(PeekableQueue, Queue);
      PeekableQueue.prototype.peek = function () { 
      	return this._queue[0];
      }
      
      // good
      class PeekableQueue extends Queue { 
      	peek() { 
      		return this._queue[0]; 
      	}
      }

- 비표준 모듈 시스템이 아니라면 항상 import/export를 사용하자 이렇게 함으로써 원하는 모듈 시스템에 언제든지 트랜스파일 할 수 있다

      // bad
      const AirbnbStyleGuide = require('./AirbnbStyleGuide');
      module.exports = AirbnbStyleGuide.es6;
      
      // ok
      import AirbnbStyleGuide from './AirbnbStyleGuide';
      export default AirbnbStyleGuide.es6;
      
      // best
      import { es6 } from './AirbnbStyleGuide';
      export default es6;

- 와일드카드를 이용한 가져오기는 지양하자

      // bad
      import * as AirbnbStyleGuide from './AirbnbStyleGuide';
      
      // good
      import AirbnbStyleGuide from './AirbnbStyleGuide';

- Const를 그룹화하고 그다음 let을 그룹화 하자

      // bad
      let i, len, dragonball, 
      	items = getItems(), 
      	goSportsTeam = true;
      
      // bad
      let i;
      const items = getItems();
      let dragonball;
      const goSportsTeam = true;
      let len;
      
      // good
      const goSportsTeam = true;
      const items = getItems();
      let dragonball;
      let i;
      let length;

- 손쉬운 방법을 사용하자

      // bad
      if (name !== '') { 
      	// ...stuff...
      }
      
      // good
      if (name) { 
      	// ...stuff...
      }
      
      // bad
      if (collection.length > 0) { 
      	// ...stuff...
      }
      
      // good
      if (collection.length) { 
      	// ...stuff...
      }

- 쉼표로 시작은 하지 말자

      // bad
      const story = [ 
      	once 
      	, upon 
      	, aTime
      ];
      
      // good
      const story = [ 
      	once, 
      	upon, 
      	aTime,
      ];
      
      // bad
      const hero = { 
      	firstName: 'Ada' 
      	, lastName: 'Lovelace' 
      	, birthYear: 1815 
      	, superPower: 'computers'
      };
      
      // good
      const hero = { 
      	firstName: 'Ada', 
      	lastName: 'Lovelace', 
      	birthYear: 1815, 
      	superPower: 'computers',
      };

- Number형으로 변환하려면 parseInt를 사용하자

      const inputValue = '4';
      
      // bad
      const val = new Number(inputValue);
      
      // bad
      const val = +inputValue;
      
      // bad
      const val = inputValue >> 0;
      
      // bad
      const val = parseInt(inputValue);
      
      // good
      const val = Number(inputValue);
      
      // good
      const val = parseInt(inputValue, 10);

- Private 속성 이름은 앞에 _를 사용하자

      // bad
      this.__firstName__ = 'Panda';
      this.firstName_ = 'Panda';
      
      // good
      this._firstName = 'Panda';

- this에 대한 참조를 저장 하지 않기

      // bad
      function foo() { 
      	const self = this; 
      	return function () { 
      		console.log(self); 
      	};
      }
      
      // bad
      function foo() { 
      	const that = this; 
      	return function () { 
      		console.log(that); 
      	};
      }
      
      // good
      function foo() { 
      	return () => { 
      		console.log(this); 
      	};
      }
