import {
    getConnectionToken,
    MongooseModule,
    MongooseModuleOptions
} from '@nestjs/mongoose';
import { Test, TestingModule } from '@nestjs/testing';
import { MongoMemoryServer } from 'mongodb-memory-server';
import { Connection } from 'mongoose';
import { Action, ActionEnum, ActionSchema, actionToSeverity } from './db';
import { ActionDataModel, ActionModel } from './models';
import { MongoService } from './mongo.service';

let inMemoryMongoDB: MongoMemoryServer;

const rootMongooseTestModule = (options: MongooseModuleOptions = {}) =>
    MongooseModule.forRootAsync({
        useFactory: async () => {
            inMemoryMongoDB = await MongoMemoryServer.create();
            const mongoUri = inMemoryMongoDB.getUri();
            return {
                uri: mongoUri,
                ...options
            };
        }
    });

const closeInMemoryMongoDBConnection = async () => {
    if (inMemoryMongoDB) {
        await inMemoryMongoDB.stop();
    }
};

describe('MongoService', () => {
    let service: MongoService;
    let connection: Connection;

    beforeEach(async () => {
        const module: TestingModule = await Test.createTestingModule({
            imports: [
                rootMongooseTestModule(),
                MongooseModule.forFeature([
                    { name: Action.name, schema: ActionSchema }
                ])
            ],
            providers: [MongoService]
        }).compile();

        service = module.get<MongoService>(MongoService);
        connection = module.get(getConnectionToken());
    });

    afterEach(async () => {
        await connection.close(true);
        await closeInMemoryMongoDBConnection();
    });

    it('should be defined', () => {
        expect(service).toBeDefined();
    });

    it('should correctly add entries to the DB', async () => {
        const id = '12345678';
        const groupID = 'test';
        const ipAddress = '192.168.0.1';
        const userAgent1 = 'abc';
        const userAgent2 = 'bcd';

        await service.create(
            {
                id: id,
                groupID: groupID,
                ipAddress: ipAddress,
                userAgent: userAgent1
            } as ActionModel,
            {
                action: ActionEnum.OPEN_BROWSER,
                severity: actionToSeverity(ActionEnum.OPEN_BROWSER),
                timestamp: 1567
            } as ActionDataModel
        );
        await service.create(
            {
                id: id,
                groupID: groupID,
                ipAddress: ipAddress,
                userAgent: userAgent1
            } as ActionModel,
            {
                action: ActionEnum.CLICK_FORGOT_PASSWORD,
                severity: actionToSeverity(ActionEnum.CLICK_FORGOT_PASSWORD),
                timestamp: 1673
            } as ActionDataModel
        );
        await service.create(
            {
                id: id,
                groupID: groupID,
                ipAddress: ipAddress,
                userAgent: userAgent2
            } as ActionModel,
            {
                action: ActionEnum.OPEN_BROWSER,
                severity: actionToSeverity(ActionEnum.OPEN_BROWSER),
                timestamp: 1779
            } as ActionDataModel
        );
        await service.create(
            {
                id: id,
                groupID: groupID,
                ipAddress: ipAddress,
                userAgent: userAgent2
            } as ActionModel,
            {
                action: ActionEnum.CLICK_FORGOT_PASSWORD,
                severity: actionToSeverity(ActionEnum.CLICK_FORGOT_PASSWORD),
                timestamp: 1879
            } as ActionDataModel
        );
        await service.create(
            {
                id: id,
                groupID: groupID,
                ipAddress: ipAddress,
                userAgent: userAgent2
            } as ActionModel,
            {
                action: ActionEnum.SUBMITTED_CREDENTIALS,
                severity: actionToSeverity(ActionEnum.SUBMITTED_CREDENTIALS),
                timestamp: 1879
            } as ActionDataModel
        );

        const allActions = await service.readAll();
        const allActionsByGroupID = await service.readAllByGroupID('test');

        expect(allActions.length).toBe(allActionsByGroupID.length);
        expect(
            allActions.find((value) => value.userAgent == 'abc')?.actions.length
        ).toEqual(2);
        expect(
            allActions.find((value) => value.userAgent == 'bcd')?.actions.length
        ).toEqual(3);
    });
});
