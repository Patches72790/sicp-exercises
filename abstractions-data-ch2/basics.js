const {
  display,
  list,
  is_null,
  is_pair,
  pair,
  head,
  tail,
  append,
} = require("sicp");

const reverseTest = () => {
  console.log("Reverse test:");
  const rl1 = list(1, 2, 3, 4);

  const reverse = (l) =>
    is_null(l) ? null : append(reverse(tail(l)), pair(head(l), null));

  const reverseBetter = (l) => {
    const reverseIter = (items, result) =>
      is_null(items)
        ? result
        : reverseIter(tail(items), pair(head(items), result));

    return reverseIter(l, null);
  };

  display(rl1);
  display(reverse(rl1));
  display(reverseBetter(rl1));
};

const countTest = () => {
  console.log("\nCount test:");
  const countLeaves = (x) =>
    is_null(x)
      ? 0
      : !is_pair(x)
      ? 1
      : countLeaves(head(x)) + countLeaves(tail(x));

  const l = list(1, list(2, list(3, 4)));
  display(countLeaves(l));

  const l2 = list(1, 3, list(5, 7), 9);
  display(head(tail(head(tail(tail(l2))))));

  const l3 = list(list(7));
  display(head(head(l3)));
};

reverseTest();
countTest();
