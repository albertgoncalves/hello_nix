const add = (x) => (y) => x + y;

const main = () => {
    const x  = 1;
    const ys = [2, 3];

    ys.map(add(x)).forEach((y) => console.log(y));
};

main()
