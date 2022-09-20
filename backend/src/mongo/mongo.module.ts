import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { Action, ActionSchema } from './db';
import { MongoService } from './mongo.service';

@Module({
    imports: [
        MongooseModule.forFeature([{ name: Action.name, schema: ActionSchema }])
    ],
    providers: [MongoService],
    exports: [MongoService]
})
export class MongoModule {}
