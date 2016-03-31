# coffeelint-no-accessor-existential-operator
[CoffeeLint](http://www.coffeelint.org/) plugin for prohibiting accessor with existential operator.

When coffeescript transpile to ES2015(ES6) by transpiler([decaf](https://github.com/juliankrispel/decaf), [decaffeinate](https://github.com/decaffeinate/decaffeinate)), accessor with existential operator is transpiled complex code.

Example:
```coffeescript
# coffeescript sample using accessor with existential operator
hoge?.fuga?.piyo()

# transpiled JS by decaf
var ref;
typeof hoge !== "undefined" && hoge !== null ? ((ref = hoge.fuga) != null ? ref.piyo() : void 0) : void 0;
```

I recommend fix coffeescript before transpile.

## Install
```sh
$ npm install --save-dev coffeelint-no-accessor-existential-operator
```

## Usage
Put this in your coffeelint config
```json
{
  "no_accessor_existential_operator": {
    "module": "coffeelint-no-accessor-existential-operator"
  }
}
```

## Examples
```coffeescript
# Bad
hoge?.fuga
doit() if hoge?.fuga?

# Good (Note that following code not equals completely)
hoge.fuga if hoge?
doit() if hoge && hoge.fuga?
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
