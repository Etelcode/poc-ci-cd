import { IsNotEmpty } from "class-validator";

export class SumDto {
    @IsNotEmpty()
    a: number;

    @IsNotEmpty()
    b: number;
}
