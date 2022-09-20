import { Injectable } from '@nestjs/common';
import { actionToSeverity } from '../mongo/db';
import { ActionDataModel, ActionModel } from '../mongo/models';
import { MongoService } from '../mongo/mongo.service';
import { SubmitRequestModel } from './models/submit-request.model';
import { SubmitResponseModel } from './models/submit-response.model';

@Injectable()
export class SubmitService {
    constructor(private readonly mongoService: MongoService) {}

    async processSubmitRequest(
        model: SubmitRequestModel,
        ipAddress: string,
        userAgent: string
    ): Promise<SubmitResponseModel> {
        const timestamp = Math.round(Date.now() / 1000);
        const result = await this.mongoService.create(
            {
                id: model.id,
                groupID: model.groupID,
                ipAddress: ipAddress,
                userAgent: userAgent
            } as ActionModel,
            {
                action: model.action,
                severity: actionToSeverity(model.action),
                timestamp: timestamp
            } as ActionDataModel
        );

        return new SubmitResponseModel(result, timestamp);
    }
}
