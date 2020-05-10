import { parse, compile } from "expression-eval";
import { EXPRESSION_IDENTIFIER } from "./constants";

export default function (value) {
  const expr = value.replace(EXPRESSION_IDENTIFIER, "");
  const func = compile(expr);
  return (data) => func(Object.assign({ "Math": Math, "console": console }, data));
}
