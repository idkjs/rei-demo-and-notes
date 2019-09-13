let url: ReasonReactRouter.url;
let nowShowing: React.element;

[@bs.obj] external makeProps: (~key: string=?, unit) => {.} = "";
let make: {.} => ReasonReact.reactElement;