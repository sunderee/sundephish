import { Document } from 'mongoose';
import { Action, ActionData } from './schemas';

export type ActionDocument = Action & Document;
export type ActionDataDocument = ActionData & Document;
