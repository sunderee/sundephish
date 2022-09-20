import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { ActionEnum, SeverityEnum } from './enums';

@Schema()
export class ActionData {
    @Prop({
        type: Number,
        enum: ActionEnum,
        required: true
    })
    action!: ActionEnum;

    @Prop({
        type: Number,
        enum: SeverityEnum,
        default: SeverityEnum.LOW,
        required: true
    })
    severity!: SeverityEnum;

    @Prop({ type: Number, min: 0, max: 2_147_483_647, required: true })
    timestamp!: number;
}

export const ActionDataSchema = SchemaFactory.createForClass(ActionData);

@Schema()
export class Action {
    @Prop({ type: String, minlength: 8, maxlength: 8, required: true })
    id!: string;

    @Prop({ type: String, minlength: 1, maxlength: 20, required: true })
    groupID!: string;

    @Prop({ type: String, minlength: 7, maxlength: 39, required: true })
    ipAddress!: string;

    @Prop({ type: String, minlength: 1, required: true })
    userAgent!: string;

    @Prop({ type: [ActionDataSchema], default: [] })
    actions!: ActionData[];
}

export const ActionSchema = SchemaFactory.createForClass(Action);
