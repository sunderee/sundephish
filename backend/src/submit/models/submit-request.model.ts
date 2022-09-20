import { ActionEnum } from '../../mongo/db';

export class SubmitRequestModel {
    id!: string;
    groupID!: string;
    action!: ActionEnum;
}
