function pow(x: number, n: number): number {
    if (n === 0)
        return (1);
    return (pow(x, n - 1) * x)
}
export default pow;
