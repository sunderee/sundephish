import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { CollectModule } from './collect/collect.module';
import { MongoModule } from './mongo/mongo.module';
import { SubmitModule } from './submit/submit.module';

@Module({
    imports: [
        ConfigModule.forRoot({ isGlobal: true, ignoreEnvFile: false }),
        MongooseModule.forRootAsync({
            imports: [ConfigModule],
            inject: [ConfigService],
            useFactory: (configService: ConfigService) => ({
                uri:
                    configService.get<string>('MONGO_URL') ||
                    'mongodb://localhost/development'
            })
        }),
        MongoModule,
        SubmitModule,
        CollectModule
    ]
})
export class AppModule {}
