import { Controller, Get, Param } from '@nestjs/common';
import { AppService } from './app.service';
import hello from './lib/hello';

@Controller('api/')
export class AppController {
    constructor (
        private readonly appService: AppService,
        ) {}

    @Get('/:name')
    async hello(@Param('name') name: string): Promise<string> {
        return (this.appService.hello(name));
    }
}
