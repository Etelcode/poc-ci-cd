import sum from "./sum";

describe('sum tests', () => {
    describe('basic', () => {
        it('2 + 2 should return 4', () => {
            expect(sum(2, 2)).toBe(4);
        });
    });
});
