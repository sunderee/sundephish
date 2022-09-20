import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Action, ActionDocument, ActionResultEnum } from './db';
import { ActionDataModel, ActionModel } from './models';

@Injectable()
export class MongoService {
    constructor(
        @InjectModel(Action.name)
        private readonly actionModel: Model<ActionDocument>
    ) {}

    readAll = async (): Promise<Array<Action>> =>
        await this.actionModel.find().exec();

    readAllByGroupID = async (groupID: string): Promise<Array<Action>> =>
        await this.actionModel.find({ groupID: groupID }).exec();

    async create(
        action: ActionModel,
        data: ActionDataModel
    ): Promise<ActionResultEnum> {
        const existingAction: Action | null = await this.actionModel
            .findOne({
                id: action.id,
                groupID: action.groupID,
                ipAddress: action.ipAddress,
                userAgent: action.userAgent
            })
            .exec();
        if (existingAction != null) {
            const actionData = existingAction.actions;
            actionData.push(data);
            await this.actionModel
                .findOneAndUpdate(
                    {
                        id: action.id,
                        groupID: action.groupID,
                        ipAddress: action.ipAddress,
                        userAgent: action.userAgent
                    },
                    { actions: actionData }
                )
                .exec();
            return ActionResultEnum.UPDATED;
        }

        await this.actionModel.create({ ...action, actions: [data] });
        return ActionResultEnum.NEWLY_CREATED;
    }
}
