import { Injectable } from '@nestjs/common';
import hello from './lib/hello';

@Injectable()
export class AppService {
    async hello(name: string): Promise<string> {
        return (hello(name));
    }
}
