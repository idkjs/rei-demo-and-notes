type state = { count: int, show: bool, };
type action = Click | Toggle;
[@bs...] external makeProps:
  (~greeting: 'greeting, ~key: string=?, unit) => {. "greeting": 'greeting}
  = "";
let make: {. "greeting": string} => ReasonReact.reactElement;
