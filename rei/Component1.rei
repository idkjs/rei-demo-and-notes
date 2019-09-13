let handleClick: 'a => unit;
[@bs...] external makeProps:
  (~message: 'message, ~key: string=?, unit) => {. "message": 'message} = "";
let make: {. "message": string} => ReasonReact.reactElement;
