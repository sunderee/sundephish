import { Injectable } from '@nestjs/common';
import { MongoService } from '../mongo/mongo.service';

@Injectable()
export class CollectService {
    constructor(private readonly mongoService: MongoService) {}
}
