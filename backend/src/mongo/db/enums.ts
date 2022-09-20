export enum ActionResultEnum {
    NEWLY_CREATED,
    UPDATED
}

export enum SeverityEnum {
    LOW,
    MEDIUM,
    HIGH
}

export enum ActionEnum {
    OPEN_BROWSER,
    CLICK_SIGN_UP,
    CLICK_FORGOT_PASSWORD,
    SUBMITTED_CREDENTIALS
}

export const actionToSeverity = (action: ActionEnum): SeverityEnum =>
    actionToSeverityMap[action] || SeverityEnum.LOW;

const actionToSeverityMap: Record<number, SeverityEnum> = {
    0: SeverityEnum.LOW,
    1: SeverityEnum.LOW,
    2: SeverityEnum.MEDIUM,
    3: SeverityEnum.HIGH
};
