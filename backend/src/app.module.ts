import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { MongoModule } from './mongo/mongo.module';

@Module({
    imports: [
        ConfigModule.forRoot({ isGlobal: true, ignoreEnvFile: false }),
        MongooseModule.forRootAsync({
            imports: [ConfigModule],
            inject: [ConfigService],
            useFactory: (configService: ConfigService) => ({
                uri:
                    configService.get<string>('MONGO_DB_URL') ||
                    'mongodb://localhost/development'
            })
        }),
        MongoModule
    ]
})
export class AppModule {}
