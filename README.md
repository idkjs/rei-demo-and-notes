# rei-demo-and-notes

## Trust the compiler, not the editor

Note: globally installed `bs-platform` is 6.0 so that is what got installed in the project.

`.rei` files generated with script at [`./rei.gen.sh`](./rei.gen.sh)

Original script out put for `Component1.re` is in [`rei/`](./rei) with all the others.

```reason
type state = { count: int, show: bool, };
type action = Click | Toggle;
[@bs...] external makeProps:// this throws an error.
  (~greeting: 'greeting, ~key: string=?, unit) => {. "greeting": 'greeting}
  = "";
let make: {. "greeting": string} => ReasonReact.reactElement;
```

Fix the error by changing it to:

```reason
let handleClick: 'a => unit;
[@bs.obj] external makeProps:
  (~message: 'message, ~key: string=?, unit) => {. "message": 'message} = "";
let make: {. "message": string} => ReasonReact.reactElement;
```

At this point in time, `VsCode` shows red, but compiler is green and the project runs.

## editor-screenshot

![editor-screenshot](./Screenshot-editor.png)

## terminal-screenshot

![terminal-screenshot](./Screenshot-terminal.png)

## project is start with `bsb -init name -theme react-hooks`

```sh
npm install
npm start
# in another tab
npm run webpack
```

After you see the webpack compilation succeed (the `npm run webpack` step), open up `build/index.html` (**no server needed!**). Then modify whichever `.re` file in `src` and refresh the page to see the changes.

**For more elaborate ReasonReact examples**, please see https://github.com/reasonml-community/reason-react-example

## From Discord

This is a good one, solves the problem nicely.

[link](https://discordapp.com/channels/235176658175262720/235176658175262720/622775403869896733)
> @idkjs Didn't read if soemone helped you but with the help of refmt.
You have:

```reason
let makeProps: (~key: string=?, unit) => {. };
let make: {. } => ReasonReact.reactElement;
```

And this worked for me

```reason
let makeProps: (~key: string=?, unit) => Js.t({.});
let make: Js.t({.}) => ReasonReact.reactElement;
```
