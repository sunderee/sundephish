import { Body, Controller, Post, Req } from '@nestjs/common';
import { FastifyRequest } from 'fastify';
import { SubmitRequestModel } from './models/submit-request.model';
import { SubmitResponseModel } from './models/submit-response.model';
import { SubmitService } from './submit.service';

@Controller('submit')
export class SubmitController {
    constructor(private readonly submitService: SubmitService) {}

    @Post()
    async submit(
        @Req() rawRequest: FastifyRequest,
        @Body() model: SubmitRequestModel
    ): Promise<SubmitResponseModel> {
        return this.submitService.processSubmitRequest(
            model,
            rawRequest.ip,
            rawRequest.headers['user-agent'] ?? 'unknown'
        );
    }
}
