import pow from "./pow";

describe('pow tests', () => {
    describe('basic', () => {
        it('should return 1000', () => {
            expect(pow(10, 4)).toBe(10000);
        });
    });
});
