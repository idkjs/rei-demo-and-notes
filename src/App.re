let url = ReasonReactRouter.useUrl();

let nowShowing =
  switch (url.path) {
  | []
  | ["/"]
  | ["v1"] =>
    ReasonReact.Router.replace("v1");
    <Component1 message="Hello! Click this text." />;
  | ["v2"] => <Component2 greeting="Hello!" />
  | _ => "NotFound"->React.string
  };
();

nowShowing;

[@react.component]
let make = () => <div> nowShowing </div>;