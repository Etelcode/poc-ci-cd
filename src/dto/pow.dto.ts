import { IsNotEmpty } from "class-validator";

export class PowDto {
    @IsNotEmpty()
    x: number;

    @IsNotEmpty()
    n: number;
}
