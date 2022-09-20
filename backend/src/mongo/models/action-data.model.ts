import { ActionEnum, SeverityEnum } from '../db/enums';

export interface ActionDataModel {
    action: ActionEnum;
    severity: SeverityEnum;
    timestamp: number;
}
