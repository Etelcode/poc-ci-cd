import { Injectable } from '@nestjs/common';
import { PowDto } from './dto/pow.dto';
import { SumDto } from './dto/sum.dto';
import hello from './lib/hello';
import pow from './lib/pow';
import sum from './lib/sum';

@Injectable()
export class AppService {
    async hello(name: string): Promise<string> {
        return (hello(name));
    }

    async sum(body: SumDto): Promise<number> {
        return (sum(body.a, body.b));
    }

    async pow(body: PowDto): Promise<number> {
        return (pow(body.x, body.n));
    }
}
