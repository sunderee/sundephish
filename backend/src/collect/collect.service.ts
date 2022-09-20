import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Action, ActionEnum } from '../mongo/db';
import { MongoService } from '../mongo/mongo.service';
import { CollectModel } from './models/collect.model';
import { ErrorModel } from './models/error.model';
import { OverviewModel } from './models/overview.model';

@Injectable()
export class CollectService {
    constructor(
        private readonly mongoService: MongoService,
        private readonly configService: ConfigService
    ) {}

    async collect(
        xAuthHeader: string | undefined,
        groupID?: string
    ): Promise<Array<CollectModel>> {
        if (xAuthHeader == undefined) {
            throw new HttpException(
                new ErrorModel(
                    HttpStatus.UNAUTHORIZED,
                    'Missing x-auth header'
                ),
                HttpStatus.UNAUTHORIZED
            );
        }

        const expectedXAuthHeader = this.configService.get<string>('XAUTH');
        if (expectedXAuthHeader != xAuthHeader) {
            throw new HttpException(
                new ErrorModel(
                    HttpStatus.FORBIDDEN,
                    'Incorrect x-auth credentials'
                ),
                HttpStatus.UNAUTHORIZED
            );
        }

        const actions =
            groupID != undefined
                ? await this.mongoService.readAllByGroupID(groupID)
                : await this.mongoService.readAll();
        const uniqueGroupsSet = new Set(actions.map((value) => value.groupID));
        return Array.from(uniqueGroupsSet.values()).map((value) =>
            this.collectForGroup(actions, value)
        );
    }

    private collectForGroup(
        data: Array<Action>,
        groupID: string
    ): CollectModel {
        const results = data.filter((value) => value.groupID == groupID);
        const actions = results
            .map((value) => value.actions)
            .reduce((previous, current) => previous.concat(current), []);

        return new CollectModel(
            groupID,
            results
                .filter((value) => (value.groupID = groupID))
                .map((value) => value.actions)
                .reduce(
                    (previous, current) => previous.concat(current),
                    []
                ).length,
            new OverviewModel(
                actions.filter(
                    (value) => value.action == ActionEnum.OPEN_BROWSER
                ).length,
                actions.filter(
                    (value) => value.action == ActionEnum.CLICK_SIGN_UP
                ).length,
                actions.filter(
                    (value) => value.action == ActionEnum.CLICK_FORGOT_PASSWORD
                ).length,
                actions.filter(
                    (value) => value.action == ActionEnum.SUBMITTED_CREDENTIALS
                ).length
            )
        );
    }
}
