import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MongoModule } from '../mongo/mongo.module';
import { CollectController } from './collect.controller';
import { CollectService } from './collect.service';

@Module({
    imports: [MongoModule, ConfigModule],
    controllers: [CollectController],
    providers: [CollectService]
})
export class CollectModule {}
