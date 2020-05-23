import { parse, compile } from "expression-eval";
import { EXPRESSION_IDENTIFIER } from "./constants";

function isExpression(value) {
  return typeof value === "string" && value.startsWith(EXPRESSION_IDENTIFIER);
}

export function convertExpressions(props) {
  const convertedProps= { };
  for (const key in props) {
    const value = props[key];
    if (isExpression(value)) {
      convertedProps[key] = convertExpression(value);
    }
  }

  return convertedProps;
}

export function convertExpression(value) {
  const expr = value.replace(EXPRESSION_IDENTIFIER, "");
  const func = compile(expr);
  return (data) => func(Object.assign({ "Math": Math, "console": console }, data));
}
