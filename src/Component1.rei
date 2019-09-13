let handleClick: 'a => unit;
[@bs.obj] external makeProps:
  (~message: 'message, ~key: string=?, unit) => {. "message": 'message} = "";
let make: {. "message": string} => ReasonReact.reactElement;
