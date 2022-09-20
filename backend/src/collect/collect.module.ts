import { Module } from '@nestjs/common';
import { MongoModule } from '../mongo/mongo.module';
import { CollectController } from './collect.controller';
import { CollectService } from './collect.service';

@Module({
    imports: [MongoModule],
    controllers: [CollectController],
    providers: [CollectService]
})
export class CollectModule {}
