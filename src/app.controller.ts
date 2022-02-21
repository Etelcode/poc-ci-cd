import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { AppService } from './app.service';
import { PowDto } from './dto/pow.dto';
import { SumDto } from './dto/sum.dto';

@Controller('api/')
export class AppController {
    constructor (
        private readonly appService: AppService,
        ) {}

    @Get('/:name')
    async hello(@Param('name') name: string): Promise<string> {
        return (this.appService.hello(name));
    }

    @Post('/sum')
    async sum(@Body() body: SumDto): Promise<number> {
        return (await this.appService.sum(body));
    }

    @Post('/pow')
    async pow(@Body() body: PowDto): Promise<number> {
        return (await this.appService.pow(body));
    }
}
