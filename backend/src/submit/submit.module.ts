import { Module } from '@nestjs/common';
import { MongoModule } from '../mongo/mongo.module';
import { SubmitController } from './submit.controller';
import { SubmitService } from './submit.service';

@Module({
    imports: [MongoModule],
    controllers: [SubmitController],
    providers: [SubmitService]
})
export class SubmitModule {}
