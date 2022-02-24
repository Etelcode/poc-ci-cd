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
        // VX used to trigger a commit to test versions
        return (await this.appService.hello(name) + ": v18");
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
