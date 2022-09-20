import { Controller, Get, Query, Req } from '@nestjs/common';
import { FastifyRequest } from 'fastify';
import { CollectService } from './collect.service';
import { CollectModel } from './models/collect.model';

@Controller('collect')
export class CollectController {
    constructor(private readonly collectService: CollectService) {}

    @Get()
    async collectAll(
        @Req() rawRequest: FastifyRequest,
        @Query('groupID') groupID?: string
    ): Promise<Array<CollectModel>> {
        const xAuth = rawRequest.headers['x-auth'] as string | undefined;
        return this.collectService.collect(xAuth, groupID);
    }
}
