import hello from "./hello";

describe('hello tests', () => {
    describe('empty parameter', () => {
        it('should return Hello !', () => {
            expect(hello('')).toBe('Hello !');
        });
    });
});
